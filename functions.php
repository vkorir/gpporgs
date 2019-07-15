<?php

// UI utility functions

function page_title($value) {
    return '<div class="text-center"><h3 class="display-5">' . $value . '</h3></div>';
}

function section_heading($value) {
    return '<h6 class="section-heading">' . $value . '</h6>' . '<hr />';
}

function section_subheading($value) {
    return '<h6 class="section-subheading">' . $value . '</h6>';
}

function subsection_heading($name, $value, $directive) {
    return '<label class="mt-2 mb-0" for="' .$name . '">' . $value . '<span class="directive">' . $directive . '</span></label>';
}

function radio_button_util($id, $value) {
    return '<label class="label-container w-100">
                 <input id="' . $id . '" type="checkbox" data-value="'. $value .    '">
                 <span class="checkmark"></span>
                    ' . $value . '
            </label>';
}

function radio_buttons($array) {
    $res = '';
    foreach ($array as $key => $value) {
        $res .= radio_button_util($key, $value);
    }
    return $res;
}

function slider_js_onchange($source_id, $target_id) {
    $jquery_val = '$(\'#' . $source_id .'\').val()';
    return '$(\'#' . $target_id . '\').val(' . $jquery_val . ');';
}


function slider($title, $class, $id, $value, $min, $max, $step) {
    $source_id = $id . '-slider';
    $target_id = $id . '-display';
    $price_display = '<h6 class="section-subheading">' . $title . ': $<input class="slider-value-display" type="number" name="' . $target_id . '" id="' . $target_id . '" value="' . $value . '" disabled /></h6>';
    $slider = '<input class="price-range-slider ' . $class . '" id="' . $source_id . '" type="range" min="'. $min . '" max="' . $max . '" step="' . $step .'" onchange="'. slider_js_onchange($source_id, $target_id) . '" />';
    return $price_display . $slider;
}

function fieldset_item($name, $type, $value) {
    return '<div>
              <label class="col-lg-2 col-md-2 col-sm-1 m-0" for="' . $name . '">' . $value . ': </label>
              <input class="col-lg-9 col-md-6 col-sm-8 px-1 m-0" type="' . $type . '" name="' . $name . '" id="' . $name . '" />
            </div>';
}

function get_regions() {
    return array('North America', 'Mexico / Central America', 'South America', 'Europe', 'Middle East / North Africa', 'Sub-Saharan Africa', 'India', 'China', 'Other');
}

// return countries
function get_countries() {
    global $wpdb;
    $options = '';
    foreach ($wpdb->get_results('select name from gpp_countries;') as $country) {
        $options .= '<option>' . $country->name . '</option>';
    }
    return $options;
}

// load stylesheets
add_action('wp_enqueue_scripts', 'load_stylesheets');
function load_stylesheets() {
    wp_register_style('jquery_ui_css', get_template_directory_uri() . '/css/jquery-ui.min.css', array(), false, 'all');
    wp_enqueue_style('jquery_ui_css');

	wp_register_style('bootstrap', get_template_directory_uri() . '/css/bootstrap.min.css', array(), false, 'all');
	wp_enqueue_style('bootstrap');

    wp_register_style('custom_style', get_template_directory_uri() . '/style.css', array(), false, 'all');
    wp_enqueue_style('custom_style');
}


// include jquery library
add_action('wp_enqueue_scripts', 'include_jquery');
function include_jquery() {
	wp_deregister_script('jquery');
	wp_enqueue_script('jquery', get_template_directory_uri() . '/js/jquery-3.3.1.min.js', '', 1, true);
	add_action('wp_enqueue_scripts', 'jquery');
}


// load datatable library
add_action('wp_enqueue_scripts', 'datatable_resources');
function datatable_resources() {
    wp_enqueue_script('jquery_ui_js', get_template_directory_uri() . '/js/jquery-ui.min.js', '', 1, true);
    add_action('wp_enqueue_scripts', 'jquery_ui_js');

    wp_register_style('datatable_css', get_template_directory_uri() . '/css/datatables.min.css', array(), false, 'all');
    wp_enqueue_style('datatable_css');

    wp_register_script('datatable_js', get_template_directory_uri() . '/js/datatables.min.js', '', 1, true);
    wp_enqueue_script('datatable_js');
}

// load custom js
add_action('wp_enqueue_scripts', 'load_js');
function load_js() {
	wp_register_script('custom_js', get_template_directory_uri() . '/js/scripts.js', array(), 1, true);
	wp_enqueue_script('custom_js');
}

// get user role
add_action('wp_ajax_session_state', 'get_session_state');
add_action('wp_ajax_nopriv_session_state', 'get_session_state');
function get_session_state() {
    $user = wp_get_current_user();
    $session_state = array(
        'session' => $_SESSION,
        'cookie' => $_COOKIE,
        'user' => array(
            'name' => $user->user_firstname,
            'email' => $user->user_email,
            'roles' => $user->roles,
            'user_object' => $user
        ),
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