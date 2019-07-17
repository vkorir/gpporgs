<?php

require_once dirname(__FILE__) . '/../google-api/config.php';

// google oauth v2 endpoint
add_action('rest_api_init', function () {
    register_rest_route('oauth/v2', 'callback', array(
        'methods' => WP_REST_Server::READABLE,
        'callback' => 'google_callback'
    ));
});
function google_callback(WP_REST_Request $request) {
    $code = $request->get_param('code');
    if ($code == null) {
        wp_redirect(home_url());
        exit();
    }

    global $client;
    $client->fetchAccessTokenWithAuthCode($code);

    // fetch user attributes from Google API
    $obj_res = new Google_Service_Oauth2($client);
    $user_data = $obj_res->userinfo_v2_me->get();
    $email = $user_data['email'];
    $username = strtolower(substr($user_data['email'], 0, strpos($email, '@')));

    // check if existing user

    $user = get_user_by('login', $username);
    if ($user == false) { // register a new user
        $user_details = array(
            'user_login' => $username,
            'user_email' => $email,
            'user_pass' => wp_generate_password(16, false),
            'first_name' => ucfirst(strtolower($user_data['givenName'])),
            'last_name' => ucfirst(strtolower($user_data['familyName'])),
            'role' => 'contributor'
        );
        $user = new WP_User(wp_insert_user($user_details));
    }

    // login current user
    wp_signon(array('user_login' => $user->user_login), true);
    wp_set_current_user($user->ID);
    wp_set_auth_cookie($user->ID);
    do_action('wp_login', $user->user_login, $user);

    setcookie('access_token', $client->getAccessToken());
    wp_redirect(home_url());
    exit();
}

// handle logout
add_action('rest_api_init', function () {
    register_rest_route('oauth/v2', 'logout', array(
        'methods' => WP_REST_Server::READABLE,
        'callback' => function() {
            wp_logout();
            wp_clear_auth_cookie();
            wp_redirect(home_url());
        }
    ));
});

// rewrite add-experience page endpoint url
add_action('init', function () {
    add_rewrite_endpoint('add-experience', EP_PERMALINK);
});
add_action('template_redirect', function () {
    if (is_singular() && get_query_var('add-experience')) {
        include dirname(__FILE__) . '/../add-experience.php';
        die;
    }
});


// get user role
add_action('wp_ajax_session_state', 'get_session_state');
add_action('wp_ajax_nopriv_session_state', 'get_session_state');
function get_session_state() {
    global $client;
    $session_state = array(
        'user' => get_current_user(),
        'cookie' => $_COOKIE,
        'token' => $client->getAccessToken(),
        'dataTableFilters' => array(
            'area' => 'all',
            'sector' => 'all',
            'price' => 5000
        ),
        'organization' => array(
            'affiliations' => array(),
            'sectors' => array(),
            'contacts' => array(
                array(),
                array(),
                array()
            )
        ),
        'review' => array(
            'sectors' => array(),
            'stipend' => '5000',
            'cost' => '5000'
        )
    );
    wp_send_json($session_state);
    exit();
}

// fetch datatable data
add_action('wp_ajax_datatable_data', 'get_datatable_data');
add_action('wp_ajax_nopriv_datatable_data', 'get_datatable_data');
function get_datatable_data() {
    global $wpdb;
    $area_options = array(
        'all' => ' where country like "%"',
        'domestic' => ' where country = "united states"',
        'international' => ' where country != "united states"'
    );

    $query = 'select id, name, type, country, sectors, region, average_cost from gpp_details';
    $query .= $area_options[$_GET['area']];
    if ($_GET['sector'] != 'all') {
        $query .= ' and sectors like "%' . $_GET['sector'] . '%"';
    }
    $query .= ' and average_cost <= ' . intval($_GET['price']);
    wp_send_json($wpdb->get_results($query));
}

// fetch organization names
add_action('wp_ajax_organization_autocomplete', 'organization_name_autocomplete');
add_action('wp_ajax_nopriv_organization_autocomplete', 'organization_name_autocomplete');
function organization_name_autocomplete() {
    global $wpdb;
    $query = 'select id, name from gpp_details where name like \'%' . $_GET['prefix'] . '%\'';
    wp_send_json($wpdb->get_results($query));
}


// fetch organization info
add_action('wp_ajax_organization_details', 'get_organization_details');
add_action('wp_ajax_nopriv_organization_details', 'get_organization_details');
function get_organization_details() {
    global $wpdb;
    $details = $wpdb->get_row('select * from gpp_details where id=' . $_GET['organizationId']);
    $address = $wpdb->get_row('select * from gpp_addresses where id=' . $details->address_id);
    $contacts = array();
    foreach (explode('^', $details->contact_ids) as $id) {
        $query = 'select * from gpp_contacts where id=' . $id;
        array_push($contacts, $wpdb->get_row($query));
    }
    wp_send_json(array($details, $address, $contacts));
}

// fetch organization reviews
add_action('wp_ajax_organization_reviews', 'get_organization_reviews');
add_action('wp_ajax_nopriv_organization_reviews', 'get_organization_reviews');
function get_organization_reviews() {
    global $wpdb;
    $query = 'select * from gpp_reviews where organization_id=' . $_GET['organizationId'] . ' order by timestamp desc';
    $reviews = $wpdb->get_results($query);
    foreach ($reviews as $key => $value) {
        $query = 'select * from gpp_addresses where id=' . $value->address_id;
        $value->address = $wpdb->get_row($query);
    }
    wp_send_json($reviews);
}

