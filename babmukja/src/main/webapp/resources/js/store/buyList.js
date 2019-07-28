$(document).ready(function() {
    // Setup - add a text input to each footer cell
    $('#buylist tfoot th').each( function () {
       var title = $(this).text();
       $(this).html( '<input type="text" class="searchForm" placeholder="'+title+'" />' );
    });

    // DataTable
    var table = $('#buylist').DataTable({
        "order":[[3,"desc"]]
    });

    // Apply the search
    table.columns().every( function () {
        var that = this;

        $( 'input', this.footer() ).on( 'keyup change', function () {
            if ( that.search() !== this.value ) {
               that.search(this.value).draw();
            }
        });
    });
});