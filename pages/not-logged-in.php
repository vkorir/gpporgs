<?php
/**
 * Created by PhpStorm.
 * User: victor
 * Date: 2019-03-14
 * Time: 19:41
 */

//$_SESSION['access_token'] = 'test';
//$_SESSION['givenName'] = 'Victor';
//wp_redirect(home_url());

?>

<div class="container">
    <div class="jumbotron w-100 mx-0 my-5">
        <h1 class="display-4">Hello,</h1>
        <p class="lead">You need to be signed in to view this page. Click on the button below to login with your CalNet ID.</p>
        <hr class="my-4">
        <div class="text-center">
            <a href="<?php echo $_SESSION['login_url'] ?>" class="btn jumbotron-login btn-lg">Login</a>
        </div>
    </div>
</div>
