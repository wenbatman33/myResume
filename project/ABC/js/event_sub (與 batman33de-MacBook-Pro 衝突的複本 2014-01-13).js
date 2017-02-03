$(function () {
  

    //固定 landing from
    var sticky_navigation_offset_top = 280;
    var sticky_navigation = function () {
        var scroll_top = $(window).scrollTop();
        var scroll_bottom = $(document).height() - $('.regForm').height() - 120 - $('.footer').height();
		
		if (scroll_top > scroll_bottom) {
			$('.regForm').stop().animate({'top':scroll_bottom },100 );
			$('.regCustomerServiceIcon').stop().animate({'top':scroll_bottom },100 );
			
		}else if (scroll_top > sticky_navigation_offset_top) {
			$('.regForm').stop().animate({'top':scroll_top},500 );
			$('.regCustomerServiceIcon').stop().animate({'top':scroll_top},500 );		
		}else{
			
			$('.regForm').stop().animate({'top':270},100 );
			$('.regCustomerServiceIcon').stop().animate({'top':270},100 );
		}
		
		   
    };
    sticky_navigation();
	
	var timeoutId;
	$(window).scroll(function(){
		if(timeoutId ){
			 clearTimeout(timeoutId );  
		}
		timeoutId = setTimeout(function(){ sticky_navigation() }, 100);
	});
	
	
   // bindColorBox();
});
	