<?php

// handle sessions
add_action('init', 'start_session', 1);
function start_session() {
    if (!session_id()) {
        session_start();
    }
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
	wp_register_script('custom_js', get_template_directory_uri() . '/js/scripts.js', '', 1, true);
	wp_enqueue_script('custom_js');
}


// redirect wp-logout to logout page
add_action('wp_logout', 'redirect_logout');
function redirect_logout() {
	wp_redirect(home_url('/logout'));
	exit();
}


// redirect wp-login to login page
add_action('init', 'redirect_login');
function redirect_login() {
	global $pagenow;
	if ($pagenow == 'wp-login.php' && !isset($_SESSION['access_token'])) {
		wp_redirect(home_url());
		exit();
	}
}


// fetch database records
add_action('wp_ajax_database_records', 'database_records');
add_action('wp_ajax_nopriv_database_records', 'database_records');
function database_records() {
    $table = 'gpporgs_organization_info';
    $primaryKey = 'id';
    $columns = array(
        array('db' => 'name', 'dt' => 0),
        array('db' => 'type', 'dt' => 1),
        array('db' => 'location', 'dt' => 2),
        array('db' => 'sectors', 'dt' => 3)
    );
    $sql_details = array(
        'user' => DB_USER,
        'pass' => DB_PASSWORD,
        'db' => DB_NAME,
        'host' => DB_HOST
    );

    require('ssp.class.php');

    echo json_encode(
        SSP::simple( $_GET, $sql_details, $table, $primaryKey, $columns )
    );
    wp_die();
}


// handle form submission
add_action('wp_ajax_submission', 'submission');
add_action('wp_ajax_nopriv_submission', 'submission');
function submission() {
    global $wpdb;

    // store org address
    $table = 'gppporgs_addresses';
    $data = get_organization_pe_address_data('organization');
    $format = array('%s', '%s', '%s', '%d', '%s', '%s');
    $wpdb->insert($table, $data, $format);
    $addr_id = $wpdb->insert_id;

    // store org contact
    $table = 'gpporgs_organization_contacts';
    $data = get_organization_contacts_data();
    $format = array('%s', '%s', '%s', '%s', '%s', '%s', '%s', '%s', '%s', '%s', '%s', '%s');
    $wpdb->insert($table, $data, $format);
    $contacts_id = $wpdb->insert_id;


    // store org info
    $table = 'gpporgs_organization_info';
    $data = get_organization_info_data($addr_id, $contacts_id);
    $format = array('%s', '%d', '%s', '%s', '%s', '%s', '%s', '%d', '%d');
    $wpdb->insert($table, $data, $format);
    $organization_id = $wpdb->insert_id;

    // store review address
    $table = 'gpporgs_addresses';
    $data = get_organization_pe_address_data('physicalExperience');
    $format = array('%s', '%s', '%s', '%d', '%s', '%s');
    $wpdb->insert($table, $data, $format);
    $addr_id = $wpdb->insert_id;

    // store org review
    $table = 'gpporgs_organization_reviews';
    $data = get_organization_review_data($organization_id, $addr_id);
    $format = array('%d', '%d', '%s', '%s', '%s', '%d', '%d', '%s', '%s', '%s', '%s', '%s', '%d', '%d');
    $wpdb->insert($table, $data, $format);

    return "success!";
}

function get_organization_pe_address_data($prefix) {
    return array(
        'street' => $_POST[$prefix . 'Street'],
        'city' => $_POST[$prefix . 'City'],
        'state' => $_POST[$prefix . 'State'],
        'zipcode' => $_POST[$prefix . 'ZipCode'],
        'region' => $_POST[$prefix . 'Region'],
        'country' => $_POST[$prefix . 'Country']
    );
}

function get_organization_contacts_data() {
    return array(
        'contact_1_name' => $_POST['organizationContact1Name'],
        'contact_1_role' => $_POST['organizationContact1Role'],
        'contact_1_phone' => $_POST['organizationContact1Phone'],
        'contact_1_email' => $_POST['organizationContact1Email'],
        'contact_2_name' => $_POST['organizationContact2Name'],
        'contact_2_role' => $_POST['organizationContact2Role'],
        'contact_2_phone' => $_POST['organizationContact2Phone'],
        'contact_2_email' => $_POST['organizationContact2Email'],
        'contact_3_name' => $_POST['organizationContact3Name'],
        'contact_3_role' => $_POST['organizationContact3Role'],
        'contact_3_phone' => $_POST['organizationContact3Phone'],
        'contact_3_email' => $_POST['organizationContact3Email']
    );
}

function get_organization_info_data($addr_id, $contacts_id) {
    return array(
        'name' => $_POST['organizationName'],
        'address_id' => $addr_id,
        'phone' => $_POST['organizationPhone'],
        'email' => $_POST['organizationEmail'],
        'website' => $_POST['organizationWebsite'],
        'affiliations' => $_POST['organizationAffiliations'],
        'type' => $_POST['organizationType'],
        'location' => $_POST['organizationCountry'],
        'sectors' => $_POST['organizationSectors'],
        'contacts_id' => $contacts_id,
        'approved_status' => 0
    );
}

function get_organization_review_data($organization_id, $address_id) {
    return array(
        'address_id' => $address_id,
        'organization_id' => $organization_id,
        'languages_spoken' => $_POST['languagesSpoken'],
        'language_difficulties' => $_POST['languageDifficulties'],
        'sectors' => join(',', $_POST['physicalExperienceSectors']),
        'stipend_by_organization' => $_POST['stipendPaidByOrganization'],
        'cost_of_pe' => $_POST['costOfPhysicalExperience'],
        'pe_duration' => $_POST['physicalExperienceDuration'],
        'what_you_did' => $_POST['workWithOrganization'],
        'typical_day' => $_POST['physicalExperienceTypicalDay'],
        'strength_and_weaknesses' => $_POST['organizationStrengthsAndWeaknesses'],
        'other_comments' => $_POST['otherComments'],
        'safety_score' => $_POST['safetyScore'],
        'organization_responsiveness' => $_POST['organizationResponsiveness'],
    );
}