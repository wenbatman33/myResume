	
	/* TV FX class plugin */
	/* made in chamboow labs */

	import flash.display.BitmapData;
	import flash.geom.Matrix;
	import flash.geom.ColorTransform;
	import net.chamboow.effects.TVEffects.FXBase;
	
	class net.chamboow.effects.TVEffects.GradientLightTV extends FXBase {
		
		public var blendMode:String; // type of blend mode
		public var alpha:Number; // alpha
		public var color:Number; // color of gradient light
		public var featherHeight:Number; // feather height
		public var lightHeight:Number; // light height
		public var step:Number; // step value for Y movement
		
		private var gradContener:MovieClip; // gradient holder
		private var gradTop:MovieClip; // gradient holder
		private var gradBtm:MovieClip; // gradient holder
		private var gradMain:MovieClip; // gradient holder
		private var stepCount:Number = 0;
		private var isCreatedFlag:Boolean = false;
		private var mcTarget:MovieClip;
		
		public function GradientLightTV(_lightHeight:Number, _featherHeight:Number, _step:Number, _color:Number, __alpha:Number, _blendMode:String) {
			
			// set default values (if not given in constructor)
			if (_lightHeight==undefined) _lightHeight = 40;
			if (_featherHeight==undefined) _featherHeight = 20;
			if (_step==undefined) _step = 3;
			if (_color==undefined) _color = 0xffffff;
			if (__alpha==undefined) __alpha = 1;
			if (_blendMode==undefined) _blendMode = "add";
			
			// pass params from constructor
			lightHeight = _lightHeight;
			featherHeight = _featherHeight;
			step = _step;
			color = _color;
			alpha = __alpha;
			blendMode = _blendMode;
			
		}
		
		// "do the magic"
		public function doEffect(bmpSource:BitmapData, _w:Number, _h:Number, _mcTrg:MovieClip) {
			
			mcTarget = _mcTrg;
			// check if gradient isn't created
			if (!isCreatedFlag) { isCreatedFlag = true; createFeatherGradient(_w, lightHeight, featherHeight); }
			
			// calculated total light height
			var gh = (featherHeight * 2) + lightHeight;
			var py = -gh;
			
			py += stepCount;
			
			if (py > _h) stepCount = 0;
			if (py < -gh) stepCount = _h + gh;
			
			var ct:ColorTransform = new ColorTransform();
			ct.alphaMultiplier = alpha;
			
			// if effect is enabled, do it
			if (_isEnabled)
			bmpSource.draw(gradContener, new Matrix(1, 0, 0, 1, 0, py), ct, blendMode);
			
			stepCount += step;
			
			return bmpSource;
			
		}
		
		// created gradient with feather (top & bottom)
		public function createFeatherGradient(width, height, featherWidth):MovieClip {
			
			// gradient holders (top, bottom, main)
			gradContener = mcTarget.createEmptyMovieClip("gradHolda", mcTarget.getNextHighestDepth());
			gradTop = gradContener.createEmptyMovieClip("gradTop", 1);
			gradBtm = gradContener.createEmptyMovieClip("gradBtm", 2);
			gradMain = gradContener.createEmptyMovieClip("gradMain", 3);
			
			gradContener._visible = false;
			
			// gradient fill type
			var fillType:String = "linear";
			var colors:Array = [color, color];
			
			// gradient alphas
			var alphasLeft:Array = [0, 100];
			var alphasRight:Array = [100, 0];
			
			var alphasMain:Array = [100, 100];
			//var spreadMethod:String = SpreadMethod.PAD;
			
			// gradient ratios
			var ratios:Array = [0, 255];
			var matr:Matrix = new Matrix();
			
			// create matrix for gradient
			matr.createGradientBox(height, featherWidth, (90*Math.PI)/180, 0, 0);
			
			// draw top of light
			gradTop.beginGradientFill(fillType, colors, alphasLeft, ratios, matr);
			gradTop.moveTo(0, 0);
			gradTop.lineTo(0, featherWidth);
			gradTop.lineTo(width, featherWidth);
			gradTop.lineTo(width, 0);
			gradTop.lineTo(0, 0);			
			gradTop.endFill();
			
			// draw bottom of light
			gradBtm.beginGradientFill(fillType, colors, alphasRight, ratios, matr);			
			gradBtm.moveTo(0, 0);
			gradBtm.lineTo(0, featherWidth);
			gradBtm.lineTo(width, featherWidth);
			gradBtm.lineTo(width, 0);
			gradBtm.lineTo(0, 0);
			gradBtm.endFill();
			gradBtm._y = featherWidth + height;
			
			// draw center of light
			gradMain.beginGradientFill(fillType, colors, alphasMain, ratios, matr);
			gradMain.moveTo(0, 0);
			gradMain.lineTo(0, height);
			gradMain.lineTo(width, height);
			gradMain.lineTo(width, 0);
			gradMain.lineTo(0, 0);
			gradMain.endFill();
			gradMain._y = featherHeight;
			
			return gradContener;
			
		}


	}
