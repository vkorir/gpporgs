$(document).ready(function () {
    // store signed in user details in sessionStorage
    $.ajax({
        url: '/wp-admin/admin-ajax.php?action=session_state',
        success: response => {
            // store user object globally
            const sessionData = JSON.parse(JSON.stringify(response));

            // dynamic styles
            const addExperienceOrgList = $('#add-experience-page #organization-info #organizations-list');
            const addExperienceOrgInfoName = $('#add-experience-page #organization-info #name');
            const orgListWidth = addExperienceOrgInfoName.width();
            const orgListRight = orgListWidth / 9 + 'px';
            addExperienceOrgList.css({ 'width': (orgListWidth + 12) + 'px', 'right': orgListRight} );

            // initialize datatable
            dataTableAjax({}, dataTablesUtil);

            function dataTableAjax(state, handler) {
                $.ajax({
                    type: 'post',
                    url: '/wp-admin/admin-ajax.php?action=database_records',
                    data: state ,
                    success: data => {
                        const newRows = [];
                        for (const organization of JSON.parse(JSON.stringify(data))) {
                            newRows.push(Object.values(organization));
                        }
                        handler(newRows);
                    }
                });
            }

            function dataTablesUtil(organizationRows) {
                const datatable = $('#organizations-database-records').DataTable( {
                    data: organizationRows,
                    columns: [
                        { title: 'id' },
                        { title: 'Name' },
                        { title: 'Type' },
                        { title: 'Location' },
                        { title: 'Sectors' },
                        { title: 'Region'},
                        { title: 'Average Cost' }
                    ],
                    columnDefs: [
                        {
                            targets: [0, 5, 6],
                            visible: false,
                            searchable: true
                        }
                    ],
                    pagingType: 'numbers',
                    scrollY: $('#table-container').height(),
                    scrollCollapse: true,
                    dom: 'rt<"bottom"lp>'
                }).on('click', 'tr', function () {
                    window.location.href = '/organization-details';
                    sessionStorage.setItem('targetOrgId', datatable.row($(this)).data()[0]);
                });

                // search bar
                $('#main-search-bar').keyup(function () {
                    datatable.search(this.value).draw();
                });

                // domestic and international filters
                const handler = newRows => datatable.clear().rows.add(newRows).draw();
                const areaDomestic = $('#area-radio-btn-1'), areaInternational = $('#area-radio-btn-2');
                areaDomestic.click(function () {
                    if (areaDomestic.prop('checked')) {
                        areaInternational.prop('checked', false);
                        dataTableAjax({ area: 'domestic' }, handler);
                    } else {
                        dataTableAjax({ area: 'all' }, handler);
                    }
                });
                areaInternational.click(function () {
                    if (areaInternational.prop('checked')) {
                        areaDomestic.prop('checked', false);
                        dataTableAjax({ area: 'international' }, handler);
                    } else {
                        dataTableAjax({ area: 'all' }, handler);
                    }
                });

                // enable filter by sectors on datatable
                for (let num = 1; num <= 8; num++) {
                    const elem = $('#sectors-btn-' + num);
                    elem.click(function () {
                        if (elem.prop('checked')) {
                            for (let nm = 1; nm <= 8; nm++) {
                                if (num !== nm) {
                                    $('#sectors-btn-' + nm).prop('checked', false);
                                }
                            }
                            dataTableAjax({ sector: elem.data('value') }, handler);
                        } else {
                            dataTableAjax({ sector: 'all' }, handler);
                        }
                    });
                }

                const priceRangeSlider = $('#price-range-slider');
                priceRangeSlider.change(() => {
                    $('#price-range-display').val(priceRangeSlider.val());
                    dataTableAjax({ price: priceRangeSlider.val() }, handler);
                });
            }

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
                    $('#add-experience-btn1').text('Cancel');
                    $('#add-experience-btn2').text('Next >');
                } else {
                    window.location.href = document.location.origin;
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
                    validateAndSaveFormFields();
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
                let availableLanguages = [];
                $.ajax({
                    url: '/wp-content/themes/gpporgs/data/languages.json',
                    success: data => {
                        data.forEach(item => {
                            availableLanguages.push(item['name']);
                        });
                    }
                });
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
                    organizationResponsiveness: 3,
                    timeStamp: Date.now(),
                    reviewerName: '',
                    reviewerEmail: '',
                    anonymousReview: 0
                }
            }


            // listen to radio button clicks
            // 1. affiliations
            let elem;
            for (let i = 1; i <= 6; i++) {
                elem = $(`#affiliation-radio-btn-${i}`);
                elem.click(() => {
                    console.log('clicked me!');
                });
            }




            // form fields
            let organizationPEInfoFields = initOrganizationPEInfoFields();
            const selectOneRadioButtons = new Set(['#organization-type-btn-', '#pe-duration-btn-', '#how-safe-radio-', '#how-responsive-radio-']);
            const radioButtonIds = {
                '#affiliation-radio-btn-': [6, 'organizationAffiliations'],
                '#organization-type-btn-': [7, 'organizationType'],
                '#organization-sector-btn-': [11, 'organizationSectors'],
                '#physical-experience-sector-radio-btn-': [11, 'physicalExperienceSectors'],
                '#pe-duration-btn-': [5, 'physicalExperienceDuration'],
                '#how-safe-radio-': [5, 'safetyScore'],
                '#how-responsive-radio-': [5, 'organizationResponsiveness']
            };
            const inputFields = {
                '#organization-type-btn-7': '#organization-type-other-input',
                '#organization-sector-btn-12': '#organization-sector-other-input',
                '#physical-experience-sector-radio-btn-12': '#physical-experience-sector-other-input'
            };

            for (const [id, [num, key]] of Object.entries(radioButtonIds)) {
                for (let i = 1; i <= num; i++) {
                    const targetId = id + i;
                    $(targetId).click(function () {
                        if (selectOneRadioButtons.has(id)) {
                            // uncheck all the other radio buttons and clear their data
                            for (let j = 1; j <= num; j++) {
                                const tId = id + j;
                                if (j !== i && $(tId).prop('checked')) {
                                    $(tId).prop('checked', false);
                                    if (j === num) {
                                        clearData(key, $(inputFields[tId]).val());
                                        $(inputFields[tId]).val('');
                                    }
                                }
                            }
                        }
                        let val = $(targetId).data('value');
                        if (id === '#how-safe-radio-' || id === '#how-responsive-radio-') {
                            val = parseInt(val[0]);
                        }
                        if (!Object.keys(inputFields).includes(targetId)) {
                            if ($(targetId).prop('checked')) {
                                storeData(key, val);
                            } else {
                                clearData(key, val);
                            }
                        } else if (!$(targetId).prop('checked')) {
                            $(inputFields[targetId]).val('');
                        }
                    });
                }
            }

            function storeData(dataId, dataValue) {
                if (['string', 'number'].includes(typeof organizationPEInfoFields[dataId])) {
                    organizationPEInfoFields[dataId] = dataValue;
                } else {
                    organizationPEInfoFields[dataId].push(dataValue);
                }
            }

            function clearData(dataId, dataValue) {
                if (typeof organizationPEInfoFields[dataId] === 'string') {
                    organizationPEInfoFields[dataId] = '';
                } else if (typeof organizationPEInfoFields[dataId] === 'number') {
                    organizationPEInfoFields[dataId] = 0;
                } else {
                    organizationPEInfoFields[dataId] = organizationPEInfoFields[dataId].filter(data => data !== dataValue);
                }
            }

            // on form submit
            function validateAndSaveFormFields() {
                readOtherFormData();
                readFormOptionsData();
                readPracticeExperienceInfo();
                flattenLists();

                // record reviewer name details

                organizationPEInfoFields['reviewerName'] = user['name'];
                organizationPEInfoFields['reviewerEmail'] = user['email'];
                const showReviewerName = $('#show-reviewer-name');
                showReviewerName.click(() => {
                    organizationPEInfoFields['anonymousReview'] = showReviewerName.prop('checked') ? 1 : 0;
                });

                // make a post request to php back-end
                $.ajax({
                    type: 'post',
                    url: '/wp-admin/admin-ajax.php?action=submission',
                    data: organizationPEInfoFields,
                    success: function () {
                        alert('Data submission success!');
                        organizationPEInfoFields = initOrganizationPEInfoFields();
                        window.location.href = document.location.origin;
                    },
                    error: function () {
                        alert('Failed to post data!');
                    }
                });
            }


            function readOtherFormData() {
                const formDataElemIds = {
                    '#organization-info #name': 'organizationName',
                    '#organization-info #street': 'organizationStreet',
                    '#organization-info #city': 'organizationCity',
                    '#organization-info #state': 'organizationState',
                    '#organization-info #zipcode': 'organizationZipCode',
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
                    '#organization-info #country option:selected': 'organizationCountry',
                    '#practice-experience-address #region option:selected': 'physicalExperienceRegion',
                    '#practice-experience-address #country option:selected': 'physicalExperienceCountry',

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

            /* ADD EXPERIENCE PAGE (populate organization data) */

            $('#add-experience-page').ready(() => {
                // handle organizations autocomplete
                addExperienceOrgInfoName.keyup(() => {
                    addExperienceOrgList.html('');
                    addExperienceOrgList.css({ 'display': 'none' });
                    clearOrganizationInputFields();
                    const prefix = addExperienceOrgInfoName.val();
                    if (prefix.length > 2) {
                        $.ajax({
                            url: '/wp-admin/admin-ajax.php?action=organizations',
                            data: { prefix },
                            success: data => {
                                const result = $.parseJSON(JSON.stringify(data));
                                organizationAutocompleteName(addExperienceOrgList, result);
                            }
                        });
                    }
                });

                // clears out organization information state on page
                function clearOrganizationInputFields() {
                    organizationPEInfoFields = initOrganizationPEInfoFields();
                    delete organizationPEInfoFields['organizationId'];
                    delete organizationPEInfoFields['organizationAddrId'];
                    delete organizationPEInfoFields['organizationContactsId'];

                    ['street', 'city', 'state', 'zipcode', 'phone', 'email', 'website'].forEach(elemId => {
                        $('#organization-info #' + elemId).val('');
                    });
                    ['#organization-type-other-input', '#organization-sector-other-input'].forEach(elemId => {
                        $(elemId).val('');
                    });
                    ['region', 'country'].forEach(elemId => {
                        $('#organization-info #' + elemId).prop('selectedIndex', 0);
                    });
                    const radios = {'#affiliation-radio-btn-': 6, '#organization-type-btn-': 7, '#organization-sector-btn-': 12 };
                    $.each(radios, (elemId, num) => {
                        for (let i = 1; i <= num; i++) {
                            if ($(elemId + i).prop('checked')) {
                                $(elemId + i).trigger('click');
                            }
                        }
                    });
                    [1, 2, 3].forEach(num => {
                        [' #name', ' #role', ' #phone', ' #email'].forEach(elemId => {
                            $('#organization-contact-' + num + elemId).val('');
                            if (num > 1) {
                                $('#organization-contact-' + num).addClass('d-none');
                            }
                        });
                    });
                }

                // output matching organization names
                function organizationAutocompleteName(elem, organizations) {
                    let html = '<ul class="list-unstyled m-0 p-0">';
                    let targetId, handler;
                    if (organizations.length > 0) {
                        organizations.forEach(function ({ id, name }, _) {
                            html += '<li class="m-0 p-0"><div id="organization-option-' + id + '">';
                            html += name + '</div></li>';
                            targetId = '#organization-option-' + id;
                            handler = () => addExperiencePopulateOrganizationInfo(id);
                        });
                        html += '</ul>';
                        elem.fadeIn();
                        elem.html(html);
                        elem.css({ 'display': 'block' });

                        setTimeout(() => {
                            $(targetId).click(() => {
                                $('#organization-info #organizations-list').css({ 'display': 'none' });
                                handler();
                            });
                        }, 100);
                    }
                }

                // populate organization input fields
                function addExperiencePopulateOrganizationInfo(id) {
                    organizationPEInfoFields['organizationId'] = id;
                    $.ajax({
                        url: '/wp-admin/admin-ajax.php?action=organization_info',
                        data: { id },
                        success: data => {
                            const [orgInfo, orgAddr, orgContacts] = JSON.parse(JSON.stringify(data));
                            const orgInfoFields = ['name', 'phone', 'email', 'website', 'location', 'region'];
                            const orgInfoAddr = ['street', 'city', 'state', 'zipcode'];
                            const orgInfoSelect = ['region', 'country'];
                            const contactFields = ['name', 'role', 'phone', 'email'];
                            const contactGroups = [
                                ['contact_1_', '#organization-contact-1'],
                                ['contact_2_', '#organization-contact-2'],
                                ['contact_3_', '#organization-contact-3']
                            ];
                            const pageId = '#add-experience-page ';
                            let elem;
                            // populate organization info
                            orgInfoFields.forEach(elemId => {
                                elem = $(pageId + '#organization-info #' + elemId);
                                elem.val(orgInfo[elemId]);
                            });
                            // populate organization affiliations
                            orgInfo['affiliations'].split('\r\n').forEach(affiliation => {
                                for (let i = 1; i <= 6; i++) {
                                    elem = $(pageId + '#affiliation-radio-btn-' + i);
                                    if (elem.data('value') === affiliation && !elem.prop('checked')) {
                                        elem.trigger('click');
                                    }
                                }
                            });
                            let checked;
                            // populate organization type
                            for (let i = 1; i <= 7; i++) {
                                elem = $(pageId + '#organization-type-btn-' + i);
                                if (elem.data('value') === orgInfo['type'] && !elem.prop('checked')) {
                                    elem.trigger('click');
                                    checked = true;
                                } else if (i === 7 && !checked && !elem.prop('checked')) {
                                    elem.trigger('click');
                                    $(pageId + '#organization-type-other-input').val(orgInfo['type'])
                                }
                            }
                            // populate organization sectors
                            orgInfo['sectors'].split('\r\n').forEach(sector => {
                                checked = false;
                                for (let i = 1; i <= 12; i++) {
                                    elem = $(pageId + '#organization-sector-btn-' + i);
                                    if (elem.data('value') === sector && !elem.prop('checked')) {
                                        elem.trigger('click');
                                        checked = true;
                                    } else if (i === 12 && !checked && !elem.prop('checked')) {
                                        elem.trigger('click');
                                        $(pageId + '#organization-sector-other-input').val(sector);
                                    }
                                }
                            });
                            // populate organization info select options
                            orgInfoSelect.forEach(elemId => {
                                elem = $(pageId + '#organization-info #' + elemId);
                                let key = elemId === 'country' ? 'location' : elemId;
                                const selectedIndex = getOptionsArray(elem).indexOf(orgInfo[key]);
                                elem.prop('selectedIndex', selectedIndex);
                            });
                            // populate organization address
                            orgInfoAddr.forEach(elemId => {
                                elem = $(pageId + '#organization-info #' + elemId);
                                elem.val(orgAddr[elemId]);
                            });
                            // populate contact details
                            contactGroups.forEach(group => {
                                contactFields.forEach(field => {
                                    elem = $(pageId + group[1] + ' #' + field);
                                    elem.val(orgContacts[group[0] + field]);
                                    if (orgContacts[group[0] + field] !== '') {
                                        $(pageId + group[1]).removeClass('d-none');
                                    }
                                });
                            });
                        }
                    });

                    function getOptionsArray(elem) {
                        const options = [];
                        $(elem).find('option').each(function () {
                            options.push($(this).text());
                        });
                        return options;
                    }
                }
            });


            /* ORGANIZATION DETAILS (populate organization data display and reviews) */

            $('#organization-details-page').ready(() => {
                const id = sessionStorage.getItem('targetOrgId');
                const orgInfoAddr = ['street', 'city', 'state', 'zipcode'];

                $.ajax({
                    url: '/wp-admin/admin-ajax.php?action=organization_info',
                    data: { id },
                    success: data => {
                        const [orgInfo, orgAddr, orgContacts] = JSON.parse(JSON.stringify(data));
                        const orgInfoFields = ['name', 'phone', 'email', 'website', 'location', 'region'];
                        const orgInfoSelect = ['region', 'country'];
                        const contactFields = ['name', 'role', 'phone', 'email'];
                        const contactGroups = [
                            ['contact_1_', '#organization-contact-1'],
                            ['contact_2_', '#organization-contact-2'],
                            ['contact_3_', '#organization-contact-3']
                        ];
                        const pageId = '#organization-details-page ';
                        let elem;
                        // populate organization info
                        orgInfoFields.forEach(elemId => {
                            elem = $(pageId + '#organization-info #' + elemId);
                            updateField(elem, orgInfo[elemId]);
                        });
                        // populate organization affiliations
                        let affiliations = '';
                        orgInfo['affiliations'].split('\r\n').forEach(affiliation => {
                            affiliations += radioUtil(affiliation);
                        });
                        $(pageId + ' #affiliations').html(affiliations);
                        // populate type of of organization
                        let type = radioUtil(orgInfo['type']);
                        $(pageId + '#type').html(type);
                        // populate organization sectors
                        let sectors = '';
                        orgInfo['sectors'].split('\r\n').forEach(sector => {
                            sectors += radioUtil(sector);
                        });
                        $(pageId + ' #sectors').html(sectors);
                        // populate organization address
                        orgInfoAddr.forEach(elemId => {
                            elem = $(pageId + '#organization-info #' + elemId);
                            elem.val(orgAddr[elemId]);
                            elem.prop('disabled', true);
                        });
                        // populate organization info select option
                        orgInfoSelect.forEach(elemId => {
                            elem = $(pageId + '#organization-info #' + elemId);
                            const key = elemId === 'country' ? 'location' : elemId;
                            updateField(elem, orgInfo[key]);
                        });
                        // populate organization contacts
                        let noContact = true;
                        if (orgContacts != null) {
                            contactGroups.forEach(group => {
                                contactFields.forEach(field => {
                                    elem = $(pageId + group[1] + ' #' + field);
                                    if (orgContacts[group[0] + field] !== '') {
                                        elem.val(orgContacts[group[0] + field]);
                                        $(pageId + group[1]).removeClass('d-none');
                                        noContact = false;
                                    } else {
                                        elem.val('-');
                                    }
                                    elem.prop('disabled', true);
                                });
                            });
                        }
                        if (noContact) {
                            $(pageId + '#no-contact-info').removeClass('d-none');
                        }
                        // approved status
                        elem = $('#approval-status');
                        elem.html(`<strong style="color: #4885af;">Approved:</strong> ${orgInfo['approved_status'] == 1 ? 'Yes' : 'No'}`);
                        elem.removeClass('d-none');
                    }
                });

                // populate organization reviews
                $.ajax({
                    url: '/wp-admin/admin-ajax.php?action=organization_reviews',
                    data: { id },
                    success: data => {
                        const orgReviews = JSON.parse(JSON.stringify(data));
                        let addressInfo;
                        const reviews = [];
                        let html, count = 1;
                        orgReviews.forEach(review => {
                            addressInfo = review['address'];
                            html = '<div class="row"><div class="col">';
                            html += `<h6 class="review-header">Review #${count} <span>${getTimeDisplay(review['timestamp'], review)}</span></h6>`;
                            html += `<p><strong class="review-description">Country: </strong>${addressInfo['country']}</p>`;
                            html += `<p><strong class="review-description">Region: </strong>${review['region']}</p>`;
                            html += `<p><strong class="review-description">City/Town Name: </strong>${addressInfo['city']}</p>`;
                            html += `<p><strong class="review-description">Please list the languages spoken at your PE location: </strong><br />${review['languages_spoken'].split(',').join('<br />')}</p>`;
                            html += `<p><strong class="review-description">Did you experience any language difficulties? Please describe</strong><br />${review['language_difficulties']}</p>`;
                            html += `<p><strong class="review-description">Sectors: </strong><br />\n${review['sectors'].split('\r\n').join('<br />')}</p>`;
                            html += `<p><strong class="review-description">What was the cost of your PE? </strong>$${review['cost_of_pe']}</p>`;
                            html += `<p><strong class="review-description">How much stipend were you paid by the organization: </strong>$${review['stipend_by_organization']}</p>`;
                            html += `<p><strong class="review-description">What was the duration of your PE? </strong>${review['pe_duration']}</p>`;
                            html += `<p><strong class="review-description">Please describe the work you did with your organization:</strong><br />${review['what_you_did']}</p>`;
                            html += `<p><strong class="review-description">What was a typical day like while on your PE? (please consider housing, food, travel, weather, etc)</strong><br />${review['typical_day']}</p>`;
                            html += `<p><strong class="review-description">What were your organization's strengths and weaknesses?</strong><br />${review['strength_and_weaknesses']}</p>`;
                            html += `<p><strong class="review-description">Is there anything else you would like to share with other students who may work with this organization?</strong><br />${review['other_comments']}</p>`;
                            html += '</div></div>';
                            count++;
                            reviews.push(html);
                        });
                        $('#organization-reviews-container').html(reviews.join('<hr class="w-100" />'));
                    }
                });

                function updateField(elem, val) {
                    if (val === '') {
                        elem.val('-');
                    } else if (val.includes('http') || val.includes('www')) {
                        elem.prop('href', val);
                        elem.text(val);
                    } else {
                        elem.val(val);
                    }
                    elem.prop('disabled', true);
                }

                function radioUtil(value) {
                    return `<label class="label-container w-100"><input type="checkbox" data-value="${value}" checked disabled><span class="checkmark"></span>${value}</label>`;
                }

                function getTimeDisplay(timestamp, review) {
                    const months = ['Jan', 'Feb', 'Mar', 'Apr', 'June', 'July', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];
                    const days = ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'];
                    const date = new Date(parseFloat(timestamp));
                    const dd = date.getDay();
                    const mm = date.getMonth();
                    const d = date.getDate();
                    const yy = date.getFullYear();
                    const h = date.getHours();
                    const m = date.getMinutes();
                    const s = date.getSeconds();
                    let reviewerDetails = '';
                    if (user['roles'].includes('admin') || review['anonymous_review'] === '0') {
                        reviewerDetails = `by <strong>${review['reviewer_name']} (${review['reviewer_email']}) </strong>`;
                    }
                    return `<i style="font-size: 14px;">${reviewerDetails} on ${days[dd]}, ${months[mm]} ${d}, ${yy} ${h}:${m}:${s}</i>`;
                }

                const organizationDetailsSwitchBtn = $('#organization-details-btn');
                const organizationDetailsSwitchBtnText = 'Organization Reviews';
                $('#organization-details-page .add-contact-btn-container').addClass('d-none');
                organizationDetailsSwitchBtn.click(() => {
                    if (organizationDetailsSwitchBtn.text() === organizationDetailsSwitchBtnText) {
                        $('#organization-details-page .add-experience-container.right-page').css({ display: 'block' });
                        $('#organization-details-page .add-experience-container.left-page').css({ display: 'none' });
                        $('#organization-details-page .text-center .display-5').text('Organization Reviews');
                        organizationDetailsSwitchBtn.text('Organization Details');
                        $('#org-details-page-header div h3').text('Organization Reviews');
                    } else {
                        $('#organization-details-page .add-experience-container.left-page').css({ display: 'block' });
                        $('#organization-details-page .add-experience-container.right-page').css({ display: 'none' });
                        $('#organization-details-page .text-center .display-5').text('Organization Details');
                        organizationDetailsSwitchBtn.text(organizationDetailsSwitchBtnText);
                        $('#org-details-page-header div h3').text('Organization Details');
                    }
                });
            });
        }
    });
});