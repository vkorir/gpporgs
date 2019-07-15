<?php
/**
 * Created by PhpStorm.
 * Template Name: Login Page
 * User: victor
 * Date: 2019-03-12
 * Time: 18:59
 */


global $wp_session;
echo $wp_session['access_token'];
get_header();

if (isset($wp_session['access_token'])) {
    wp_redirect(home_url());
}
?>

<div class="container" id="login-container">
    <div class="jumbotron w-100 mx-0 my-5">
        <h1 class="display-4">Hello,</h1>
        <p class="lead">You need to be signed in to view the contents of this page. Click on the button below to login with your CalNet ID.</p>
        <hr class="my-4">
        <div class="text-center">
            <a href="<?php echo $wp_session['login_url']; ?>" class="btn jumbotron-login btn-lg">Login</a>
        </div>
    </div>
</div>

<?php get_footer();
