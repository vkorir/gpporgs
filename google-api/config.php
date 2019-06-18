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
$redirect_uri = 'http://' . $_SERVER['HTTP_HOST'] . '/callback';

// Create and Request to Google API
$client = new Google_Client();
$client->setApplicationName('GPPORGS Database');
$client->setClientId($client_id);
$client->setClientSecret($client_secret);
$client->setRedirectUri($redirect_uri);

// Add scope to access user info
$client->addScope("https://www.googleapis.com/auth/userinfo.profile");
$client->addScope("https://www.googleapis.com/auth/userinfo.email");

// save login url
$_SESSION['login_url'] = $client->createAuthUrl();