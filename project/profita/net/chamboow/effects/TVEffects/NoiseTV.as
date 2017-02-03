	
	/* TV FX class plugin */
	/* made in chamboow labs */

	import flash.display.BitmapData;
	import flash.geom.ColorTransform;
	import flash.geom.Matrix;
	import net.chamboow.effects.TVEffects.FXBase;
	
	class net.chamboow.effects.TVEffects.NoiseTV extends FXBase {
		
		public var seedRange:Number; // seed range
		public var alpha:Number; // alpha
		public var blendMode:String; // type of blendmode
		
		public function NoiseTV(_seedRange:Number, __alpha:Number, _blendMode:String) {
			
			// set default values (if not given in constructor)
			if (_seedRange==undefined) _seedRange = 255;
			if (__alpha==undefined) __alpha = .4;
			if (_blendMode==undefined) _blendMode = "overlay";
			
			// pass params from constructor
			seedRange = _seedRange;
			alpha = __alpha;
			blendMode = _blendMode;
			
		}
		
		// "do the magic"
		public function doEffect(bmpSource:BitmapData, _w:Number, _h:Number) {
			
			// create bitmap for noise effect
			var bmpNoise:BitmapData = new BitmapData(_w, _h, true, 0xff0000);
			
			// fill bitmap with noise
			var seed = Math.random() * seedRange;
			bmpNoise.noise(seed, 0, 255, 7, true);
			
			// colortransform (setting ALPHA)
			var ct:ColorTransform = new ColorTransform();
			ct.alphaMultiplier = alpha;
			
			// if effect is enabled, do it
			if (_isEnabled)
			bmpSource.draw(bmpNoise,new Matrix(),ct, blendMode);
			
			
			return bmpSource;
			
		}
		
	}
