/* malihu custom scrollbar plugin - http://manos.malihu.gr */
(function ($) {
$.fn.mCustomScrollbar = function (scrollType,animSpeed,easeType,bottomSpace,draggerDimType,mouseWheelSupport,scrollBtnsSupport,scrollBtnsSpeed){
	var id = $(this).attr("id");
	var $BiographyScrollBox=$("#"+id+" .BiographyScrollBox");
	var $BiographyScrollBox_BiographyContainer=$("#"+id+" .BiographyScrollBox .BiographyContainer");
	var $BiographyScrollBox_BiographyContent=$("#"+id+" .BiographyScrollBox .BiographyContent");
	var $dragger_container=$("#"+id+" .dragger_container");
	var $dragger=$("#"+id+" .dragger");
	var $scrollUpBtn=$("#"+id+" .scrollUpBtn");
	var $scrollDownBtn=$("#"+id+" .scrollDownBtn");
	var $BiographyScrollBox_horWrapper=$("#"+id+" .BiographyScrollBox .horWrapper");
	
	//get & store minimum dragger height & width (defined in css)
	if(!$BiographyScrollBox.data("minDraggerHeight")){
		$BiographyScrollBox.data("minDraggerHeight",$dragger.height());
	}
	if(!$BiographyScrollBox.data("minDraggerWidth")){
		$BiographyScrollBox.data("minDraggerWidth",$dragger.width());
	}
	
	//get & store original content height & width
	if(!$BiographyScrollBox.data("contentHeight")){
		$BiographyScrollBox.data("contentHeight",$BiographyScrollBox_BiographyContainer.height());
	}
	if(!$BiographyScrollBox.data("contentWidth")){
		$BiographyScrollBox.data("contentWidth",$BiographyScrollBox_BiographyContainer.width());
	}
	
	CustomScroller();
	
	function CustomScroller(reloadType){
		//horizontal scrolling ------------------------------
		if(scrollType=="horizontal"){
			var visibleWidth=$BiographyScrollBox.width();
			//set content width automatically
			$BiographyScrollBox_horWrapper.css("width",999999); //set a rediculously high width value ;)
			$BiographyScrollBox.data("totalContent",$BiographyScrollBox_BiographyContainer.width()); //get inline div width
			$BiographyScrollBox_horWrapper.css("width",$BiographyScrollBox.data("totalContent")); //set back the proper content width value
			
			if($BiographyScrollBox_BiographyContainer.width()>visibleWidth){ //enable scrollbar if content is long
				$dragger.css("display","block");
				if(reloadType!="resize" && $BiographyScrollBox_BiographyContainer.width()!=$BiographyScrollBox.data("contentWidth")){
					$dragger.css("left",0);
					$BiographyScrollBox_BiographyContainer.css("left",0);
					$BiographyScrollBox.data("contentWidth",$BiographyScrollBox_BiographyContainer.width());
				}
				$dragger_container.css("display","block");
				$scrollDownBtn.css("display","inline-block");
				$scrollUpBtn.css("display","inline-block");
				var totalContent=$BiographyScrollBox_BiographyContent.width();
				var minDraggerWidth=$BiographyScrollBox.data("minDraggerWidth");
				var draggerContainerWidth=$dragger_container.width();
		
				function AdjustDraggerWidth(){
					if(draggerDimType=="auto"){
						var adjDraggerWidth=Math.round(totalContent-((totalContent-visibleWidth)*2.0)); //adjust dragger width analogous to content
						if(adjDraggerWidth<=minDraggerWidth){ //minimum dragger width
							$dragger.css("width",minDraggerWidth+"px");
						} else if(adjDraggerWidth>=draggerContainerWidth){
							$dragger.css("width",draggerContainerWidth-10+"px");
						} else {
							$dragger.css("width",adjDraggerWidth+"px");
						}
					}
				}
				AdjustDraggerWidth();
		
				var targX=0;
				var draggerWidth=$dragger.width();
				$dragger.draggable({ 
					axis: "x", 
					containment: "parent", 
					drag: function(event, ui) {
						ScrollX();
					}, 
					stop: function(event, ui) {
						DraggerRelease();
					}
				});
			
				$dragger_container.click(function(e) {
					var $this=$(this);
					var mouseCoord=(e.pageX - $this.offset().left);
					if(mouseCoord<$dragger.position().left || mouseCoord>($dragger.position().left+$dragger.width())){
						var targetPos=mouseCoord+$dragger.width();
						if(targetPos<$dragger_container.width()){
							$dragger.css("left",mouseCoord);
							ScrollX();
						} else {
							$dragger.css("left",$dragger_container.width()-$dragger.width());
							ScrollX();
						}
					}
				});

				//mousewheel
				$(function($) {
					if(mouseWheelSupport=="yes"){
						$BiographyScrollBox.unbind("mousewheel");
						$BiographyScrollBox.bind("mousewheel", function(event, delta) {
							var vel = Math.abs(delta*10);
							$dragger.css("left", $dragger.position().left-(delta*vel));
							ScrollX();
							if($dragger.position().left<0){
								$dragger.css("left", 0);
								$BiographyScrollBox_BiographyContainer.stop();
								ScrollX();
							}
							if($dragger.position().left>$dragger_container.width()-$dragger.width()){
								$dragger.css("left", $dragger_container.width()-$dragger.width());
								$BiographyScrollBox_BiographyContainer.stop();
								ScrollX();
							}
							return false;
						});
					}
				});
				
				//scroll buttons
				if(scrollBtnsSupport=="yes"){
					$scrollDownBtn.mouseup(function(){
						BtnsScrollXStop();
					}).mousedown(function(){
						BtnsScrollX("down");
					}).mouseout(function(){
						BtnsScrollXStop();
					});
				
					$scrollUpBtn.mouseup(function(){
						BtnsScrollXStop();
					}).mousedown(function(){
						BtnsScrollX("up");
					}).mouseout(function(){
						BtnsScrollXStop();
					});
				
					$scrollDownBtn.click(function(e) {
						e.preventDefault();
					});
					$scrollUpBtn.click(function(e) {
						e.preventDefault();
					});
				
					btnsScrollTimerX=0;
				
					function BtnsScrollX(dir){
						if(dir=="down"){
							var btnsScrollTo=$dragger_container.width()-$dragger.width();
							var scrollSpeed=Math.abs($dragger.position().left-btnsScrollTo)*(100/scrollBtnsSpeed);
							$dragger.stop().animate({left: btnsScrollTo}, scrollSpeed,"linear");
						} else {
							var btnsScrollTo=0;
							var scrollSpeed=Math.abs($dragger.position().left-btnsScrollTo)*(100/scrollBtnsSpeed);
							$dragger.stop().animate({left: -btnsScrollTo}, scrollSpeed,"linear");
						}
						clearInterval(btnsScrollTimerX);
						btnsScrollTimerX = setInterval( ScrollX, 20);
					}
				
					function BtnsScrollXStop(){
						clearInterval(btnsScrollTimerX);
						$dragger.stop();
					}
				}

				//scroll
				var scrollAmount=(totalContent-visibleWidth)/(draggerContainerWidth-draggerWidth);
				function ScrollX(){
					var draggerX=$dragger.position().left;
					var targX=-draggerX*scrollAmount;
					var thePos=$BiographyScrollBox_BiographyContainer.position().left-targX;
					$BiographyScrollBox_BiographyContainer.stop().animate({left: "-="+thePos}, animSpeed, easeType);
				}
			} else { //disable scrollbar if content is short
				$dragger.css("left",0).css("display","none"); //reset content scroll
				$BiographyScrollBox_BiographyContainer.css("left",0);
				$dragger_container.css("display","none");
				$scrollDownBtn.css("display","none");
				$scrollUpBtn.css("display","none");
			}
		//vertical scrolling ------------------------------
		} else {
			var visibleHeight=$BiographyScrollBox.height();
			if($BiographyScrollBox_BiographyContainer.height()>visibleHeight){ //enable scrollbar if content is long
				$dragger.css("display","block");
				if(reloadType!="resize" && $BiographyScrollBox_BiographyContainer.height()!=$BiographyScrollBox.data("contentHeight")){
					$dragger.css("top",0);
					$BiographyScrollBox_BiographyContainer.css("top",0);
					$BiographyScrollBox.data("contentHeight",$BiographyScrollBox_BiographyContainer.height());
				}
				$dragger_container.css("display","block");
				$scrollDownBtn.css("display","inline-block");
				$scrollUpBtn.css("display","inline-block");
				var totalContent=$BiographyScrollBox_BiographyContent.height();
				var minDraggerHeight=$BiographyScrollBox.data("minDraggerHeight");
				var draggerContainerHeight=$dragger_container.height();
		
				function AdjustDraggerHeight(){
					if(draggerDimType=="auto"){
						var adjDraggerHeight=Math.round(totalContent-((totalContent-visibleHeight)*2.0)); //adjust dragger height analogous to content
						if(adjDraggerHeight<=minDraggerHeight){ //minimum dragger height
							$dragger.css("height",minDraggerHeight+"px").css("line-height",minDraggerHeight+"px");
						} else if(adjDraggerHeight>=draggerContainerHeight){
							$dragger.css("height",draggerContainerHeight-10+"px").css("line-height",draggerContainerHeight-10+"px");
						} else {
							$dragger.css("height",adjDraggerHeight+"px").css("line-height",adjDraggerHeight+"px");
						}
					}
				}
				AdjustDraggerHeight();
		
				var targY=0;
				var draggerHeight=$dragger.height();
				$dragger.draggable({ 
					axis: "y", 
					containment: "parent", 
					drag: function(event, ui) {
						Scroll();
					}, 
					stop: function(event, ui) {
						DraggerRelease();
					}
				});
				
				$dragger_container.click(function(e) {
					var $this=$(this);
					var mouseCoord=(e.pageY - $this.offset().top);
					if(mouseCoord<$dragger.position().top || mouseCoord>($dragger.position().top+$dragger.height())){
						var targetPos=mouseCoord+$dragger.height();
						if(targetPos<$dragger_container.height()){
							$dragger.css("top",mouseCoord);
							Scroll();
						} else {
							$dragger.css("top",$dragger_container.height()-$dragger.height());
							Scroll();
						}
					}
				});

				//mousewheel
				$(function($) {
					if(mouseWheelSupport=="yes"){
						$BiographyScrollBox.unbind("mousewheel");
						$BiographyScrollBox.bind("mousewheel", function(event, delta) {
							var vel = Math.abs(delta*10);
							$dragger.css("top", $dragger.position().top-(delta*vel));
							Scroll();
							if($dragger.position().top<0){
								$dragger.css("top", 0);
								$BiographyScrollBox_BiographyContainer.stop();
								Scroll();
							}
							if($dragger.position().top>$dragger_container.height()-$dragger.height()){
								$dragger.css("top", $dragger_container.height()-$dragger.height());
								$BiographyScrollBox_BiographyContainer.stop();
								Scroll();
							}
							return false;
						});
					}
				});

				//scroll buttons
				if(scrollBtnsSupport=="yes"){
					$scrollDownBtn.mouseup(function(){
						BtnsScrollStop();
					}).mousedown(function(){
						BtnsScroll("down");
					}).mouseout(function(){
						BtnsScrollStop();
					});
				
					$scrollUpBtn.mouseup(function(){
						BtnsScrollStop();
					}).mousedown(function(){
						BtnsScroll("up");
					}).mouseout(function(){
						BtnsScrollStop();
					});
				
					$scrollDownBtn.click(function(e) {
						e.preventDefault();
					});
					$scrollUpBtn.click(function(e) {
						e.preventDefault();
					});
				
					btnsScrollTimer=0;
				
					function BtnsScroll(dir){
						if(dir=="down"){
							var btnsScrollTo=$dragger_container.height()-$dragger.height();
							var scrollSpeed=Math.abs($dragger.position().top-btnsScrollTo)*(100/scrollBtnsSpeed);
							$dragger.stop().animate({top: btnsScrollTo}, scrollSpeed,"linear");
						} else {
							var btnsScrollTo=0;
							var scrollSpeed=Math.abs($dragger.position().top-btnsScrollTo)*(100/scrollBtnsSpeed);
							$dragger.stop().animate({top: -btnsScrollTo}, scrollSpeed,"linear");
						}
						clearInterval(btnsScrollTimer);
						btnsScrollTimer = setInterval( Scroll, 20);
					}
				
					function BtnsScrollStop(){
						clearInterval(btnsScrollTimer);
						$dragger.stop();
					}
				}
				
				//scroll
				if(bottomSpace<1){
					bottomSpace=1; //minimum bottomSpace value is 1
				}
				var scrollAmount=(totalContent-(visibleHeight/bottomSpace))/(draggerContainerHeight-draggerHeight);
				function Scroll(){
					var draggerY=$dragger.position().top;
					var targY=-draggerY*scrollAmount;
					var thePos=$BiographyScrollBox_BiographyContainer.position().top-targY;
					$BiographyScrollBox_BiographyContainer.stop().animate({top: "-="+thePos}, animSpeed, easeType);
				}
			} else { //disable scrollbar if content is short
				$dragger.css("top",0).css("display","none"); //reset content scroll
				$BiographyScrollBox_BiographyContainer.css("top",0);
				$dragger_container.css("display","none");
				$scrollDownBtn.css("display","none");
				$scrollUpBtn.css("display","none");
			}
		}
		
		$dragger.mouseup(function(){
			DraggerRelease();
		}).mousedown(function(){
			DraggerPress();
		});

		function DraggerPress(){
			$dragger.addClass("dragger_pressed");
		}

		function DraggerRelease(){
			$dragger.removeClass("dragger_pressed");
		}
	}
	
	$(window).resize(function() {
		if(scrollType=="horizontal"){
			if($dragger.position().left>$dragger_container.width()-$dragger.width()){
				$dragger.css("left", $dragger_container.width()-$dragger.width());
			}
		} else {
			if($dragger.position().top>$dragger_container.height()-$dragger.height()){
				$dragger.css("top", $dragger_container.height()-$dragger.height());
			}
		}
		CustomScroller("resize");
	});
};  
})(jQuery);










