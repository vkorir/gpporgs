<?php

require_once dirname(__FILE__) . '/../google-api/config.php';

session_start();

// google oauth v2 endpoint
add_action('rest_api_init', function () {
    register_rest_route('oauth/v2', 'callback', array(
        'methods' => WP_REST_Server::READABLE,
        'callback' => 'google_callback'
    ));
    register_rest_route('oauth/v2', 'logout', array(
        'methods' => WP_REST_Server::READABLE,
        'callback' => 'logout'
    ));
});
function google_callback(WP_REST_Request $request) {
    $code = $request->get_param('code');
    if ($code == null) {
        return 'invalid access code.';
    }

    global $client;
    $client->fetchAccessTokenWithAuthCode($code);

    // fetch user attributes from Google API
    $obj_res = new Google_Service_Oauth2($client);
    $user_data = $obj_res->userinfo_v2_me->get();
    $email = $user_data['email'];
    $username = strtolower(substr($user_data['email'], 0, strpos($email, '@')));

    // check if existing user

    $user = get_user_by('email', $email);
    if ($user == false) {
        wp_redirect(home_url());
        exit();
    }
    $user_details = array(
        'ID' => $user->ID,
        'user_login' => $username,
        'first_name' => ucfirst(strtolower($user_data['givenName'])),
        'last_name' => ucfirst(strtolower($user_data['familyName']))
    );
    wp_update_user($user_details);

    // login current user
    wp_signon(array('user_login' => $username), true);
    wp_set_current_user($user->ID);
    wp_set_auth_cookie($user->ID);

    wp_redirect(home_url());
    exit();
}
function logout() {
    wp_clear_auth_cookie();
    wp_redirect(home_url());
    exit();
}

// rewrite endpoints for organization details & add experience pages
add_action('init', function () {
    add_rewrite_endpoint('organization-details', EP_PERMALINK, '');
    add_rewrite_endpoint('add-experience', EP_PERMALINK, '');
    add_rewrite_endpoint('new-organization', EP_PERMALINK, '');
    add_rewrite_endpoint('admin', EP_PERMALINK, '');
});
add_action('template_redirect', function () {
    global $wp;
    if ($wp->request == 'organization-details') {
        include get_template_directory() . '/pages/organization-details.php';
        die;
    }
    if ($wp->request == 'add-experience') {
        include get_template_directory() . '/pages/add-experience.php';
        die;
    };
    if ($wp->request == 'new-organization') {
        include get_template_directory() . '/pages/new-organization.php';
        die;
    }
    if ($wp->request == 'admin') {
        include get_template_directory() . '/pages/admin-tools.php';
        die;
    }
    return;
});

// get user role
add_action('wp_ajax_session_state', 'get_session_state');
add_action('wp_ajax_nopriv_session_state', 'get_session_state');
function get_session_state() {
    $session_state = array(
        'user' => array(
            'name' => wp_get_current_user()->user_firstname,
            'email' => wp_get_current_user()->user_email,
            'roles' => wp_get_current_user()->roles
        ),
        'dataTableFilters' => array(
            'area' => 'all',
            'sector' => 'all'
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

    $query = 'select id, name, type, country, sectors, region from gpp_details';
    $query .= $area_options[$_GET['area']];
    if ($_GET['sector'] != 'all') {
        $query .= ' and sectors like "%' . $_GET['sector'] . '%"';
    }
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

// approve organization
add_action('wp_ajax_approve_org', 'approve_organization');
add_action('wp_ajax_nopriv_approve_org', 'approve_organization');
function approve_organization() {
    global $wpdb;
    $wpdb->update('gpp_details', array('approved_status' => 1), array('id' => $_GET['organizationId']));
    wp_die();
}

function is_access_code_verified() {
    return $_SESSION['access_code_verified'];
}

// verify and update access code
add_action('wp_ajax_verify_access_code', 'verify_access_code');
add_action('wp_ajax_nopriv_verify_access_code', 'verify_access_code');
function verify_access_code() {
    global $wpdb;
    $response = $wpdb->get_row('select access_code from gpp_access_code;');
    if ($_GET['accessCode'] == $response->access_code) {
        $_SESSION['access_code_verified'] = true;
        wp_send_json(array('success' => true));
    }
    wp_send_json(array('success' => false));
}

// handle new organization
add_action('wp_ajax_register_organization', 'register_organization');
add_action('wp_ajax_nopriv_register_organization', 'register_organization');
function register_organization() {
    store_organization_details();
    $_SESSION['access_code_verified'] = false;
    wp_die();
}

// handle form submission
add_action('wp_ajax_submission', 'submission');
add_action('wp_ajax_nopriv_submission', 'submission');
function submission() {
    global $wpdb;

    $user = $_POST['user'];
    $review = $_POST['review'];

    $organization_id = store_organization_details();
    if ($organization_id == 0) {
        wp_die();
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

function store_organization_details() {
    global $wpdb;
    if ($_POST['organization']) {
        $organization = $_POST['organization'];

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
            $details = array_merge(array('id' => $organization_id), $details);
            $format = array_merge(array('%d'), $format);
            $wpdb->replace($tableName, $details, $format);
        } else {
            $wpdb->insert($tableName, $details, $format);
            $organization_id = $wpdb->insert_id;
        }
        return $organization_id;
    }
    return false;
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
        'description' => $state['description'],
        'affiliations' => $state['affiliations'],
        'type' => $state['type'],
        'country' => $state['country'],
        'region' => $state['region'],
        'sectors' => $state['sectors'],
        'approved_status' => 0
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
