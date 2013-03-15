// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require twitter/bootstrap
//= require jquery.nano
//= require_tree .

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
});
