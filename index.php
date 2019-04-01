<?php
/**
 * Created by PhpStorm.
 * User: victor
 * Date: 2019-03-12
 * Time: 18:59
 */

require 'utils.php';

start_session();
get_header();

if (isset($_SESSION['access_token'])) {?>
    <!--  logged in status  -->
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
                <div class="rounded-container max-height middle-section" id="middle-section-container">
                    <div class="row mb-5">
                        <?php echo page_title('GPP Practice Experience Database'); ?>
                    </div>
                    <div class="row">
                        <div class="col">
                            <table id="organizations-database-records" class="table table-striped table-bordered table-sm mt-3" cellspacing="0" style="width: 100%">
                                <thead>
                                <tr>
                                    <th>Name</th>
                                    <th>Type</th>
                                    <th>Location</th>
                                    <th>Sectors</th>
                                </tr>
                                </thead>
                            </table>
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
<?php } else { ?>
    <!--  logged out status  -->
    <div class="container">
        <div class="jumbotron w-100 mx-0 my-5">
            <h1 class="display-4">Hello,</h1>
            <p class="lead">You need to be signed in to view this page. Click on the button below to login with your CalNet ID.</p>
            <hr class="my-4">
            <div class="text-center">
                <a href="<?php echo $_SESSION['login_url'] ?>" class="btn jumbotron-login btn-lg">Login</a>
            </div>
        </div>
    </div>
<?php }

get_footer();

