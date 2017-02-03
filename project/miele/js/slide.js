$(function(){
		// 先取得相關的區塊及預設要先顯示那一個
		var $block = $('#slide'), 
			$link = $block.find('.link li'), 
			$showBox = $block.find('.showbox'), 
			_default = 0, 
			timer, speed = 1000;
		
		// 幫 $link a 加入一個 span.triangle, 用來產生三角形用
		$link.find('a').append('<span class="triangle"></span>');
		
		// 當滑鼠移到 $link 上時
		$link.mouseover(function(){
			var $this = $(this);
			var temp = $this.find('img').attr('src').substring(0,14);
			console.log(temp); 
			$showBox.html('<a href="'+$this.find('a').attr('href')+'"><img src="'+temp+'_big.jpg'+'" /></a>');

			$this.addClass('on').siblings('.on').removeClass('on');
		}).click(function(){

			return false;
		}).eq(_default).mouseover();
		
		var timer, speed = 3000
		$block.hover(function(){
			clearTimeout(timer);
		}, function(){
			timer = setTimeout(auto, speed);
		});
		
		function auto(){
			var _index = $link.filter('.on').index();
			_index = (_index + 1) % $link.length;

			$link.eq(_index).mouseover();
			timer = setTimeout(auto, speed);
		}
		
		timer = setTimeout(auto, speed);
	});