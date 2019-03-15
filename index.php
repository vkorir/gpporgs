<?php
/**
 * Created by PhpStorm.
 * User: victor
 * Date: 2019-03-12
 * Time: 18:59
 */


start_session();
get_header();

if (isset($_SESSION['access_token'])) {
    require 'pages/logged-in.php';
} else {
    require 'pages/not-logged-in.php';
}

get_footer();

