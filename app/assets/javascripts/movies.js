function scrollPageTo( $node ) {
    $( 'html, body' ).animate({
        scrollTop: ~~$node.offset().top - 60
    }, 150)
}

$(function() {
    $(".preview-table a.preview").hover(
        function() {
            var link = $(this);
            var id = link.data("id");
            var template = $('#movie-window-template').html();

            $.get('/movies/' + id + '.json', function(data) {
                link.popover({ content: jQuery.fn.nano( template, data ), html: true });
                link.popover('show');
            });
        },
        function() { 
            $(this).popover('hide');
        }
    );

    $( '.datepicker' ).pickadate({
        format: 'yyyy-mm-dd',
        onOpen: function() {
            scrollPageTo( this.$node )
        }
    });
});
