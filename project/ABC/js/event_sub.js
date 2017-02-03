$(function () {
  

    //固定 landing from
    var sticky_navigation_offset_top = 280;
    var sticky_navigation = function () {
        var scroll_top = $(window).scrollTop();
        var scroll_bottom = $(document).height() - $('.regForm').height() - 120 - $('.footer').height();
        if (scroll_top > scroll_bottom) {
            $('.regFixedWrapPages').css({ 'position': 'relative', 'top': (scroll_bottom + 110) });
        } else if (scroll_top > sticky_navigation_offset_top) {
            $('.regFixedWrapPages').css({ 'position': 'fixed', 'top': 120 });
        } else {
            $('.regFixedWrapPages').css({ 'position': 'relative', 'top': 400 });
        }
    };
    sticky_navigation();
    $(window).scroll(function () {
        sticky_navigation();
    });
   // bindColorBox();
});