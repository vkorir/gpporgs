
// use datatables library
$(document).ready(function () {

    const datatable = $('#organizations-database-records').DataTable({
        processing: true,
        serverSide: true,
        ajax: '/wp-admin/admin-ajax.php?action=database_records',
        pagingType: 'numbers',
        scrollY: "500px",
        scrollCollapse: true,
        dom: 'rt<"bottom"lp>',
        columnDefs: [
            {
                targets: [4],
                visible: false,
                searchable: true
            }
        ]
    });
    $('#main-search-bar').keyup(function () {
        datatable.search(this.value).draw();
    });

    // restrict number entries
    const zipcode_ids = ['#organization-info #zipcode', '#practice-experience-address #zipcode'];
    for (const zipcode_id of zipcode_ids) {
        $(zipcode_id).keypress(function () {
            return isNumberKey(event, zipcode_id, 5);
        });
    }
    function isNumberKey(event, id, maxNumEntries) {
        const charcode = event.which ? event.which : event.keyCode;
        if (charcode > 31 && (charcode < 48 || charcode > 57)) {
            return false;
        }
        return $(id).val().length < maxNumEntries;
    }

   // page transitions
    $('#add-experience-btn1').click(function () {
        if ($('#add-experience-btn1').text() === '< Prev') {
            // show left page, hide right page, change button text
            $('.add-experience-container.left-page').css('display', 'block');
            $('.add-experience-container.right-page').css('display', 'none');
            $('#add-experience-btn1').text('Save');
            $('#add-experience-btn2').text('Next >');
        } else {
            // handle save form data
            saveFormFields();
            // window.location.href = document.location.origin;
        }
    });
    $('#add-experience-btn2').click(function () {
        if ($('#add-experience-btn2').text() === 'Next >') {
            // show right page, hide left page, change button text
            $('.add-experience-container.right-page').css('display', 'block');
            $('.add-experience-container.left-page').css('display', 'none');
            $('#add-experience-btn1').text('< Prev');
            $('#add-experience-btn2').text('Submit');
        } else {
            // handle submit form data
            validateFormFields();
        }
    });

    // toggle practice experience address
    $('#pe-address-diff-no').prop('checked', true);
    $('#pe-address-diff-yes').click(function () {
        $('#practice-experience-address').css({'display': 'block'});
        $('#pe-address-diff-no').prop('checked', false);
        $('#pe-address-diff-yes').prop('checked', true);
    });
    $('#pe-address-diff-no').click(function () {
        $('#practice-experience-address').css({'display': 'none'});
        $('#pe-address-diff-yes').prop('checked', false);
        $('#pe-address-diff-no').prop('checked', true);
    });


    // add contact field
    $('#add-contact-btn').click(function () {
        if ($('#organization-contact-2').css('display') === 'none') {
            $('#organization-contact-2').removeClass('d-none');
        } else if ($('#organization-contact-3').css('display') === 'none') {
            $('#organization-contact-3').removeClass('d-none');
        } else {
            $('#max-contacts-warning').removeClass('d-none');
            setTimeout(function () {
                $('#max-contacts-warning').addClass('d-none');
            }, 2000);
        }
        document.querySelector('#add-contact-btn').scrollIntoView();
    });

    // language selector jquery library
    $( function() {
        let availableLanguages = [
            'English',
            'French',
            'Spanish',
            'Italian',
            'Chinese',
            'Swahili',
            'Arabic'
        ];
        function split( val ) {
            return val.split( /,\s*/ );
        }
        function extractLast( term ) {
            return split( term ).pop();
        }

        $( '#languages-spoken-input' )
        // don't navigate away from the field on tab when selecting an item
            .on( 'keydown', function( event ) {
                if ( event.keyCode === $.ui.keyCode.TAB &&
                    $( this ).autocomplete( 'instance' ).menu.active ) {
                    event.preventDefault();
                }
            })
            .autocomplete({
                minLength: 0,
                source: function( request, response ) {
                    // delegate back to autocomplete, but extract the last term
                    response( $.ui.autocomplete.filter(
                        availableLanguages, extractLast( request.term ) ) );
                },
                focus: function() {
                    // prevent value inserted on focus
                    return false;
                },
                select: function( event, ui ) {
                    let terms = split( this.value );
                    // remove the current input
                    terms.pop();
                    // add the selected item
                    terms.push( ui.item.value );
                    // add placeholder to get the comma-and-space at the end
                    terms.push( '' );
                    this.value = terms.join( ', ' );
                    return false;
                }
            });
    });

    function initOrganizationPEInfoFields() {
        return {
            organizationId: '',
            organizationName: '',
            organizationStreet: '',
            organizationCity: '',
            organizationState: '',
            organizationZipCode: '',
            organizationRegion: '',
            organizationCountry: '',
            organizationPhone: '',
            organizationEmail: '',
            organizationWebsite: '',
            organizationAffiliations: [],
            organizationType: '',
            organizationSectors: [],
            organizationContact1Name: '',
            organizationContact1Role: '',
            organizationContact1Phone: '',
            organizationContact1Email: '',
            organizationContact2Name: '',
            organizationContact2Role: '',
            organizationContact2Phone: '',
            organizationContact2Email: '',
            organizationContact3Name: '',
            organizationContact3Role: '',
            organizationContact3Phone: '',
            organizationContact3Email: '',
            physicalExperienceStreet: '',
            physicalExperienceCity: '',
            physicalExperienceState: '',
            physicalExperienceZipCode: '',
            physicalExperienceRegion: '',
            physicalExperienceCountry: '',
            languagesSpoken: '',
            languageDifficulties: '',
            physicalExperienceSectors: [],
            stipendPaidByOrganization: 0,
            costOfPhysicalExperience: 0,
            physicalExperienceDuration: '',
            workWithOrganization: '',
            physicalExperienceTypicalDay: '',
            organizationStrengthsAndWeaknesses: '',
            otherComments: '',
            safetyScore: 3,
            organizationResponsiveness: 3
        }
    }

    // form fields
    let organizationPEInfoFields = initOrganizationPEInfoFields();

    const radioButtonIds = {
        '#affiliation-radio-btn-': [6, 'organizationAffiliations'],
        '#organization-type-btn-': [7, 'organizationType'],
        '#organization-sector-btn-': [11, 'organizationSectors'],
        '#physical-experience-sector-radio-btn-': [11, 'physicalExperienceSectors'],
        '#pe-duration-btn-': [5, 'physicalExperienceDuration'],
        '#how-safe-radio-': [5, 'safetyScore'],
        '#how-responsive-radio-': [5, 'organizationResponsiveness']
    };

    const selectOneRadioButtons = new Set(['#organization-type-btn-', '#pe-duration-btn-', '#how-safe-radio-', '#how-responsive-radio-']);

    for (const [id, [count, key]] of Object.entries(radioButtonIds)) {
        for (let num = 1; num <= count; num++) {
            const targetId = id + num;
            $(targetId).click(function () {
                if (selectOneRadioButtons.has(id)) {
                    // uncheck all the other buttons
                    for (let nm = 1; nm <= count; nm++) {
                        const tId = id + nm;
                        if (nm !== num) {
                            $(tId).prop('checked', false);
                            if (tId === '#organization-type-btn-7') {
                                // clear custom input
                                $('#organization-type-other-input').val('');
                            }
                        }
                    }
                }
                // handle checked logic. if a button is already checked, uncheck and clear data. otherwise read data
                let val = $(targetId).attr('data-value');
                if (id === '#how-safe-radio-' || id === '#how-responsive-radio-') {
                    val = parseInt(val[0]);
                }
                if ($(targetId).attr('checked') === 'checked') {
                    $(targetId).prop('checked', false);
                    clearData(key, val);
                } else {
                    storeData(key, val);
                }
            });
        }
    }

    function storeData(dataId, dataValue) {
        const dataType = typeof organizationPEInfoFields[dataId];
        if (dataType === 'string' || dataType === 'number') {
            organizationPEInfoFields[dataId] = dataValue;
        } else {
            organizationPEInfoFields[dataId].push(dataValue);
        }
    }

    function clearData(dataId, dataValue) {
        const dataType = typeof organizationPEInfoFields[dataId];
        if (dataType === 'string') {
            organizationPEInfoFields[dataId] = '';
        } else if (dataType === 'number') {
            organizationPEInfoFields[dataId] = 0;
        } else {
            const remaining = [];
            for (const value of organizationPEInfoFields[dataId]) {
                if (value !== dataValue) {
                    remaining.push(dataValue);
                }
            }
            organizationPEInfoFields[dataId] = remaining;
        }
    }
    
    
    // highlight all unchecked fields
    function highlightAllUncheckedFields() {
        
    }
    
    
    // save form fields
    function saveFormFields() {
        
    }

    // on form submit
    function validateFormFields() {
        readOtherFormData();
        readFormOptionsData();
        readPracticeExperienceInfo();
        flattenLists();

        const res = { error: false };
        for (const val of Object.values(organizationPEInfoFields)) {
            if (val.length === true) {
                res.error = true;
            }
        }

        // make a post request to php back-end
        $.ajax({
            type: 'post',
            url: '/wp-admin/admin-ajax.php?action=submission',
            data: organizationPEInfoFields,
            success: function (response) {
                alert('Data submission success!');
                organizationPEInfoFields = initOrganizationPEInfoFields();
                // window.location.href = '/';
                console.log(response);
            },
            error: function () {
                alert('Failed to post data!');
            }
        });

        return res;
    }


    function readOtherFormData() {
        const formDataElemIds = {
            '#organization-info #name': 'organizationName',
            '#organization-info #street': 'organizationStreet',
            '#organization-info #city': 'organizationCity',
            '#organization-info #state': 'organizationState',
            '#organization-info #zipcode': 'organizationZipCode',
            '#organization-info #country': 'organizationCountry',
            '#organization-info #phone': 'organizationPhone',
            '#organization-info #email': 'organizationEmail',
            '#organization-info #website': 'organizationWebsite',
            '#languages-spoken-input': 'languagesSpoken',
            '#language-difficulties': 'languageDifficulties',
            '#organization-description': 'workWithOrganization',
            '#organization-typical-day': 'physicalExperienceTypicalDay',
            '#organization-strength-and-weakness': 'organizationStrengthsAndWeaknesses',
            '#organization-other-comments': 'otherComments',
            '#stipend-paid-display': 'stipendPaidByOrganization',
            '#pe-cost-display': 'costOfPhysicalExperience',
            '#organization-contact-1 #name': 'organizationContact1Name',
            '#organization-contact-1 #role': 'organizationContact1Role',
            '#organization-contact-1 #phone': 'organizationContact1Phone',
            '#organization-contact-1 #email': 'organizationContact1Email',
            '#organization-contact-2 #name': 'organizationContact2Name',
            '#organization-contact-2 #role': 'organizationContact2Role',
            '#organization-contact-2 #phone': 'organizationContact2Phone',
            '#organization-contact-2 #email': 'organizationContact2Email',
            '#organization-contact-3 #name': 'organizationContact3Name',
            '#organization-contact-3 #role': 'organizationContact3Role',
            '#organization-contact-3 #phone': 'organizationContact3Phone',
            '#organization-contact-3 #email': 'organizationContact3Email'
        };
        for (const [elemId, dataId] of Object.entries(formDataElemIds)) {
            organizationPEInfoFields[dataId] = $(elemId).val();
        }

        // checked other option radio buttons input
        if ($('#organization-type-btn-7').prop('checked')) {
            storeData('organizationType', $('#organization-type-other-input').val());
        }
        if ($('#organization-sector-btn-12').prop('checked')) {
            storeData('organizationSectors', $('#organization-sector-other-input').val());
        }
        if ($('#physical-experience-sector-radio-btn-12').prop('checked')) {
            storeData('physicalExperienceSectors', $('#physical-experience-sector-other-input').val());
        }

        // parse string to number
        const orgZipCode = organizationPEInfoFields['organizationZipCode'];
        const peZipCode = organizationPEInfoFields['physicalExperienceZipCode'];
        const stipendPaid = organizationPEInfoFields['stipendPaidByOrganization'];
        const peCost = organizationPEInfoFields['costOfPhysicalExperience'];
        organizationPEInfoFields['organizationZipCode'] = parseInt(orgZipCode);
        organizationPEInfoFields['physicalExperienceZipCode'] = parseInt(peZipCode);
        organizationPEInfoFields['stipendPaidByOrganization'] = parseInt(stipendPaid);
        organizationPEInfoFields['costOfPhysicalExperience'] = parseInt(peCost);
    }

    function readFormOptionsData() {
        const formElemIds = {
            '#organization-info #region option:selected': 'organizationRegion',
            '#practice-experience-address #region option:selected': 'physicalExperienceRegion',

        };
        for (const [elemId, dataId] of Object.entries(formElemIds)) {
            organizationPEInfoFields[dataId] = $(elemId).text();
        }
    }

    function readPracticeExperienceInfo() {
        let id = '#practice-experience-address';
        if ($('#pe-address-diff-no').prop('checked')) {
            id = '#organization-info';
        }
        const fields = {
            'street': 'physicalExperienceStreet',
            'city': 'physicalExperienceCity',
            'state': 'physicalExperienceState',
            'zipcode': 'physicalExperienceZipCode',
            'country': 'physicalExperienceCountry'
        };
        for (const [elemId, dataId] of Object.entries(fields)) {
            const targetId = id + ' #' + elemId;
            organizationPEInfoFields[dataId] = $(targetId).val();
        }
    }

    function flattenLists() {
        for (const [key, val] of Object.entries(organizationPEInfoFields)) {
            if (typeof val === 'object') {
                organizationPEInfoFields[key] = organizationPEInfoFields[key].join('\r\n');
            }
        }
    }
});