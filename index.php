<?php
/**
 * Created by PhpStorm.
 * User: victor
 * Date: 2019-03-12
 * Time: 18:59
 */

require_once 'google-api/config.php';

get_header();

if (is_user_logged_in()) { ?>

<div class="container" id="home-page-container">
    <div class="row mx-0">
        <div class="col-rounded-container-side px-0">
            <div class="rounded-container max-height">
                <h3>Hi <?php echo wp_get_current_user()->user_firstname; ?>,</h3>
                <p>done with your practice?</p>
                <div class="text-center">
                    <a href="<?php echo home_url('/add-experience') ?>" class="btn practice-btn">+ Add Review</a>
                </div>
                <br />
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
                echo slider('PRICE RANGE', 'w-100', 'price-range', '5000', '0', '10000', '500');
                ?>
            </div>
        </div>
        <div class="col-rounded-container-page-table px-0">
            <div class="rounded-container max-height middle-section" id="middle-section-container">
                <?php echo page_title('GPP Practice Experience Database'); ?>
                <br />
                <br />
                <div id="table-container" class="m-0 p-0">
                    <table id="organizations-database-records" class="table table-striped table-bordered table-sm mt-3" style="width: 100%">
                        <!--           Load Database Info                 -->
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>

<?php } else { ?>
<div class="container" id="login-container">
    <div class="jumbotron w-100 mx-0 my-5">
<!--        --><?php //echo 'expired token: ' . $client->getAccessToken(); ?>
        <h1 class="display-4">Hello,</h1>
        <p class="lead">You need to be signed in to view the contents of this site. Click on the button below to login with your CalNet ID.</p>
        <hr class="my-4">
        <div class="text-center">
            <a href="<?php echo $client->createAuthUrl(); ?>" class="btn jumbotron-login btn-lg">Login</a>
        </div>
    </div>
</div>

<?php } get_footer();

