	var hit = 0;
	function init() {
	var b = document.getElementById("menu");
	var yc = window.innerHeight * 0.5 - 100;
	var xc = window.innerWidth * 0.5 - 100;
	//TweenMax.to(b,0,{css:{top:120},ease:Expo.easeOut});
	TweenMax.to(b,0,{css:{top:0},ease:Expo.easeOut,delay:.5});
	//TweenMax.to(b,0,{css:{top:700},ease:Expo.easeOut});
	//TweenMax.to(b,1.5,{css:{top:0},ease:Expo.easeOut});
	}
	
	
	function hitFunction(){
		var b = document.getElementById("menu");
		if(hit==0){
			hit = 1;
			TweenMax.to(b,1.5,{css:{top:0},ease:Expo.easeOut});
		}else{
			hit = 0;
			TweenMax.to(b,2,{css:{top:120},ease:Expo.easeOut});
		}
	}