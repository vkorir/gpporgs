<?php
/**
 * Created by PhpStorm.
 * User: victor
 * Date: 2019-03-12
 * Time: 18:59
 */

start_session();
get_header();

$_SESSION['dataTableState'] = array('area' => 'all', 'sector' => 'all', 'price' => 8000);

if (isset($_SESSION['access_token'])) {?>
    <!--  logged in status  -->
    <div class="container">
        <div class="row mx-0">
            <div class="col-rounded-container-side px-0">
                <div class="rounded-container max-height">
                    <?php
                    // filter by section heading
                    echo section_heading('FILTER BY');

                    // area subsection
                    $areas = array(
                        'area-radio-btn-1' => 'Domestic',
                        'area-radio-btn-2' => 'International'
                    );
                    echo section_subheading('AREA');
                    echo radio_buttons($areas);

                    // sectors subsection
                    $sectors = array(
                        'sectors-btn-1' => 'Information Technology',
                        'sectors-btn-2' => 'Education',
                        'sectors-btn-3' => 'Environment / Sustainability',
                        'sectors-btn-4' => 'Business',
                        'sectors-btn-5' => 'Healthcare',
                        'sectors-btn-6' => 'Basic Rights',
                        'sectors-btn-7' => 'Relief Mobilization',
                        'sectors-btn-8' => 'Gender Empowerment'
                    );
                    echo section_subheading('SECTOR');
                    echo radio_buttons($sectors);

                    // price range slider
                    echo slider('PRICE RANGE', 'w-100', 'price-range', '8000', '0', '10000', '500');
                    ?>
                </div>
            </div>
            <div class="col-rounded-container-middle px-0">
                <div class="rounded-container max-height middle-section" id="middle-section-container">
                    <?php echo page_title('GPP Practice Experience Database'); ?>
                    <br />
                    <div id="table-container" class="m-0 p-0">
                        <table id="organizations-database-records" class="table table-striped table-bordered table-sm mt-3" style="width: 100%">
                            <!--           Load Database Info                 -->
                        </table>
                    </div>
                </div>
            </div>
            <div class="col-rounded-container-side px-0">
                <div class="rounded-container done-with-experience pt-4">
                    <h4>Hi <?php echo $_SESSION['givenName']; ?>,</h4>
                    <p class="lead">done with your practice?</p>
                    <div class="text-center">
                        <a href="<?php echo home_url('/add-experience') ?>" class="btn practice-btn">+ Add Experience</a>
                    </div>
                </div>
                <div class="rounded-container sort-by">
                    <?php
                    $sort_options = array(
                        'sort-by-btn-1' => 'Closest to UC Berkeley',
                        'sort-by-btn-2' => 'Number of projects',
                        'sort-by-btn-4' => 'Responsiveness of org',
                        'sort-by-btn-5' => 'Most recent projects'
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
    <?php if ($_SERVER['SERVER_ADDR'] == '127.0.0.1') {
        $_SESSION['access_token'] = 'test'; $_SESSION['givenName'] = 'Victor'; $_SESSION['familyName'] = 'Korir';
    } ?>
    <div class="container">
        <div class="jumbotron w-100 mx-0 my-5">
            <h1 class="display-4">Hello,</h1>
            <p class="lead">You need to be signed in to view the contents of this page. Click on the button below to login with your CalNet ID.</p>
            <hr class="my-4">
            <div class="text-center">
                <a href="<?php echo $_SESSION['login_url'] ?>" class="btn jumbotron-login btn-lg">Login</a>
            </div>
        </div>
    </div>
<?php }

get_footer();