// handle form submission
add_action('wp_ajax_submission', 'submission');
add_action('wp_ajax_nopriv_submission', 'submission');
function submission() {
    global $wpdb;

    $user = $_POST['user'];
    $organization = $_POST['organization'];
    $review = $_POST['review'];

    // store organization address
    $tableName = 'gpp_addresses';
    $address_id = $organization['addressId'];
    $address = address_util($organization);
    $format = array('%s', '%s', '%s', '%s', '%s');
    if (isset($organization['id'])) {
        $address = array_merge(array('id' => $address_id), $address);
        $format = array_merge(array('%d'), $format);
        $wpdb->replace($tableName, $address, $format);
    } else {
        $wpdb->insert($tableName, $address, $format);
        $address_id = $wpdb->insert_id;
    }

    // store org contact
    $tableName = 'gpp_contacts';
    $format = array('%s', '%s', '%s', '%s');
    $ids = array();
    if (isset($organization['id'])) {
        $format = array_merge(array('%d'), $format);
        $ids = explode('^', $organization['contactIds']);
    }
    for ($i = 0; $i < 3; $i++) {
        $contact = contacts_util($organization['contacts'][$i]);
        if (isset($organization['id'])) {
            $contact = array_merge(array('id' => $ids[$i]), $contact);
            $wpdb->replace($tableName, $contact, $format);
        } else {
            $wpdb->insert($tableName, $contact, $format);
            array_push($ids, $wpdb->insert_id);
        }
    }
    $contact_ids = join('^', $ids);


    // store organization details
    $tableName = 'gpp_details';
    $organization_id = $organization['id'];
    $details = details_util($organization, $address_id, $contact_ids);
    $format = array('%d', '%s', '%s', '%s', '%s', '%s', '%s', '%s', '%s', '%s', '%s', '%s', '%s', '%d');
    if (isset($organization['id'])) {
        $review_cost = intval($review['cost']);
        $average_cost = intval($organization['averageCost']);
        $num_reviews = intval($organization['numReviews']);
        $details['average_cost'] = ($review_cost + $average_cost * $num_reviews) / ($num_reviews + 1);
        $details['num_reviews'] = $num_reviews + 1;
        $details = array_merge(array('id' => $organization_id), $details);
        $format = array_merge(array('%d'), $format);
        $wpdb->replace($tableName, $details, $format);
    } else {
        $details['average_cost'] = $review['cost'];
        $wpdb->insert($tableName, $details, $format);
        $organization_id = $wpdb->insert_id;
    }

    // store review address
    $tableName = 'gpp_addresses';
    $address = address_util($review);
    $format = array('%s', '%s', '%s', '%s', '%s');
    $wpdb->insert($tableName, $address, $format);
    $address_id = $wpdb->insert_id;

    // store review
    $tableName = 'gpp_reviews';
    $review = reviews_util($review, $address_id, $organization_id, $user);
    $format = array('%d', '%d', '%s', '%s', '%s', '%s', '%d', '%d', '%s', '%s', '%s', '%s', '%s', '%d', '%d', '%s', '%s', '%s', '%s');
    $wpdb->insert($tableName, $review, $format);

    wp_die();
}

function address_util($state) {
    return array(
        'street' => $state['street'],
        'city' => $state['city'],
        'state' => $state['state'],
        'zipCode' => $state['zipCode'],
        'country' => $state['country']
    );
}

function contacts_util($state) {
    return array(
        'name' => $state['name'],
        'role' => $state['role'],
        'phone' => $state['phone'],
        'email' => $state['email']
    );
}

function details_util($state, $address_id, $contact_ids) {
    return array(
        'address_id' => $address_id,
        'contact_ids' => $contact_ids,
        'name' => $state['name'],
        'phone' => $state['phone'],
        'email' => $state['email'],
        'website' => $state['website'],
        'affiliations' => $state['affiliations'],
        'type' => $state['type'],
        'country' => $state['country'],
        'region' => $state['region'],
        'sectors' => $state['sectors'],
        'approved_status' => 0,
        'average_cost' => 0,
        'num_reviews' => 1
    );
}

function reviews_util($state, $address_id, $organization_id, $user) {
    return array(
        'address_id' => $address_id,
        'organization_id' => $organization_id,
        'region' => $state['region'],
        'languages' => $state['languages'],
        'difficulties' => $state['languageDifficulties'],
        'sectors' => $state['sectors'],
        'stipend' => $state['stipend'],
        'cost' => $state['cost'],
        'duration' => $state['duration'],
        'what_you_did' => $state['whatYouDid'],
        'typical_day' => $state['typicalDay'],
        'strength_and_weaknesses' => $state['strengthsAndWeaknesses'],
        'other_comments' => $state['otherComments'],
        'safety_score' => $state['safety'],
        'responsiveness' => $state['responsiveness'],
        'reviewer_name' => $user['name'],
        'reviewer_email' => $user['email'],
        'anonymous_review' => $state['anonymousReview'],
        'timestamp' => $state['timeStamp']
    );
}
