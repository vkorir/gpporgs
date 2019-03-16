
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
    $('#add-experience-next').click(function () {
        // show right page, hide left page
        $('.add-experience-container.right-page').css('display', 'block');
        $('.add-experience-container.left-page').css('display', 'none');
    });
    $('#add-experience-prev').click(function () {
        // show left page, hide right page
        $('.add-experience-container.left-page').css('display', 'block');
        $('.add-experience-container.right-page').css('display', 'none');
    });
    $('#add-experience-submit').click(function () {
        // handle form submission logic
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
        }
    });
});