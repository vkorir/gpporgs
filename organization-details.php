<?php
/**
 * Created by PhpStorm.
 * Template Name: Organization Details Page
 * User: victor
 * Date: 2019-03-14
 * Time: 10:56
 */

get_header();
?>

<div class="container" id="organization-details-page">
    <div class="rounded-container max-height">
        <?php echo page_title('Organization Details');?>
        <hr />
        <div id="add-experience-container-left" class="add-experience-container left-page">
            <?php require('utils/organization-template-page.php'); ?>
        </div>
        <div class="add-experience-container right-page">
            <?php require('utils/review-template-page.php'); ?>
        </div>
        <hr />
        <div class="text-center">
            <button class="add-experience-btn" id="organization-details-btn" >Organization Reviews</button>
        </div>
    </div>

</div>

<?php

get_footer();
