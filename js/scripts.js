
// use datatables library
$(document).ready(function () {

    // initialize datatable
   $('#org-records').DataTable({
       'pagingType': 'numbers'
   });
   $('.dataTables_length').addClass('bs-select');
});