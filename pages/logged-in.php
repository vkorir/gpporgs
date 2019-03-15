<?php
/**
 * Created by PhpStorm.
 * User: victor
 * Date: 2019-03-14
 * Time: 19:42
 */
?>

<div class="container">
    <div class="row">
        <div class="col-lg-3 px-0">
            <div class="rounded-container max-height">
                <?php require('files/filter.php'); ?>
            </div>
        </div>
        <div class="col-lg-6 px-0">
            <div class="rounded-container max-height">
                <div class="row mb-5">
                    <div class="mx-auto">
                        <h3 class="display-5">GPP Practice Experience Database</h3>
                    </div>
                </div>
                <div class="row">
                    <div class="col">
                        Filters: <input value="international, education" disabled>
                    </div>
                    <div class="col">
                        Sort By: <input value="near UC Berkeley" disabled>
                    </div>
                </div>
                <div class="row">
                    <div class="col">
                        <?php require('files/table.php'); ?>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-lg-3 px-0">
            <div class="rounded-container done-with-experience">
                <h3 class="">Hi <?php echo $_SESSION['givenName']; ?>,</h3>
                <p class="lead">done with your practice?</p>
                <div class="text-center w-100">
                    <a href="<?php echo home_url('/add-experience') ?>" class="btn practice-btn">Add Experience</a>
                </div>
            </div>
            <div class="rounded-container sort-by">

            </div>
        </div>
    </div>
</div>
