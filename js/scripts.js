
// use datatables library
$(document).ready(function () {
   $('#org-records').DataTable({
       'pagingType': 'numbers'
   });
   $('.dataTables_length').addClass('bs-select');
});