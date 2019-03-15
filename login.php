<?php
/**
 * Created by PhpStorm.
 * Template Name: Login Page
 * User: victor
 * Date: 2019-03-12
 * Time: 18:59
 */

require_once 'google-api/config.php';

if (isset($_SESSION['access_token'])) {
    wp_redirect(home_url());
    exit();
}

get_header();

get_footer();
