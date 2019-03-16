<?php
/**
 * Created by PhpStorm.
 * Template Name: Add Experience Page
 * User: victor
 * Date: 2019-03-14
 * Time: 10:56
 */

require 'pages/utils.php';
get_header();
?>

<div class="container">
    <div class="rounded-container max-height">
        <?php echo page_title('Add Your Practice Experience'); ?>

        <div class="add-experience-container left-page w-100 h-100">

            <div class="mx-auto">
                <button class="" onclick="">Save</button>
                <button class="" onclick="">Next ></button>
            </div>
        </div>

        <div class="add-experience-container right-page w-100 h-100">

        </div>

        <div class="mx-auto">
            <button class="" onclick="">< Prev</button>
            <button class="" onclick="">Submit</button>
        </div>
    </div>
</div>

<?php get_footer(); ?>