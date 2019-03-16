<?php
/**
 * Created by PhpStorm.
 * User: victor
 * Date: 2019-03-14
 * Time: 19:41
 */

$_SESSION['access_token'] = 'test';
$_SESSION['givenName'] = 'Victor';

wp_redirect(home_url());
?>

<div class="container">
    <div class="jumbotron">
        <h1 class="display-4">Hello,</h1>
        <p class="lead">You need to log in with your CalNet ID to view this page. Click on the Login button below to login.</p>
        <hr class="my-4">
        <div class="mx-auto">
            <a href="<?php echo $_SESSION['login_url'] ?>" class="btn jumbotron-login btn-lg">Login</a>
        </div>
    </div>
</div>