<!-- content to show if javascript is disabled -->
$(window).load(function() {
	mCustomScrollbars();
});

function mCustomScrollbars(){
	/* 
	malihu custom scrollbar function parameters: 
	1) scroll type (values: "vertical" or "horizontal")
	2) scroll easing amount (0 for no easing) 
	3) scroll easing type 
	4) extra bottom scrolling space for vertical scroll type only (minimum value: 1)
	5) scrollbar height/width adjustment (values: "auto" or "fixed")
	6) mouse-wheel support (values: "yes" or "no")
	7) scrolling via buttons support (values: "yes" or "no")
	8) buttons scrolling speed (values: 1-20, 1 being the slowest)
	*/
	$("#BiographyScrollbar").mCustomScrollbar("vertical",200,"easeOutCirc",0,"fixed","yes","no",0); 
}

/* function to fix the -10000 pixel limit of jquery.animate */
$.fx.prototype.cur = function(){
    if ( this.elem[this.prop] != null && (!this.elem.style || this.elem.style[this.prop] == null) ) {
      return this.elem[ this.prop ];
    }
    var r = parseFloat( jQuery.css( this.elem, this.prop ) );
    return typeof r == 'undefined' ? 0 : r;
}

/* function to load new content dynamically */
function LoadNewContent(id,file){
	$("#"+id+" .BiographyScrollBox .BiographyContent").load(file,function(){
		mCustomScrollbars();
	});
}