//= require jquery
//= require jquery_ujs
//= require bootstrap-sprockets
//= require jquery-fileupload/basic
//= require cloudinary/jquery.cloudinary
//= require attachinary
//= require underscore
//= require gmaps/google
//= require moment
//= require eonasdan-bootstrap-datetimepicker
//= require_tree .

// $(document).ready(function () {
//   $('.datepicker').datepicker();
// });

$(document).ready(function () {
    $('.datetimepicker').datetimepicker({
        inline: false,
        sideBySide: false,
        format: "DD/MM/YYYY HH:mm"
    });
});


function sticky_relocate() {
    var window_top = $(window).scrollTop();
    var div_top = $('#sticky-anchor').offset().top;
    if (window_top > div_top) {
        $('#sticky').addClass('stick');
        $('#sticky-anchor').height($('#sticky').outerHeight(0));
    } else {
        $('#sticky').removeClass('stick');
        $('#sticky-anchor').height(0);
    }
}

$(function() {
    $(window).scroll(sticky_relocate);
    sticky_relocate();
});
