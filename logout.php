<?php
/**
 * Created by PhpStorm.
 * Template Name: Logout Page
 * User: victor
 * Date: 2019-03-12
 * Time: 18:59
 */

// Logout and redirect user to login page
require_once 'google-api/config.php';

wp_logout();
$client->revokeToken();
wp_redirect(home_url());
exit();
