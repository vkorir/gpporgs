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
?>

<div class="container h-100">
    <div class="row align-items-center h-100">
        <div class="col-md-4 mx-auto">
            <input type="button" onclick="window.location = '<?php echo $client->createAuthUrl(); ?>';" value="Log In With Google" class="btn btn-danger">
        </div>
    </div>
</div>