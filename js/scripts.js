
// use datatables library
$(document).ready(function () {

    // initialize datatable
   $('#org-records').DataTable({
       'pagingType': 'numbers'
   });
   $('.dataTables_length').addClass('bs-select');

   // handle add experience page transitions
    $('#add-experience-save').click(function () {
        // handle save form data

    });
    $('#add-experience-btn1').click(function () {
        if ($('#add-experience-btn1').text() === '< Prev') {
            // show left page, hide right page, change button text
            $('.add-experience-container.left-page').css('display', 'block');
            $('.add-experience-container.right-page').css('display', 'none');
            $('#add-experience-btn1').text('Save');
            $('#add-experience-btn2').text('Next >');
        } else {
            // handle save form data
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
            window.location.href = document.location.origin;
        }
    });

    // toggle practice experience address
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
            "English",
            "French",
            "Spanish",
            "Italian",
            "Chinese",
            "Swahili",
            "Arabic"
        ];
        function split( val ) {
            return val.split( /,\s*/ );
        }
        function extractLast( term ) {
            return split( term ).pop();
        }

        $( "#languages-spoken-input" )
        // don't navigate away from the field on tab when selecting an item
            .on( "keydown", function( event ) {
                if ( event.keyCode === $.ui.keyCode.TAB &&
                    $( this ).autocomplete( "instance" ).menu.active ) {
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
                    terms.push( "" );
                    this.value = terms.join( ", " );
                    return false;
                }
            });
    } );
});