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
add_action('wp_enqueue_scripts', 'load_datatables');
function load_datatables() {
    wp_register_style('datatables_css', get_template_directory_uri() . '/css/datatables.min.css', array(), false, 'all');
    wp_enqueue_style('datatables_css');

    wp_register_script('datatables_js', get_template_directory_uri() . '/js/datatables.min.js', '', 1, true);
    wp_enqueue_script('datatables_js');
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


