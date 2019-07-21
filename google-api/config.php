<?php
/**
 * Created by PhpStorm.
 * User: victor
 * Date: 2019-03-12
 * Time: 18:57
 */

// Google API PHP library
require_once 'vendor/autoload.php';

// Set config params to access Google API
$client_id = '1035290053103-56crsjin0a9bcbdphqqqd3mhtjh3rtdv.apps.googleusercontent.com';
$client_secret = 'x93ezf9bhuybKEh1R_UeoVWV';
$redirect_uri = 'https://' . $_SERVER['HTTP_HOST'] . '/wp-json/oauth/v2/callback';

// Create and Request to Google API
global $client;
$client = new Google_Client();
$client->setApplicationName('gpporgs-dev');
$client->setClientId($client_id);
$client->setClientSecret($client_secret);
$client->setRedirectUri($redirect_uri);

// Add scope to access user info
$client->addScope("https://www.googleapis.com/auth/userinfo.profile");
$client->addScope("https://www.googleapis.com/auth/userinfo.email");

if ($_SERVER['SERVER_ADDR'] == '127.0.0.1') {
    wp_signon(array('user_login' => 'vkkorir@gmail.com'));
    wp_set_current_user(1, 'vkkorir@gmail.com');
    wp_set_auth_cookie(1);
}