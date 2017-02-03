	
	/* TV FX class plugin */
	/* made in chamboow labs */
	
	import flash.display.BitmapData;
	import flash.geom.Point;
	import flash.filters.ColorMatrixFilter;
	import net.chamboow.effects.TVEffects.FXBase;	
	
	class net.chamboow.effects.TVEffects.TintTV extends FXBase {
		
		public var color:Number; // tint color
		public var alpha:Number; // tint alpha
		
		public function TintTV(_color:Number, __alpha:Number) {
			
			// set default values (if not given in constructor)
			if (_color==undefined) _color = 0xFFFFFF;
			if (__alpha==undefined) __alpha = 1;
			
			// pass params from constructor
			color = _color;
			alpha = __alpha;
			
		}
		
		// "do the magic"
		public function doEffect(bmpSource:BitmapData, _w:Number, _h:Number) {
			
			// if effect is enabled, do it
			if (_isEnabled) {
			
				// grayscale array
				var gs:Array = [0.3086, 0.3086, 0.3086, 0, 0,
								0.3086, 0.3086, 0.3086, 0, 0,
								0.3086, 0.3086, 0.3086, 0, 0,
								0, 0, 0, 1, 0];
								
				// first tint to grayscale
				bmpSource.applyFilter(bmpSource, bmpSource.rectangle, new Point(), new ColorMatrixFilter(gs));
				
				// separate color values
				var cR = ((color >> 16) & 0xFF) / 0xFF;
				var cG = ((color >> 8) & 0xFF) / 0xFF;
				var cB = (color & 0xFF) / 0xFF;
				
				var ccR:Number = 0.212671;
				var ccG:Number = 0.715160;
				var ccB:Number = 0.072169;
				
				var invAlpha:Number = 1 - alpha;
				// tint color matrix filter
				var tint:Array = [invAlpha + alpha * cR * ccR, alpha * cR * ccG, alpha * cR * ccB, 0, 0,
								alpha * cG * ccR, invAlpha + alpha * cG * ccG, alpha * cG * ccB, 0, 0,
								alpha * cB * ccR, alpha * cB * ccG, invAlpha + alpha * cB * ccB, 0, 0,
								0, 0, 0, 1, 0];
								
				bmpSource.applyFilter(bmpSource, bmpSource.rectangle, new Point(0,0), new ColorMatrixFilter(tint));
				
			}
			
			return bmpSource;
			
		}
		
		
	}
