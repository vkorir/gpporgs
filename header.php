<?php

require 'google-api/config.php'; ?>

<!doctype html>
<html lang="en">
	<head>
		<meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <meta name="author" content="Victor Korir, http://victorkorir.com/">
        <meta name="viewport" content="width=device-width">
		<title>GPPORGS Database</title>
		<?php wp_head(); ?>
	</head>
	
<body <?php body_class(); ?>>

<nav class="navbar navbar-expand-lg sticky-top">
    <div class="container">
        <div class="collapse navbar-collapse px-0" id="navbarToggler">
            <form class="navbar-brand form-inline col-lg-6 px-0">
                <?php if (is_user_logged_in()) { ?>
                <!--       Enable search bar         -->
                <input id="main-search-bar" class="form-control w-100" type="search" placeholder="Search" aria-label="Search">
                <?php } else { ?>
                <!--       Disable search bar         -->
                <input id="main-search-bar" class="form-control w-100" onclick="alert('Sorry, you need to be signed in to search.')" type="search" placeholder="Search" aria-label="Search" disabled>
                <?php } ?>
            </form>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarToggler" aria-controls="navbarToggler" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <ul class="navbar-nav ml-auto">
                <li class="nav-item">
                    <a href="<?php echo home_url(); ?>" class="nav-link">DATABASE</a>
                </li>
                <li class="nav-item">
                    <a href="<?php echo home_url('/add-experience') ?>" class="nav-link">ADD REVIEW</a>
                </li>
                <?php if (is_user_logged_in()) { ?>
                <!--        render logout button        -->
                <li class="nav-item">
                    <a href="<?php echo home_url('/wp-json/oauth/v2/logout'); ?>" class="nav-link">LOGOUT</a>
                </li>
                <?php } else { ?>
                <!--        render login button        -->
                <li class="nav-item">
                    <a href="<?php echo $client->createAuthUrl(); ?>" class="nav-link">LOGIN</a>
                </li>
                <?php } ?>
            </ul>
        </div>
    </div>
</nav>