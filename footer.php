<?php wp_footer(); ?>

<script>
    function addNewOrganization() {
        console.log('adding new org!!');
    }

    function populateOrganizationInfo(id) {
        $('#organization-info #name').val($('#organizations-list #' + id).text());
        $('#organization-info #organizations-list').css({ 'display': 'none' });

        $.ajax({
           url: '/wp-admin/admin-ajax.php?action=organization_info',
           data: { id },
           success: function (data) {
               const orgInfoFields = ['name', 'phone', 'email', 'website', 'location', 'region'];
               const orgInfoAddr = ['street', 'city', 'state', 'zipcode'];
               const orgInfoSelect = ['region', 'country'];

               const [orgInfo, orgAddr, orgContacts] = JSON.parse(JSON.stringify(data));

               // populate with data from orgInfo
               orgInfoFields.forEach(elemId => {
                  $('#organization-info #' + elemId).val(orgInfo[elemId]);
               });
               orgInfo['affiliations'].split('\r\n').forEach(affiliation => {
                   for (let i = 1; i <= 6; i++) {
                       const elem = $('#affiliation-radio-btn-' + i);
                       if (elem.data('value') === affiliation) {
                           elem.prop('checked', true);
                       }
                   }
               });
               orgInfo['sectors'].split('\r\n').forEach(sector => {
                   let checked = false;
                   for (let i = 1; i <= 12; i++) {
                       const elem = $('#organization-sector-btn-' + i);
                       if (elem.data('value') === sector) {
                           elem.prop('checked', true);
                           checked = true;
                       } else if (i === 12 && !checked) {
                           elem.prop('checked', true);
                           $('#organization-sector-other-input').val(sector);
                       }
                   }
               });
               let checked = false;
               for (let i = 1; i <= 7; i++) {
                   const elem = $('#organization-type-btn-' + i);
                   if (elem.data('value') === orgInfo['type']) {
                       elem.prop('checked', true);
                       checked = true;
                   } else if (i === 7 && !checked) {
                       elem.prop('checked', true);
                       $('#organization-type-other-input').val(orgInfo['type'])
                   }
               }
               orgInfoSelect.forEach(elemId => {
                   const elem = $('#organization-info #' + elemId);
                   let key = elemId === 'country' ? 'location' : elemId;
                   const selectedIndex = getOptionsArray(elem).indexOf(orgInfo[key]);
                   elem.prop('selectedIndex', selectedIndex);
               });

               // populate with data from orgAddr
               orgInfoAddr.forEach(elemId => {
                   $('#organization-info #' + elemId).val(orgAddr[elemId]);
               });

               // populate with data from orgContacts
               const contactGroups = [
                   ['contact_1_', '#organization-contact-1'],
                   ['contact_2_', '#organization-contact-2'],
                   ['contact_3_', '#organization-contact-3']
               ];
               const contactFields = ['name', 'role', 'phone', 'email'];
               contactGroups.forEach(group => {
                   contactFields.forEach(field => {
                       $(group[1] + ' #' + field).val(orgContacts[group[0] + field]);
                   });
               });
           } 
        });
    }

    function getOptionsArray(elem) {
        const options = [];
        $(elem).find('option').each(function () {
            options.push($(this).text());
        });
        return options;
    }
</script>
</body>
</html>