<?php
/**
 * Created by PhpStorm.
 * Template Name: Callback Page
 * User: victor
 * Date: 2019-03-12
 * Time: 18:58
 */

require_once 'google-api/config.php';

 if (isset($_GET['code'])) {  // check for auth code from Google API
    $client->fetchAccessTokenWithAuthCode($_GET['code']);
} else {    // otherwise redirect to login
    wp_redirect(home_url('/login'));
    exit();
}

// fetch user attributes from Google API
$obj_res = new Google_Service_Oauth2($client);
$user_data = $obj_res->userinfo_v2_me->get();
$email = $user_data['email'];
$username = strtolower(substr($user_data['email'], 0, strpos($email, '@')));

// check if existing user

$user = get_user_by('login', $username);
if ($user == false) { // register a new user
    $user_details = array(
        'user_pass' => wp_generate_password(16, false),
        'user_login' => $username,
        'user_email' => $email,
        'first_name' => ucfirst(strtolower($user_data['givenName'])),
        'last_name' => ucfirst(strtolower($user_data['familyName'])),
        'role' => 'contributor'
    );
    $user = new WP_User(wp_insert_user($user_details));
}

// login current user
wp_signon(array('user_login' => $user->user_login));
wp_set_current_user($user->ID, $user->user_login);

// redirect user to front-page
wp_redirect(home_url());
exit();

