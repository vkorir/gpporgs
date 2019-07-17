<?php
/**
 * Created by PhpStorm.
 * Template Name: Organization Details Page
 * User: victor
 * Date: 2019-03-14
 * Time: 10:56
 */

get_header();
?>

<div class="container" id="organization-details-page">
    <div class="rounded-container max-height">
        <div id="org-details-page-header">
            <?php echo page_title('Organization Details');?>
        </div>
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
                    echo fieldset_item('zipCode', 'number', 'Zip Code');
                    echo fieldset_item('region', 'text', 'Region');
                    echo fieldset_item('country', 'text', 'Country');
                    echo fieldset_item('phone', 'tel', 'Phone');
                    echo fieldset_item('email', 'email', 'Email');
                    ?>
                    <div>
                        <label class="col-lg-2 col-md-2 col-sm-1 m-0">Website: </label>
                        <a class="col-lg-9 col-md-6 col-sm-8 px-1 m-0" href="" id="website" target="_blank"></a>
                    </div>
                </fieldset>
            </form>
            <?php echo subsection_heading('affiliation', 'Affiliation', ''); ?>
            <div class="row">
                <div class="col" id="affiliations">
                    <!--       populate with organization affiliations       -->
                </div>
            </div>
            <?php echo subsection_heading('organization-type', 'Type of Organization', ''); ?>
            <div class="row">
                <div class="col" id="type">
                    <!--       populate with organization type       -->
                </div>
            </div>
            <?php echo subsection_heading('organization-sector', 'Sector of Organization', ''); ?>
            <div class="row">
                <div class="col" id="sectors">
                    <!--       populate with organization sectors       -->
                </div>
            </div>
            <br />
            <?php echo section_subheading('CONTACT INFORMATION'); ?>
            <div id="organization-contacts">
                <form id="organization-contacts" action="">
                    <fieldset id="organization-contact-1" class="d-none">
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
                    <fieldset id="no-contact-info" class="d-none">
                        <p>No contact information provided.</p>
                        <hr class="w-100" />
                    </fieldset>
                    <p id="approval-status" class="d-none"></p>
                </form>
            </div>
        </div>
        <div class="add-experience-container right-page">
            <div id="organization-reviews-container">
                <!--    populate organization reviews        -->

            </div>
        </div>
        <hr />
        <div class="text-center">
<!--            <button class="add-experience-btn" id="organization-details-add-review-btn">Add Review</button>-->
            <button class="add-experience-btn" id="organization-details-btn" >Organization Reviews</button>
        </div>
    </div>

</div>

<?php

get_footer();
