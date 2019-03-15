<?php

require_once 'google-api/config.php';

$auth_tag = '<a href="' . $_SESSION['login_url'] . '" class="nav-link">LOGIN</a>';
if (isset($_SESSION['access_token'])) {
    $auth_tag = '<a href="' . home_url("/logout") . '" class="nav-link">LOGOUT</a>';
}
?>

<!doctype html>
<html>
	<head>
		<meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <meta name="author" content="Victor Korir, victorkorir.com">
        <meta name="viewport" content="width=device-width">
		<title>GPPORGS Database</title>
		<?php wp_head(); ?>
	</head>
	
<body <?php body_class(); ?>>

<nav class="navbar navbar-expand-lg sticky-top">
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarToggler" aria-controls="navbarToggler" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarToggler">
        <form class="form-inline col-lg-6">
            <input class="form-control w-100" type="search" placeholder="Search" aria-label="Search">
        </form>
        <ul class="navbar-nav ml-auto">
            <li class="nav-item">
                <a href="<?php echo home_url(); ?>" class="nav-link">DATABASE</a>
            </li>
            <li class="nav-item">
                <a href="" class="nav-link">GPP STUDENTS</a>
            </li>
            <li class="nav-item">
                <a href="" class="nav-link">MY PROFILE</a>
            </li>
            <li class="nav-item">
                <?php echo $auth_tag?>
            </li>
        </ul>
    </div>
</nav>