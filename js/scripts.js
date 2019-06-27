$(document).ready(() => {
    /** GENERAL SCRIPTS **/

    // dynamic styles (look at it later)
    const addExperienceOrgList = $('#add-experience-page #organization-info #organizations-list');
    const addExperienceOrgInfoName = $('#add-experience-page #organization-info #name');
    const orgListWidth = addExperienceOrgInfoName.width();
    const orgListRight = orgListWidth / 9 + 'px';
    addExperienceOrgList.css({ 'width': (orgListWidth + 12) + 'px', 'right': orgListRight} );

    // restrict zip code entry to numbers and length 5
    ['#organization-info', '#practice-experience-address'].forEach(prefixId => {
        $(`${prefixId} #zipcode`).keypress(() => {
            return isNumberKey(event, `${prefixId} #zipcode`, 5);
        });
    });
    function isNumberKey(event, id, maxNumEntries) {
        const charcode = event.which ? event.which : event.keyCode;
        if (charcode > 31 && (charcode < 48 || charcode > 57)) {
            return false;
        }
        return $(id).val().length < maxNumEntries;
    }

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


    /** 1. LOAD SESSION STATE **/

    $.ajax({
        url: '/wp-admin/admin-ajax.php?action=session_state',
        success: response => {
            const sessionState = $.parseJSON(JSON.stringify(response));

            function resetSessionState() {
                sessionState['organization'] = {
                    affiliations: [],
                    sectors: [],
                    contacts: [{}, {}, {}]
                };
                sessionState['review'] = {
                    sectors: []
                };
            }

            /** 2. PREPARE DATATABLE **/

            function dataTableAjaxUtil(handler) {
                $.ajax({
                    url: '/wp-admin/admin-ajax.php?action=datatable_data',
                    data: sessionState['dataTableFilters'] ,
                    success: response => {
                        const dataTableRows = [];
                        for (const organization of $.parseJSON(JSON.stringify(response))) {
                            dataTableRows.push(Object.values(organization));
                        }
                        handler(dataTableRows);
                    }
                });
            }

            // initialize datatable
            dataTableAjaxUtil(dataTableRows => {
                const dataTable = $('#organizations-database-records').DataTable({
                    data: dataTableRows,
                    columns: [
                        { title: 'id' },
                        { title: 'Name' },
                        { title: 'Type' },
                        { title: 'Location' },
                        { title: 'Sectors' },
                        { title: 'Region' },
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
                    sessionStorage.setItem('selectedOrgId', dataTable.row($(this)).data()[0]);
                    window.location.href = '/organization-details';
                });

                // configure search bar
                $('#main-search-bar').keyup(function () {
                    dataTable.search(this.value).draw();
                });

                // domestic or international filter
                const applyFilterHandler = filteredRows => dataTable.clear().rows.add(filteredRows).draw();
                const areaDomestic = $('#area-radio-btn-1');
                const areaInternational = $('#area-radio-btn-2');
                areaDomestic.click(() => {
                    if (areaDomestic.prop('checked')) {
                        areaInternational.prop('checked', false);
                        sessionState['dataTableFilters']['area'] = 'domestic';
                        dataTableAjaxUtil(applyFilterHandler);
                    } else {
                        sessionState['dataTableFilters']['area'] = 'all';
                        dataTableAjaxUtil(applyFilterHandler);
                    }
                });
                areaInternational.click(() => {
                    if (areaInternational.prop('checked')) {
                        areaDomestic.prop('checked', false);
                        sessionState['dataTableFilters']['area'] = 'international';
                        dataTableAjaxUtil(applyFilterHandler);
                    } else {
                        sessionState['dataTableFilters']['area'] = 'all';
                        dataTableAjaxUtil(applyFilterHandler);
                    }
                });

                // sector filter
                let elem;
                for (let i = 1; i <= 8; i++) {
                    elem = $(`#sectors-btn-${i}`);
                    elem.click(function () {
                        elem = $(this);
                        if (elem.prop('checked')) {
                            for (let j = 1; j <= 8; j++) {
                                if (i !== j) {
                                    $(`#sectors-btn-${j}`).prop('checked', false);
                                }
                            }
                            sessionState['dataTableFilters']['sector'] = elem.data('value');
                            dataTableAjaxUtil(applyFilterHandler);
                        } else {
                            sessionState['dataTableFilters']['sector'] = 'all';
                            dataTableAjaxUtil(applyFilterHandler);
                        }
                    });
                }

                // price range filter
                const priceRangeSlider = $('#price-range-slider');
                priceRangeSlider.change(() => {
                    const price = priceRangeSlider.val();
                    $('#price-range-display').val(price);
                    sessionState['dataTableFilters']['price'] = price;
                    dataTableAjaxUtil(applyFilterHandler);
                });
            });


            /** 3. HANDLE ORGANIZATION DETAILS **/

            $('#organization-details-page').ready(() => {
                const organizationId = sessionStorage.getItem('selectedOrgId');
                const pageId = '#organization-details-page';
                $.ajax({
                    url: '/wp-admin/admin-ajax.php?action=organization_details',
                    data: { organizationId },
                    success: response => {
                        const [details, address, contacts] = JSON.parse(JSON.stringify(response));
                        const addressInputFields = ['street', 'city', 'state', 'zipcode'];
                        const detailInputFields = ['name', 'phone', 'email', 'website', 'location', 'region'];
                        const detailSelectFields = ['region', 'country'];
                        const contactInputFields = ['name', 'role', 'phone', 'email'];
                        const contactGroups = [
                            ['contact_1_', '#organization-contact-1'],
                            ['contact_2_', '#organization-contact-2'],
                            ['contact_3_', '#organization-contact-3']
                        ];
                        let elem;
                        // populate organization info
                        detailInputFields.forEach(elemId => {
                            elem = $(`${pageId} #organization-info #${elemId}`);
                            updateField(elem, details[elemId]);
                        });
                        // populate organization affiliations
                        let affiliations = '';
                        details['affiliations'].split('^').forEach(affiliation => {
                            affiliations += radioUtil(affiliation);
                        });
                        $(`${pageId} #affiliations`).html(affiliations);
                        // populate type of of organization
                        let type = radioUtil(details['type']);
                        $(`${pageId} #type`).html(type);
                        // populate organization sectors
                        let sectors = '';
                        details['sectors'].split('^').forEach(sector => {
                            sectors += radioUtil(sector);
                        });
                        $(`${pageId} #sectors`).html(sectors);
                        // populate organization address
                        addressInputFields.forEach(elemId => {
                            elem = $(`${pageId} #organization-info #${elemId}`);
                            elem.val(address[elemId]);
                            elem.prop('disabled', true);
                        });
                        // populate organization info select option
                        detailSelectFields.forEach(elemId => {
                            elem = $(`${pageId} #organization-info #${elemId}`);
                            const key = elemId === 'country' ? 'location' : elemId;
                            updateField(elem, details[key]);
                        });
                        // populate organization contacts
                        let noContact = true;
                        if (contacts != null) {
                            contactGroups.forEach(group => {
                                contactInputFields.forEach(field => {
                                    elem = $(`${pageId} ${group[1]} #${field}`);
                                    if (contacts[group[0] + field] !== '') {
                                        elem.val(contacts[group[0] + field]);
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
                        elem.html(`<strong style="color: #4885af;">Approved:</strong> ${details['approved_status'] == 1 ? 'Yes' : 'No'}`);
                        elem.removeClass('d-none');
                    }
                });

                // populate organization reviews
                $.ajax({
                    url: '/wp-admin/admin-ajax.php?action=organization_reviews',
                    data: { organizationId },
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
                            html += `<p><strong class="review-description">Sectors: </strong><br />\n${review['sectors'].split('^').join('<br />')}</p>`;
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
                    if (!val) {
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
                    if (sessionState['user']['roles'].includes('admin') || review['anonymous_review'] === '0') {
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


            /** 4. HANDLE ADD EXPERIENCE **/

            $('#add-experience-page').ready(() => {
                // handle organizations autocomplete
                const pageId = '#add-experience-page';
                addExperienceOrgInfoName.keyup(() => {
                    addExperienceOrgList.html('');
                    addExperienceOrgList.css({ 'display': 'none' });
                    clearOrganizationInputFields();
                    const prefix = addExperienceOrgInfoName.val();
                    if (prefix.length > 2) {
                        $.ajax({
                            url: '/wp-admin/admin-ajax.php?action=organization_autocomplete',
                            data: { prefix },
                            success: response => {
                                const result = $.parseJSON(JSON.stringify(response));
                                organizationAutocompleteName(addExperienceOrgList, result);
                            }
                        });
                    }
                });

                // clears out organization information state on page
                function clearOrganizationInputFields() {
                    sessionState['organization'] = {
                        affiliations: [],
                        sectors: [],
                        contacts: [{}, {}, {}],
                    };

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
                    const pageId = '#add-experience-page';
                    $.ajax({
                        url: '/wp-admin/admin-ajax.php?action=organization_info',
                        data: { id },
                        success: data => {
                            const [orgInfo, orgAddr, orgContacts] = JSON.parse(JSON.stringify(data));
                            sessionState['organization']['id'] = id;
                            sessionState['organization']['addressId'] = orgInfo['address_id'];
                            sessionState['organization']['contactIds'] = orgInfo['contact_ids'];
                            const orgInfoFields = ['name', 'phone', 'email', 'website', 'location', 'region'];
                            const orgInfoAddr = ['street', 'city', 'state', 'zipcode'];
                            const orgInfoSelect = ['region', 'country'];
                            const contactFields = ['name', 'role', 'phone', 'email'];
                            const contactGroups = [
                                ['contact_1_', '#organization-contact-1'],
                                ['contact_2_', '#organization-contact-2'],
                                ['contact_3_', '#organization-contact-3']
                            ];
                            let elem;
                            // populate organization info
                            orgInfoFields.forEach(elemId => {
                                elem = $(pageId + '#organization-info #' + elemId);
                                elem.val(orgInfo[elemId]);
                            });
                            // populate organization affiliations
                            orgInfo['affiliations'].split('^').forEach(affiliation => {
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
                            orgInfo['sectors'].split('^').forEach(sector => {
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


                /** 5. HANDLE SESSION STATE DATA UPDATE && SUBMISSION **/

                // radio button event handlers
                let elem;
                const affiliations = sessionState['organization']['affiliations'];
                for (let i = 1; i <= 6; i++) {
                    $(`#affiliation-radio-btn-${i}`).click(function () {
                        radioUpdateSessionUtil(affiliations, $(this));
                    });
                }
                radioUpdateSessionUtilUnselect(7, '#organization-type-btn-', sessionState['organization'], 'type');
                const orgSectors = sessionState['organization']['sectors'];
                for (let i = 1; i <= 12; i++) {
                    $(`#organization-sector-btn-${i}`).click(function () {
                        radioUpdateSessionUtil(orgSectors, $(this));
                    });
                }
                const reviewSectors = sessionState['review']['sectors'];
                for (let i = 1; i <= 12; i++) {
                    $(`#physical-experience-sector-radio-btn-${i}`).click(function () {
                        radioUpdateSessionUtil(reviewSectors, $(this))
                    });
                }
                radioUpdateSessionUtilUnselect(5, '#pe-duration-btn-', sessionState['review'], 'duration');
                radioUpdateSessionUtilUnselect(5, '#how-safe-radio-', sessionState['review'], 'safety');
                radioUpdateSessionUtilUnselect(5, '#how-responsive-radio-', sessionState['review'], 'responsiveness');

                function radioUpdateSessionUtil(store, elem) {
                    if (elem.prop('checked')) {
                        store.push(elem.data('value'));
                    } else {
                        const index = store.indexOf(elem.data('value'));
                        if (index !== -1) store.splice(index, 1);
                    }
                }

                function radioUpdateSessionUtilUnselect(n, prefixId, store, key) {
                    for (let i = 1; i <= n; i++) {
                        $(`${prefixId}${i}`).click(function () {
                            elem = $(this);
                            if (elem.prop('checked')) {
                                store[key] = elem.data('value');
                                for (let j = 1; j <= n; j++) {
                                    if (i !== j) $(`${prefixId}${j}`).prop('checked', false);
                                }
                            } else {
                                store[key] = '';
                            }
                        });
                    }
                }

                // slider event handlers
                $('#stipend-paid-slider').change(function () {
                    elem = $(this);
                    sessionState['review']['stipend'] = elem.val();
                });
                $('#pe-cost-slider').change(function () {
                    elem = $(this);
                    sessionState['review']['cost'] = elem.val();
                });

                // page transitions
                $('#add-experience-btn1').click(() => {
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
                $('#add-experience-btn2').click(() => {
                    if ($('#add-experience-btn2').text() === 'Next >') {
                        // show right page, hide left page, change button text
                        $('.add-experience-container.right-page').css('display', 'block');
                        $('.add-experience-container.left-page').css('display', 'none');
                        $('#add-experience-btn1').text('< Prev');
                        $('#add-experience-btn2').text('Submit');
                    } else {
                        submitReview();
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

                function submitReview() {
                    // read organization details & contacts
                    const orgDetailsInputFields = ['name', 'street', 'city', 'state', 'zipCode', 'phone', 'email', 'website'];
                    orgDetailsInputFields.forEach(fieldName => {
                        elem = $(`${pageId} #organization-info #${fieldName}`);
                        sessionState['organization'][fieldName] = elem.val();
                    });
                    const orgDetailsSelectFields = ['region', 'country'];
                    orgDetailsSelectFields.forEach(fieldName => {
                        elem = $(`${pageId} #organization-info #${fieldName} option:selected`);
                        if (!elem.text().includes('Select')) {
                            sessionState['organization'][fieldName] = elem.text();
                        }
                    });
                    const contactInputFields = ['name', 'role', 'phone', 'email'];
                    for (let i = 1; i <= 3; i++) {
                        contactInputFields.forEach(fieldName => {
                            elem = $(`#organization-contact-${i} #${fieldName}`);
                            sessionState['organization']['contacts'][i - 1][fieldName] = elem.val();
                        });
                    }
                    elem = $(`#organization-type-btn-7`);
                    if (elem.prop('checked')) {
                        sessionState['organization']['type'] = $('#organization-type-other-input').val();
                    }
                    elem = $(`#organization-sector-btn-12`);
                    if (elem.prop('checked')) {
                        sessionState['organization']['sectors'].push($('#organization-sector-other-input').val());
                    }
                    elem = $(`#physical-experience-sector-radio-btn-12`);
                    if (elem.prop('checked')) {
                        sessionState['review']['sectors'].push($('#physical-experience-sector-other-input').val());
                    }

                    // read review text and input fields
                    if ($('#pe-address-diff-no').prop('checked')) {
                        sessionState['review']['street'] = sessionState['organization']['street'];
                        sessionState['review']['city'] = sessionState['organization']['city'];
                        sessionState['review']['state'] = sessionState['organization']['state'];
                        sessionState['review']['zipCode'] = sessionState['organization']['zipCode'];
                        sessionState['review']['region'] = sessionState['organization']['region'];
                        sessionState['review']['country'] = sessionState['organization']['country'];
                    } else {
                        const addressInputFields = ['street', 'city', 'state', 'zipCode'];
                        addressInputFields.forEach(fieldName => {
                            elem = $(`#practice-experience-address #${fieldName}`);
                            sessionState['review'][fieldName] = elem.val();
                        });
                        const reviewSelectFields = ['region', 'country'];
                        reviewSelectFields.forEach(fieldName => {
                            elem = $(`#practice-experience-address #${fieldName} option:selected`);
                            if (!elem.text().includes('Select')) {
                                sessionState['review'][fieldName] = elem.text();
                            }
                        });
                    }
                    sessionState['review']['languages'] = $('#languages-spoken-input').val();
                    sessionState['review']['languageDifficulties'] = $('#language-difficulties').val();
                    sessionState['review']['whatYouDid'] = $('#organization-description').val();
                    sessionState['review']['typicalDay'] = $('#organization-typical-day').val();
                    sessionState['review']['strengthsAndWeaknesses'] = $('#organization-strength-and-weakness').val();
                    sessionState['review']['otherComments'] = $('#organization-other-comments').val();
                    sessionState['review']['anonymousReview'] = $('#anonymous-review').prop('checked') ? '1' : '0';

                    // clean sectors items & flatten lists
                    sessionState['organization']['sectors'] = sessionState['organization']['sectors'].filter(sector => {
                        return !sector.includes('Other');
                    });
                    sessionState['review']['sectors'] = sessionState['review']['sectors'].filter(sector => {
                        return !sector.includes('Other');
                    });
                    console.log(sessionState);
                    sessionState['organization']['affiliations'] = sessionState['organization']['affiliations'].join('^');
                    sessionState['organization']['sectors'] = sessionState['organization']['sectors'].join('^');
                    sessionState['review']['sectors'] = sessionState['review']['sectors'].join('^');
                    sessionState['review']['timeStamp'] = Date.now().toString();
                    console.log(sessionState);

                    // submit review
                    $.ajax({
                        type: 'post',
                        url: '/wp-admin/admin-ajax.php?action=submission',
                        data: sessionState,
                        success: () => {
                            alert('Data submission success!');
                            // resetSessionState();
                            // window.location.href = document.location.origin;
                        },
                        error: () => {
                            alert('Failed to post data!');
                        }
                    });
                }
            });
        }
    });
});