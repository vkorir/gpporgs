<?php echo section_subheading('ORGANIZATION INFORMATION'); ?>
<form id="organization-info" action="">
    <fieldset>
        <div style="position: relative;">
            <label for="name" class="col-lg-2 col-md-2 col-sm-1">Name</label>
            <input class="col-lg-9 col-md-6 col-sm-8 px-1" type="text" placeholder="Type to start searching organization..." id="name" />
            <div class="col-lg-9 col-md-6 col-sm-8 px-1" id="organizations-list"></div>
        </div>
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
<div class="text-center add-contact-btn-container">
    <button id="add-contact-btn">Add Contact+</button>
</div>