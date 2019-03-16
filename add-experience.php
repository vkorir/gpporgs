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

<div class="container px-0">
    <div class="rounded-container max-height">
        <?php echo page_title('Add Your Practice Experience'); ?>
        <hr />
        <div class="add-experience-container left-page">
            <?php echo section_subheading('ORGANIZATION INFORMATION'); ?>
            <form action="">
                <fieldset>
                    <?php
                    echo fieldset_item('organizationname', 'text', 'Name');
                    echo fieldset_item('street', 'text', 'Street');
                    echo fieldset_item('city', 'text', 'City');
                    echo fieldset_item('state', 'text', 'State');
                    echo fieldset_item('zipcode', 'number', 'Zip Code');
                    echo fieldset_item('region', 'text', 'Region');
                    echo fieldset_item('country', 'text', 'Country');
                    echo fieldset_item('phone', 'tel', 'Phone');
                    echo fieldset_item('email', 'email', 'Email');
                    echo fieldset_item('website', 'url', 'Website');
                    ?>
                </fieldset>
            </form>
            <?php echo subsection_heading('affiliation', 'Affiliation', 'Select all that may apply'); ?>
            <div class="row">
                <div class="col-lg-5 col-md-5 col-sm-10">
                    <?php
                        $affiliation_btn_list_1 = array(
                                'blum-center' => 'Blum Center',
                                'uc-affiliated' => 'UC Affiliated',
                                'cal-corps' => 'Cal Corps'
                        );
                        echo radio_buttons($affiliation_btn_list_1);
                    ?>
                </div>
                <div class="col-lg-5 col-md-5 col-sm-10">
                    <?php
                        $affiliation_btn_list_2 = array(
                                'student-led-org' => 'Student-Led Organization',
                                'faculty-led-org' => 'Faculty-Led Organization',
                                'no-affiliation' => 'No Campus Affiliation'
                        );
                        echo radio_buttons($affiliation_btn_list_2);
                    ?>
                </div>
            </div>
            <?php echo subsection_heading('type-of-org', 'Type of Organization', 'Select one'); ?>
            <div class="row">
                <div class="col-lg-5 col-md-5 col-sm-10">
                    <?php
                        $type_org_btn_list_1 = array(
                                'government' => 'Government / UN-like(UNDP, World Bank, WTO)',
                                'for-profit' => 'For Profit / Corporation-Based Development Organization',
                                'non-profit' => 'NGO / Non-Profit',
                                'social-enterprise' => 'Social Enterprise / Corporate Social Responsibility'
                        );
                        echo radio_buttons($type_org_btn_list_1);
                    ?>
                </div>
                <div class="col-lg-5 col-md-5 col-sm-10">
                    <?php
                        $type_org_btn_list_2 = array(
                                'collection-action-group' => 'Collection Action Group (union, social movement)',
                                'free-based-3rd-party->prov' => 'Fee-Based Third Party Provider',
                                'other-type-org' => 'Other (please describe below)'
                        );
                        echo radio_buttons($type_org_btn_list_2);
                    ?>
                    <input type="text" />
                </div>
            </div>
            <?php echo subsection_heading('sector-of-org', 'Sector of Organization', 'Select all that may apply'); ?>
            <div class="row">
                <div class="col-lg-5 col-md-5 col-sm-10">
                    <?php
                        $sector_org_btn_list_1 = array(
                                'agr-food-hunger' => 'Agriculture / Food Security / Hunger / Malnutrition',
                                'collective-mobilization' => 'Collective Mobilization / Advocacy',
                                'disaster-hum-relief' => 'Disaster / Humanitarian Relief',
                                'environment-sus' => 'Environment / Sustainability',
                                'mkt-access' => 'Fair Trade / Market Access',
                                'gender-emp' => 'Gender Empowerment'
                        );
                        echo radio_buttons($sector_org_btn_list_1);
                    ?>
                </div>
                <div class="col-lg-5 col-md-5 col-sm-10">
                    <?php
                        $sector_org_btn_list_2 = array(
                                'healthcare' => 'Healthcare (Basic Heath, HIV/AIDS, Maternal, Child, etc)',
                                'human-rights' => 'Human Rights (Housing, Water, Sanitation) / Law',
                                'immigration' => 'Immigration',
                                'info-tech' => 'Information Technology',
                                'microfinance-entp' => 'Microfinance / Small Enterprise',
                                'other-sector-org' => 'Other (please describe below)'
                        );
                        echo radio_buttons($sector_org_btn_list_2);
                    ?>
                </div>
            </div>
            <?php echo section_subheading('CONTACT INFORMATION'); ?>
            <form action="">
                <fielset>
                    <?php
                        echo fieldset_item('contactname', 'text', 'Name');
                        echo fieldset_item('contactrole', 'text', 'Role');
                        echo fieldset_item('contactphone', 'tel', 'Phone');
                        echo fieldset_item('contactemail', 'email', 'Email');
                    ?>
                </fielset>
            </form>
        </div>

        <div class="add-experience-container right-page">
            <?php
                echo section_subheading('PRACTICE EXPERIENCE INFORMATION');
                echo subsection_heading('site-address', 'Was yout PE site different from your organization address?', 'If Yes, please fill out the address information below.');
            ?>
            <div class="row">
                <div class="col-1">
                    <?php echo radio_button_util('yes', 'Yes'); ?>
                </div>
                <div class="col-1">
                    <?php echo radio_button_util('no', 'No'); ?>
                </div>
            </div>
            <form action="">
                <fieldset>
                    <?php
                        echo fieldset_item('street', 'text', 'Street');
                        echo fieldset_item('city', 'text', 'City');
                        echo fieldset_item('state', 'text', 'State');
                        echo fieldset_item('zipcode', 'number', 'Zip Code');
                        echo fieldset_item('region', 'text', 'Region');
                        echo fieldset_item('country', 'text', 'Country');
                    ?>
                </fieldset>
            </form>

            <?php echo subsection_heading('lang-spoken', 'Languages Spoken', ''); ?>
            <input class="w-100" type="text" />

            <?php echo subsection_heading('lang-difficulties', 'Did you have any language difficulties?',''); ?>
            <textarea name="" id="" cols="30" rows="10" class="w-100"></textarea>

            <?php echo subsection_heading('pe-sector', 'What was the sector of your PE', 'Check all that apply')?>
            <div class="row">
                <div class="col-lg-5 col-md-5 col-sm-10">
                    <?php
                        $pe_sector_btn_list_1 = array(
                            'agr-food-hunger' => 'Agriculture / Food Security / Hunger / Malnutrition',
                            'collective-mobilization' => 'Collective Mobilization / Advocacy',
                            'disaster-hum-relief' => 'Disaster / Humanitarian Relief',
                            'environment-sus' => 'Environment / Sustainability',
                            'mkt-access' => 'Fair Trade / Market Access',
                            'gender-emp' => 'Gender Empowerment'
                        );
                        echo radio_buttons($pe_sector_btn_list_1);
                    ?>
                </div>
                <div class="col-lg-5 col-md-5 col-sm-10">
                    <?php
                        $pe_sector_btn_list_2 = array(
                            'healthcare' => 'Healthcare (Basic Heath, HIV/AIDS, Maternal, Child, etc)',
                            'human-rights' => 'Human Rights (Housing, Water, Sanitation) / Law',
                            'immigration' => 'Immigration',
                            'info-tech' => 'Information Technology',
                            'microfinance-entp' => 'Microfinance / Small Enterprise',
                            'other-sector-org' => 'Other (please describe below)'
                        );
                        echo radio_buttons($pe_sector_btn_list_2);
                    ?>
                </div>
            </div>

            <?php
                echo subsection_heading('pe-cost', 'What was the cost of your PE', 'All incurred costs (i.e. transportation, housing, etc)');
                echo slider('Cost of PE', 'pe-cost', '0', '0', '10000', '500');
                echo slider('Stipended paid by organization', 'stipend-paid', '0', '0', '10000', '500');
                echo subsection_heading('pe-duration', 'What was the duration of your PE', '');
             ?>
            <div class="row">
                <div class="col-lg-2"><?php echo radio_button_util('less-2-months', '< 2 months'); ?></div>
                <div class="col-lg-2"><?php echo radio_button_util('two-4', '2-4 months'); ?></div>
                <div class="col-lg-2"><?php echo radio_button_util('four-6', '4-6 months'); ?></div>
                <div class="col-lg-2"><?php echo radio_button_util('six-12', '6-12 months'); ?></div>
                <div class="col-lg-2"><?php echo radio_button_util('more-1-yr', '> 1 year'); ?></div>
            </div>

            <?php
                echo subsection_heading('org-description', 'Describe the work you did with your organization', '2 paragraphs');
                echo '<textarea name="" id="" cols="30" rows="10" class="w-100"></textarea>';

                echo subsection_heading('org-typical-day', 'What was a typical day like while on your PE? (please consider housing, food, travel, weather, etc)', '2 paragraphs');
                echo '<textarea name="" id="" cols="30" rows="10" class="w-100"></textarea>';

                echo subsection_heading('org-strength-weakness', 'What were your organization\'s strengths and weaknesses?', '2 paragraphs');
                echo '<textarea name="" id="" cols="30" rows="10" class="w-100"></textarea>';

                echo subsection_heading('org-other-comments', 'Other comments you want to add?', '');
                echo '<textarea name="" id="" cols="30" rows="10" class="w-100"></textarea>';

                echo slider('How safe did you feel during your PE?', 'org-how-safe', '3', '1', '5', '1');
                echo slider('How responsive was your organization?', 'org-responsiveness', '4', '1', '5', '1');
            ?>
        </div>
        <hr />
        <div class="btn-container text-center">
            <button type="button" class="btn" id="add-experience-btn1">Save</button>
            <button type="button" class="btn" id="add-experience-btn2">Next ></button>
        </div>
    </div>
</div>

<?php get_footer(); ?>