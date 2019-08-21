<?php

// load front-end utility functions
require_once 'utils/utility-functions.php';

// load rest api endpoints
require_once 'utils/rest-apis.php';

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

// disable toolbar for non admin users
add_action('after_setup_theme', function () {
    if (!current_user_can('administrator') && !is_admin()) {
        show_admin_bar(false);
    }
});

// start session
add_action('init', function () {
    if (!session_id()) {
        session_start();
        $_SESSION['access_code_verified'] = false;
    }
});