<?php
/**
 * Created by PhpStorm.
 * Template Name: Add Experience Page
 * User: victor
 * Date: 2019-03-14
 * Time: 10:56
 */

get_header();
?>

<div class="container" id="add-experience-page">
    <div class="rounded-container max-height">
        <?php echo page_title('Add Your Practice Experience'); ?>
        <hr />
        <div id="add-experience-container-left" class="add-experience-container left-page">
            <?php require('utils/organization-template-page.php'); ?>
        </div>
        <div class="add-experience-container right-page">
            <?php require('utils/review-template-page.php'); ?>
        </div>
        <hr />
        <div class="text-center">
            <button class="add-experience-btn" id="add-experience-btn1" >Cancel</button>
            <button class="add-experience-btn" id="add-experience-btn2" >Next ></button>
        </div>
    </div>
</div>

<?php get_footer(); ?>