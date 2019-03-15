<?php
/**
 * Created by PhpStorm.
 * User: victor
 * Date: 2019-03-12
 * Time: 18:59
 */


start_session();

if (!isset($_SESSION['access_token'])) {
    wp_redirect(home_url('/login'));
    exit();
}

get_header();
?>

<div class="container">

</div>

<?php get_footer(); ?>

