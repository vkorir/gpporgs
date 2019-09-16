<?php
/**
 * Created by PhpStorm.
 * Template Name: New Organization Page
 * User: victor
 * Date: 2019-03-14
 * Time: 10:56
 */

get_header();

session_start();

if ($_SESSION['access_code_verified']) { ?>
<div class="container" id="new-organization-page">
    <div class="rounded-container max-height">
        <?php echo page_title('New Organization'); ?>
        <hr />
        <?php echo section_subheading('ORGANIZATION INFORMATION'); ?>
        <form id="organization-info" action="">
            <fieldset>
                <?php
                echo fieldset_item('name', 'text', 'Name');
                echo fieldset_item('street', 'text', 'Street');
                echo fieldset_item('city', 'text', 'City');
                echo fieldset_item('state', 'text', 'State');
                echo fieldset_item('zipCode', 'number', 'Zip Code');
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
                        <?php var_dump(get_countries()); ?>
                    </select>
                </div>
                <?php
                echo fieldset_item('phone', 'tel', 'Phone');
                echo fieldset_item('email', 'email', 'Email');
                echo fieldset_item('website', 'url', 'Website');
                ?>
            </fieldset>
        </form>
        <?php echo subsection_heading('organization-description-header', 'Describe the Organization',''); ?>
        <textarea id="description" class="col-lg-11 px-1" aria-label="Organization Description"></textarea>
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
                    'organization-sector-btn-1' => 'Agriculture / Food Security',
                    'organization-sector-btn-2' => 'Collective Mobilization / Advocacy',
                    'organization-sector-btn-3' => 'Disaster / Humanitarian Relief',
                    'organization-sector-btn-4' => 'Education',
                    'organization-sector-btn-5' => 'Energy',
                    'organization-sector-btn-6' => 'Environment / Sustainability',
                    'organization-sector-btn-7' => 'Fair Trade/Market Access',
                    'organization-sector-btn-8' => 'Gender Empowerment',
                    'organization-sector-btn-9' => 'Health',
                    'organization-sector-btn-10' => 'Housing'
                );
                echo radio_buttons($sector_org_btn_list_1);
                ?>
            </div>
            <div class="col-lg-6 col-md-6 col-sm-12">
                <?php
                $sector_org_btn_list_2 = array(
                    'organization-sector-btn-11' => 'Human Rights / Law',
                    'organization-sector-btn-12' => 'Hunger / Malnutrition',
                    'organization-sector-btn-13' => 'Law',
                    'organization-sector-btn-14' => 'Immigration',
                    'organization-sector-btn-15' => 'Information Technology',
                    'organization-sector-btn-16' => 'Microfinance',
                    'organization-sector-btn-17' => 'Refugee / Displaced Persons',
                    'organization-sector-btn-18' => 'Water / Sanitation',
                    'organization-sector-btn-19' => 'Other (please describe below)'
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
        <div class="text-center add-contact-btn-container">
            <button id="add-contact-btn">Add Contact+</button>
        </div>
        <hr />
        <div class="text-center">
            <button class="add-experience-btn" id="new-organization-btn" >Submit</button>
        </div>
    </div>
</div>
<?php } else { ?>
<div id="new-organization-page" class="container" style="height: calc(100vh - 200px); display: flex; align-items: center;">
    <div class="text-center w-100">
        <input id="access-code-input" class="text-center col-2" aria-label="Access Code" placeholder="Enter access code" /><br>
        <sup id="invalid-access-code" class="text-center" style="color: transparent;">Invalid access code</sup>
    </div>
</div>
<?php } get_footer(); ?>