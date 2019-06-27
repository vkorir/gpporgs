<?php
/**
 * Created by PhpStorm.
 * Template Name: Callback Page
 * User: victor
 * Date: 2019-03-12
 * Time: 18:58
 */

require_once 'google-api/config.php';

if (isset($_SESSION['access_token'])) { // check for access_token is set
    $client->setAccessToken($_SESSION['access_token']);
} else if (isset($_GET['code'])) {  // check for auth code from Google API
    $token = $client->fetchAccessTokenWithAuthCode($_GET['code']);
    $_SESSION['access_token'] = $token;
} else {    // otherwise redirect to login
    wp_redirect(home_url('/login'));
    exit();
}

// fetch user attributes from Google API
$obj_res = new Google_Service_Oauth2($client);
$user_data = $obj_res->userinfo_v2_me->get();
$email = $user_data['email'];
$name = ucwords(strtolower($user_data['givenName']));
$username = substr($email, 0, strpos($email, '@'));

// check if existing user
$user = get_user_by('login', $username);
$user_id = $user->ID;

if ($user == false) { // register a new user
    $random_password = wp_generate_password(16, false);
    $user_id = wp_create_user($username, $random_password, $email);
    $user_data = array(
        'ID' => $id,
        'display_name' => $name,
        'role' => 'subscriber'
    );
    wp_insert_user($user_data);
}

// register session variables
$_SESSION['email'] = $email;
$_SESSION['givenName'] = $name;
$_SESSION['familyName'] = $user_data['familyName'];
$_SESSION['roles'] = get_userdata($user_id)->roles;

// redirect user to front-page
wp_redirect(home_url());
exit();

