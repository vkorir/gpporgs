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
    <div class="row">
        <div class="col-lg-3 px-0">
            <div class="rounded-container max-height filter-section-container">
                <?php
                    // filter by section heading
                    echo section_heading('FILTER BY');

                    // area subsection
                    $areas = array(
                        'domestic' => 'domestic',
                        'international' => 'international'
                    );
                    echo section_subheading('AREA');
                    echo radio_buttons($areas);

                    // sectors subsection
                    $sectors = array(
                        'information-technology' => 'information technology',
                        'education' => 'education',
                        'environment-sustainability' => 'environment / sustainability',
                        'business' => 'business',
                        'healthcare' => 'healthcare',
                        'basic-rights' => 'basic rights',
                        'relief-mobilization' => 'relief mobilization',
                        'gender-empowerment' => 'gender empowerment'
                    );
                    echo section_subheading('SECTOR');
                    echo radio_buttons($sectors);

                    // price range slider
                    echo slider('PRICE RANGE: $', 'price-range', '8000', '0', '10000', '500');
                ?>
            </div>
        </div>
        <div class="col-lg-6 px-0">
            <div class="rounded-container max-height">
                <div class="row mb-5">
                    <?php echo page_title('GPP Practice Experience Database'); ?>
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
                <?php
                    // render sort by
                    $sort_options = array(
                            'closest-to-uc' => 'closest to UC Berkeley',
                            'num-project' => 'number of projects',
                            'ngo-non-profit' => 'NGO / Non-Profit',
                            'responsiveness' => 'responsiveness of ord',
                            'most-recent-projects' => 'most recent projects'
                    );
                    echo section_heading('SORT BY');
                    echo radio_buttons($sort_options);
                ?>
            </div>
        </div>
    </div>
</div>
