<?php
/**
 * Created by PhpStorm.
 * Template Name: Front Page
 * User: victor
 * Date: 2019-03-12
 * Time: 18:59
 */

session_start();

if (!isset($_SESSION['access_token'])) {
    wp_redirect(home_url('/login'));
    exit();
}

get_header();
?>

<div class="container">
	<h1>GPPORGS Website</h1>
</div>

<?php get_footer(); ?>