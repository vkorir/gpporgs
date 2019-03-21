<?php
/**
 * Created by PhpStorm.
 * User: victor
 * Date: 2019-03-14
 * Time: 19:42
 */

require 'utils.php';
?>

<div class="container">
    <div class="row mx-0">
        <div class="col-lg-3 px-0">
            <div class="rounded-container max-height">
                <?php
                    // filter by section heading
                    echo section_heading('FILTER BY');

                    // area subsection
                    $areas = array(
                        'area-radio-btn-1' => 'domestic',
                        'area-radio-btn-2' => 'international'
                    );
                    echo section_subheading('AREA');
                    echo radio_buttons($areas);

                    // sectors subsection
                    $sectors = array(
                        'sectors-btn-1' => 'information technology',
                        'sectors-btn-2' => 'education',
                        'sectors-btn-3' => 'environment / sustainability',
                        'sectors-btn-4' => 'business',
                        'sectors-btn-5' => 'healthcare',
                        'sectors-btn-6' => 'basic rights',
                        'sectors-btn-7' => 'relief mobilization',
                        'sectors-btn-8' => 'gender empowerment'
                    );
                    echo section_subheading('SECTOR');
                    echo radio_buttons($sectors);

                    // price range slider
                    echo slider('PRICE RANGE', 'w-100', 'price-range', '8000', '0', '10000', '500');
                ?>
            </div>
        </div>
        <div class="col-lg-6 px-0">
            <div class="rounded-container max-height middle-section">
                <div class="row mb-5">
                    <?php echo page_title('GPP Practice Experience Database'); ?>
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
                <?php
                    // render sort by
                    $sort_options = array(
                            'sort-by-btn-1' => 'closest to UC Berkeley',
                            'sort-by-btn-2' => 'number of projects',
                            'sort-by-btn-3' => 'NGO / Non-Profit',
                            'sort-by-btn-4' => 'responsiveness of ord',
                            'sort-by-btn-5' => 'most recent projects'
                    );
                    echo section_heading('SORT BY');
                    echo radio_buttons($sort_options);
                ?>
            </div>
        </div>
    </div>
</div>
