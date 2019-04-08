<?php
/**
 * Created by PhpStorm.
 * Template Name: Add Experience Page
 * User: victor
 * Date: 2019-03-14
 * Time: 10:56
 */

require 'utils.php';
get_header();
?>

<div class="container">
    <div class="rounded-container max-height">
        <?php echo page_title('Add Your Practice Experience'); ?>
        <hr />
        <div id="add-experience-container-left" class="add-experience-container left-page">
            <?php echo section_subheading('ORGANIZATION INFORMATION'); ?>
            <form id="organization-info" action="">
                <fieldset>
                    <?php
                    echo fieldset_item('name', 'text', 'Name');
                    echo fieldset_item('street', 'text', 'Street');
                    echo fieldset_item('city', 'text', 'City');
                    echo fieldset_item('state', 'text', 'State');
                    echo fieldset_item('zipcode', 'number', 'Zip Code');
                    ?>
                    <div>
                        <label class="col-lg-2 col-md-2 col-sm-1" for="region">Region</label>
                        <select class="custom-select col-lg-9 col-md-6 col-sm-8 px-1" id="region">
                            <option selected>Select Region</option>
                            <?php
                            $value = 1;
                            foreach (get_regions() as $region) {
                                echo '<option value="' . $value . '">' . $region . '</option>';
                                $value++;
                            }
                            ?>
                        </select>
                    </div>
                    <div>
                        <label class="col-lg-2 col-md-2 col-sm-1" for="country">Country</label>
                        <select class="custom-select col-lg-9 col-md-6 col-sm-8 px-1" id="country">
                            <option selected>Select Country</option>
                            <?php
                            $value = 1;
                            foreach (get_countries() as $country) {
                                echo '<option value="' . $value . '">' . $country . '</option>';
                                $value++;
                            }
                            ?>
                        </select>
                    </div>
                    <?php
                    echo fieldset_item('phone', 'tel', 'Phone');
                    echo fieldset_item('email', 'email', 'Email');
                    echo fieldset_item('website', 'url', 'Website');
                    ?>
                </fieldset>
            </form>
            <?php echo subsection_heading('affiliation', 'Affiliation', ': Select all that may apply'); ?>
            <div class="row">
                <div class="col-lg-6 col-md-6 col-sm-12">
                    <?php
                        $affiliation_btn_list_1 = array(
                                'affiliation-radio-btn-1' => 'Blum Center',
                                'affiliation-radio-btn-2' => 'UC Affiliated',
                                'affiliation-radio-btn-3' => 'Cal Corps'
                        );
                        echo radio_buttons($affiliation_btn_list_1);
                    ?>
                </div>
                <div class="col-lg-6 col-md-6 col-sm-12">
                    <?php
                        $affiliation_btn_list_2 = array(
                                'affiliation-radio-btn-4' => 'Student-Led Organization',
                                'affiliation-radio-btn-5' => 'Faculty-Led Organization',
                                'affiliation-radio-btn-6' => 'No Campus Affiliation'
                        );
                        echo radio_buttons($affiliation_btn_list_2);
                    ?>
                </div>
            </div>
            <?php echo subsection_heading('organization-type', 'Type of Organization', ': Select one'); ?>
            <div class="row">
                <div class="col-lg-6 col-md-6 col-sm-12">
                    <?php
                        $type_org_btn_list_1 = array(
                                'organization-type-btn-1' => 'Government / UN-like(UNDP, World Bank, WTO)',
                                'organization-type-btn-2' => 'For Profit / Corporation-Based Development Organization',
                                'organization-type-btn-3' => 'NGO / Non-Profit',
                                'organization-type-btn-4' => 'Social Enterprise / Corporate Social Responsibility'
                        );
                        echo radio_buttons($type_org_btn_list_1);
                    ?>
                </div>
                <div class="col-lg-6 col-md-6 col-sm-12">
                    <?php
                        $type_org_btn_list_2 = array(
                                'organization-type-btn-5' => 'Collection Action Group (union, social movement)',
                                'organization-type-btn-6' => 'Fee-Based Third Party Provider',
                                'organization-type-btn-7' => 'Other (please describe below)'
                        );
                        echo radio_buttons($type_org_btn_list_2);
                    ?>
                    <input type="text" id="organization-type-other-input" class="col-10 px-1" />
                </div>
            </div>
            <?php echo subsection_heading('organization-sector', 'Sector of Organization', ': Select all that may apply'); ?>
            <div class="row">
                <div class="col-lg-6 col-md-6 col-sm-12">
                    <?php
                        $sector_org_btn_list_1 = array(
                                'organization-sector-btn-1' => 'Agriculture / Food Security / Hunger / Malnutrition',
                                'organization-sector-btn-2' => 'Collective Mobilization / Advocacy',
                                'organization-sector-btn-3' => 'Disaster / Humanitarian Relief',
                                'organization-sector-btn-4' => 'Environment / Sustainability',
                                'organization-sector-btn-5' => 'Fair Trade / Market Access',
                                'organization-sector-btn-6' => 'Gender Empowerment'
                        );
                        echo radio_buttons($sector_org_btn_list_1);
                    ?>
                </div>
                <div class="col-lg-6 col-md-6 col-sm-12">
                    <?php
                        $sector_org_btn_list_2 = array(
                                'organization-sector-btn-7' => 'Healthcare (Basic Heath, HIV/AIDS, Maternal, Child, etc)',
                                'organization-sector-btn-8' => 'Human Rights (Housing, Water, Sanitation) / Law',
                                'organization-sector-btn-9' => 'Immigration',
                                'organization-sector-btn-10' => 'Information Technology',
                                'organization-sector-btn-11' => 'Microfinance / Small Enterprise',
                                'organization-sector-btn-12' => 'Other (please describe below)'
                        );
                        echo radio_buttons($sector_org_btn_list_2);
                    ?>
                    <input type="text" id="organization-sector-other-input" class="col-10 px-1" />
                </div>
            </div>
            <?php echo section_subheading('CONTACT INFORMATION'); ?>
            <div id="organization-contacts">
                <form id="organization-contacts" action="">
                    <fieldset id="organization-contact-1">
                        <?php
                            echo fieldset_item('name', 'text', 'Name');
                            echo fieldset_item('role', 'text', 'Role');
                            echo fieldset_item('phone', 'tel', 'Phone');
                            echo fieldset_item('email', 'email', 'Email');
                        ?>
                        <hr class="w-100" />
                    </fieldset>
                    <fieldset id="organization-contact-2" class="d-none">
                        <?php
                        echo fieldset_item('name', 'text', 'Name');
                        echo fieldset_item('role', 'text', 'Role');
                        echo fieldset_item('phone', 'tel', 'Phone');
                        echo fieldset_item('email', 'email', 'Email');
                        ?>
                        <hr class="w-100" />
                    </fieldset>
                    <fieldset id="organization-contact-3" class="d-none">
                        <?php
                        echo fieldset_item('name', 'text', 'Name');
                        echo fieldset_item('role', 'text', 'Role');
                        echo fieldset_item('phone', 'tel', 'Phone');
                        echo fieldset_item('email', 'email', 'Email');
                        ?>
                        <hr class="w-100" />
                    </fieldset>
                    <fieldset id="max-contacts-warning" class="d-none">
                        <div class="alert alert-danger text-center" role="alert">
                            Sorry, you have reached the maximum number of allowed contacts!
                        </div>
                    </fieldset>
                </form>
            </div>
            <div class="text-center">
                <button id="add-contact-btn">Add Contact+</button>
            </div>
        </div>

        <div class="add-experience-container right-page">
            <?php
                echo section_subheading('PRACTICE EXPERIENCE INFORMATION');
                echo subsection_heading('site-address', 'Was your PE site different from your organization address?', '');
                echo radio_button_util('pe-address-diff-yes', 'Yes');
                echo radio_button_util('pe-address-diff-no', 'No');
            ?>
            <form id="practice-experience-address" action="">
                <fieldset>
                    <?php
                        echo fieldset_item('street', 'text', 'Street');
                        echo fieldset_item('city', 'text', 'City');
                        echo fieldset_item('state', 'text', 'State');
                        echo fieldset_item('zipcode', 'number', 'Zip Code');
                    ?>
                    <div>
                        <label class="col-lg-2 col-md-2 col-sm-1" for="region">Region</label>
                        <select class="custom-select col-lg-9 col-md-6 col-sm-8 px-1" id="region">
                            <option selected>Select Region</option>
			                <?php
			                $value = 1;
			                foreach (get_regions() as $region) {
				                echo '<option value="' . $value . '">' . $region . '</option>';
				                $value++;
			                }
			                ?>
                        </select>
                    </div>
                    <div>
                        <label class="col-lg-2 col-md-2 col-sm-1" for="country">Country</label>
                        <select class="custom-select col-lg-9 col-md-6 col-sm-8 px-1" id="country">
                            <option selected>Select Country</option>
                            <?php
                            $value = 1;
                            foreach (get_countries() as $country) {
                                echo '<option value="' . $value . '">' . $country . '</option>';
                                $value++;
                            }
                            ?>
                        </select>
                    </div>
                </fieldset>
            </form>

            <?php echo subsection_heading('languages-spoken', 'Languages spoken:', ' Start typing and select language'); ?>
            <div class="ui-widget">
                <input id="languages-spoken-input" class="col-6 px-1" aria-label="Languages spoken">
            </div>

            <?php echo subsection_heading('language-difficulties', 'Did you have any language difficulties?',''); ?>
            <textarea id="language-difficulties" class="col-lg-11 px-1" aria-label="Language difficulties"></textarea>

            <?php echo subsection_heading('physical-experience-sector', 'What was the sector of your PE? ', 'Check all that apply')?>
            <div class="row">
                <div class="col-lg-6 col-md-6 col-sm-12">
                    <?php
                        $pe_sector_btn_list_1 = array(
                            'physical-experience-sector-radio-btn-1' => 'Agriculture / Food Security / Hunger / Malnutrition',
                            'physical-experience-sector-radio-btn-2' => 'Collective Mobilization / Advocacy',
                            'physical-experience-sector-radio-btn-3' => 'Disaster / Humanitarian Relief',
                            'physical-experience-sector-radio-btn-4' => 'Environment / Sustainability',
                            'physical-experience-sector-radio-btn-5' => 'Fair Trade / Market Access',
                            'physical-experience-sector-radio-btn-6' => 'Gender Empowerment'
                        );
                        echo radio_buttons($pe_sector_btn_list_1);
                    ?>
                </div>
                <div class="col-lg-6 col-md-6 col-sm-12">
                    <?php
                        $pe_sector_btn_list_2 = array(
                            'physical-experience-sector-radio-btn-7' => 'Healthcare (Basic Heath, HIV/AIDS, Maternal, Child, etc)',
                            'physical-experience-sector-radio-btn-8' => 'Human Rights (Housing, Water, Sanitation) / Law',
                            'physical-experience-sector-radio-btn-9' => 'Immigration',
                            'physical-experience-sector-radio-btn-10' => 'Information Technology',
                            'physical-experience-sector-radio-btn-11' => 'Microfinance / Small Enterprise',
                            'physical-experience-sector-radio-btn-12' => 'Other (please describe below)'
                        );
                        echo radio_buttons($pe_sector_btn_list_2);
                    ?>
                    <input type="text" id="physical-experience-sector-other-input" class="col-10 px-1" />
                </div>
            </div>
            <?php echo subsection_heading('pe-cost', 'What was the cost of your PE? ', 'All incurred costs (i.e. transportation, housing, etc)'); ?>
            <?php echo slider('Stipended paid by organization', 'col-lg-6 px-0', 'stipend-paid', '5000', '0', '10000', '500'); ?>
            <?php echo slider('Cost of PE', 'col-lg-6 px-0', 'pe-cost', '5000', '0', '10000', '500'); ?>
            <br />
            <?php echo subsection_heading('pe-duration', 'What was the duration of your PE', ''); ?>
            <div class="row">
                <div class="col-lg-2"><?php echo radio_button_util('pe-duration-btn-1', '< 2 months'); ?></div>
                <div class="col-lg-2"><?php echo radio_button_util('pe-duration-btn-2', '2-4 months'); ?></div>
                <div class="col-lg-2"><?php echo radio_button_util('pe-duration-btn-3', '4-6 months'); ?></div>
                <div class="col-lg-2"><?php echo radio_button_util('pe-duration-btn-4', '6-12 months'); ?></div>
                <div class="col-lg-2"><?php echo radio_button_util('pe-duration-btn-5', '> 1 year'); ?></div>
            </div>

            <?php
                echo subsection_heading('org-description', 'Describe the work you did with your organization', ': 2 paragraphs');
                echo '<textarea name="" id="organization-description" class="col-lg-11 px-1"></textarea>';

                echo subsection_heading('org-typical-day', 'What was a typical day like while on your PE? (please consider housing, food, travel, weather, etc)', ': 2 paragraphs');
                echo '<textarea name="" id="organization-typical-day" class="col-lg-11 px-1"></textarea>';

                echo subsection_heading('org-strength-weakness', 'What were your organization\'s strengths and weaknesses?', ': 2 paragraphs');
                echo '<textarea name="" id="organization-strength-and-weakness" class="col-lg-11 px-1"></textarea>';

                echo subsection_heading('org-other-comments', 'Other comments you want to add?', '');
                echo '<textarea name="" id="organization-other-comments" class="col-lg-11 px-1"></textarea>';

                echo subsection_heading('how-responsive', 'How safe did you feel?', '');
            ?>
            <div class="row">
                <div class="col-lg-3">
                    <?php echo radio_button_util('how-safe-radio-1', '1 (very unsafe)'); ?>
                </div>
                <div class="col-lg-2">
                    <?php echo radio_button_util('how-safe-radio-2', '2'); ?>
                </div>
                <div class="col-lg-2">
                    <?php echo radio_button_util('how-safe-radio-3', '3'); ?>
                </div>
                <div class="col-lg-2">
                    <?php echo radio_button_util('how-safe-radio-4', '4'); ?>
                </div>
                <div class="col-lg-3">
                    <?php echo radio_button_util('how-safe-radio-5', '5 (very safe)'); ?>
                </div>
            </div>
            <?php echo subsection_heading('how-responsive', 'How responsive was your organization?', ''); ?>
            <div class="row">
                <div class="col-lg-3">
                    <?php echo radio_button_util('how-responsive-radio-1', '1 (rarely got back)'); ?>
                </div>
                <div class="col-lg-2">
                    <?php echo radio_button_util('how-responsive-radio-2', '2'); ?>
                </div>
                <div class="col-lg-2">
                    <?php echo radio_button_util('how-responsive-radio-3', '3'); ?>
                </div>
                <div class="col-lg-2">
                    <?php echo radio_button_util('how-responsive-radio-4', '4'); ?>
                </div>
                <div class="col-lg-3">
                    <?php echo radio_button_util('how-responsive-radio-5', '5 (right away)'); ?>
                </div>
            </div>
        </div>
        <hr />
        <div class="text-center">
            <button class="add-experience-btn" id="add-experience-btn1" >Save</button>
            <button class="add-experience-btn" id="add-experience-btn2" >Next ></button>
        </div>
    </div>
</div>

<?php get_footer(); ?>