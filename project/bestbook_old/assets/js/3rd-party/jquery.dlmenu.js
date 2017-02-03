var ww = document.body.clientWidth;
$(document).ready(function() {

	$(".nav").menuAim({
		activate: function(a){$(a).addClass("active")},  
		deactivate: function(a){$(a).removeClass("active")}, 
		enter: function(a) {$(a).addClass("active")},
		exit: function(a) {$(a).removeClass("active")},
	});

	$(".nav li a").each(function() {
		if ($(this).next().length > 0) {
			$(this).addClass("parent");
		};
	});

	$(".toggleMenu").hover(function(e) {
		e.preventDefault();
		$(this).toggleClass("active");
		$(".nav").toggle();
	});
	
	adjustMenu();
})

$(window).bind('resize orientationchange', function() {
	ww = document.body.clientWidth;
	adjustMenu();
});

var adjustMenu = function() {
	if (ww < 999) {
		$(".toggleMenu").css("display", "inline-block");
		if (!$(".toggleMenu").hasClass("active")) {
			$(".nav").hide();
		} else {
			$(".nav").show();
		}
		$(".nav li").unbind('mouseenter mouseleave');
		$(".nav li a.parent").unbind('click').bind('click', function(e) {
			e.preventDefault();
			$(this).parent("li").toggleClass("hover");
		});
	}
	else if (ww >= 999) {
		$(".toggleMenu").css("display", "inline-block");
		$(".nav").hide();
		$(".nav li").removeClass("hover");
		$(".nav li a").unbind('click');
		$(".nav li").unbind('mouseenter mouseleave').bind('mouseenter mouseleave', function() {
		 	$(this).toggleClass('hover');
		});
	}
}

