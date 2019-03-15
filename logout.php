<?php
/**
 * Created by PhpStorm.
 * Template Name: Logout Page
 * User: victor
 * Date: 2019-03-12
 * Time: 18:59
 */

require_once 'google-api/config.php';

// Logout and redirect user to login page
require_once 'google-api/config.php';

unset($_SESSION['access_token']);
unset($_SESSION['email']);
unset($_SESSION['givenName']);

$client->revokeToken();
session_destroy();
wp_redirect(home_url('/login'));
exit();
