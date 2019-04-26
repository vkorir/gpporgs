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
    return '<label class="mt-3" for="' .$name . '">' . $value . '<span class="directive">' . $directive . '</span></label>';
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
              <label class="col-lg-2 col-md-2 col-sm-1" for="' . $name . '">' . $value . ': </label>
              <input class="col-lg-9 col-md-6 col-sm-8 px-1" type="' . $type . '" name="' . $name . '" id="' . $name . '" />
            </div>';
}

function get_regions() {
    return array('North America', 'Mexico / Central America', 'South America', 'Europe', 'Middle East / North Africa', 'Sub-Saharan Africa', 'India', 'China', 'Other');
}

// return countries
function get_countries() {
    global $wpdb;
    $options = '';
    foreach ($wpdb->get_results('select name from countries;') as $country) {
        $options .= '<option>' . $country->name . '</option>';
    }
    return $options;
}


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
	wp_register_script('custom_js', get_template_directory_uri() . '/js/scripts.js', array(), 1, true);
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
    $table = 'gpp_organization_info';
    $primaryKey = 'id';
    $columns = array(
        array('db' => 'name', 'dt' => 0),
        array('db' => 'type', 'dt' => 1),
        array('db' => 'location', 'dt' => 2),
        array('db' => 'sectors', 'dt' => 3),
	    array('db' => 'region', 'dt' => 4),
        array('db' => 'avg_cost_of_pe', 'dt' => 5)
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


// fetch organization names
add_action('wp_ajax_organizations', 'get_organizations');
add_action('wp_ajax_nopriv_organizations', 'get_organizations');
function get_organizations() {
    global $wpdb;
    $query = 'select id, name from gpp_organization_info where name LIKE \'%' . $_GET['prefix'] . '%\'';
    $result = $wpdb->get_results($query);
    wp_send_json($result);
}


// fetch organization info
add_action('wp_ajax_organization_info', 'get_organization_info');
add_action('wp_ajax_nopriv_organization_info', 'get_organization_info');
function get_organization_info() {
    global $wpdb;
    $info = $wpdb->get_results('select * from gpp_organization_info where id=' . $_GET['id']);
    $address_id = $wpdb->get_var('select address_id from gpp_organization_info where id=' . $_GET['id']);
    $contacts_id = $wpdb->get_var('select contacts_id from gpp_organization_info where id=' . $_GET['id']);
    $addr = $wpdb->get_results('select * from gpp_addresses where id=' . $address_id);
    $contacts = $wpdb->get_results('select * from gpp_organization_contacts where id=' . $contacts_id);
    wp_send_json(array_merge($info, $addr, $contacts));
}


// handle form submission
add_action('wp_ajax_submission', 'submission');
add_action('wp_ajax_nopriv_submission', 'submission');
function submission() {
    global $wpdb;

    // store org address
    $table = 'gpp_addresses';
    $data = get_organization_pe_address_data('organization');
    $format = array('%s', '%s', '%s', '%d', '%s');
    if (isset($_POST['organizationAddrId'])) {
        $org_addr_id = $_POST['organizationAddrId'];
        $data = array_merge(array('id' => $org_addr_id), $data);
        $format = array_merge(array('%d'), $format);
        $wpdb->replace($table, $data, $format);
    } else {
        $wpdb->insert($table, $data, $format);
        $org_addr_id = $wpdb->insert_id;
    }

    // store org contact
    $table = 'gpp_organization_contacts';
    $data = get_organization_contacts_data();
    $format = array('%s', '%s', '%s', '%s', '%s', '%s', '%s', '%s', '%s', '%s', '%s', '%s');
    if (isset($_POST['organizationContactsId'])) {
        $org_contacts_id = $_POST['organizationContactsId'];
        $data = array_merge(array('id' => $org_contacts_id), $data);
        $format = array_merge(array('%d'), $format);
        $wpdb->replace($table, $data, $format);
    } else {
        $wpdb->insert($table, $data, $format);
        $org_contacts_id = $wpdb->insert_id;
    }


    // store org info
    $table = 'gpp_organization_info';
    $data = get_organization_info_data($org_addr_id, $org_contacts_id, $_POST['costOfPhysicalExperience']);
    $format = array('%s', '%d', '%s', '%s', '%s', '%s', '%s', '%s', '%s', '%s', '%d', '%d');
    if (isset($_POST['organizationId'])) {
        $org_id = $_POST['organizationId'];
        $avg_cost = $wpdb->get_var('select avg_cost_of_pe from gpp_organization_info where id=' . $org_id);
        $reviews = $wpdb->get_var('select count(*) from gpp_gpp_practice_experience_reviews where organization_id=' . $org_id);
        $data['avg_cost_of_pe'] = ($data['avg_cost_of_pe'] + $avg_cost * $reviews) / ($reviews + 1);
        $data = array_merge(array('id' => $org_id), $data);
        $format = array_merge(array('%d'), $format);
        $wpdb->replace($table, $data, $format);
    } else {
        $wpdb->insert($table, $data, $format);
        $org_id = $wpdb->insert_id;
    }

    // store review address
    $table = 'gpp_addresses';
    $data = get_organization_pe_address_data('physicalExperience');
    $format = array('%s', '%s', '%s', '%d', '%s');
    $wpdb->insert($table, $data, $format);
    $pe_addr_id = $wpdb->insert_id;

    // store org review
    $table = 'gpp_practice_experience_reviews';
    $data = get_organization_review_data($org_id, $pe_addr_id);
    $format = array('%d', '%d', '%s', '%s', '%s', '%s', '%d', '%d', '%s', '%s', '%s', '%s', '%s', '%d', '%d');
    $wpdb->insert($table, $data, $format);

	wp_die();
}

function get_organization_pe_address_data($prefix) {
    return array(
        'street' => $_POST[$prefix . 'Street'],
        'city' => $_POST[$prefix . 'City'],
        'state' => $_POST[$prefix . 'State'],
        'zipcode' => $_POST[$prefix . 'ZipCode'],
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

function get_organization_info_data($addr_id, $contacts_id, $avg_cost_of_pe) {
    return array(
        'name' => $_POST['organizationName'],
        'address_id' => $addr_id,
        'phone' => $_POST['organizationPhone'],
        'email' => $_POST['organizationEmail'],
        'website' => $_POST['organizationWebsite'],
        'affiliations' => $_POST['organizationAffiliations'],
        'type' => $_POST['organizationType'],
        'location' => $_POST['organizationCountry'],
        'region' => $_POST['organizationRegion'],
        'sectors' => $_POST['organizationSectors'],
        'contacts_id' => $contacts_id,
        'approved_status' => 0,
        'avg_cost_of_pe' => $avg_cost_of_pe
    );
}

function get_organization_review_data($organization_id, $address_id) {
    return array(
        'address_id' => $address_id,
        'organization_id' => $organization_id,
        'region' => $_POST['physicalExperienceRegion'],
        'languages_spoken' => $_POST['languagesSpoken'],
        'language_difficulties' => $_POST['languageDifficulties'],
        'sectors' => $_POST['physicalExperienceSectors'],
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