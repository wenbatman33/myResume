	
	/* TV FX class plugin */
	/* made in chamboow labs */

	import flash.display.BitmapData;
	import flash.geom.ColorTransform;
	import flash.geom.Matrix;
	import net.chamboow.effects.TVEffects.FXBase;	
	
	class net.chamboow.effects.TVEffects.BlinkTV extends FXBase {
		
		public var power:Number; // power of blinking
		public var alpha:Number; // alpha
		public var blendMode:String; // type of blendmode
		
		public function BlinkTV(_power:Number, __alpha:Number, _blendMode:String) {
			
			// set default values (if not given in constructor)
			if (_power==undefined) _power = 255;
			if (__alpha==undefined) __alpha = .25;
			if (_blendMode==undefined) _blendMode = "overlay";
			
			// pass params from constructor
			power = _power;
			alpha = __alpha;
			blendMode = _blendMode;
			
		}
		
		// "do the magic"
		public function doEffect(bmpSource:BitmapData, _w:Number, _h:Number) {
			
			// create bitmap for blink effect
			var bmpBlink:BitmapData = new BitmapData(_w, _h, true, 0xff0000);
			
			// colortransform (setting ALPHA)
			var ct:ColorTransform = new ColorTransform();
			ct.alphaMultiplier = alpha;
			
			// fill bitmap with blink
			var seed = Math.random() * power;
			bmpBlink.noise(seed, seed, seed, 7, true);
			
			// if effect is enabled, do it
			if (_isEnabled)
			bmpSource.draw(bmpBlink, new Matrix(), ct, blendMode);
			
			return bmpSource;
			
		}
		
	}
