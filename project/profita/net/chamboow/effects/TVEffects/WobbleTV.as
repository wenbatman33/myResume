	
	/* TV FX class plugin */
	/* made in chamboow labs */
	
	import flash.display.BitmapData;
	import flash.geom.Rectangle;
	import flash.geom.Point;
	import net.chamboow.effects.TVEffects.FXBase;
	
	class net.chamboow.effects.TVEffects.WobbleTV extends FXBase {
		
		private var alfa:Number = 0;
		
		public var range:Number; // wobble range
		public var speed:Number; // wobble speed
		public var step:Number; // wobble step
		
		public function WobbleTV(_range:Number, _speed:Number, _step:Number) {
			
			// set default values (if not given in constructor)
			if (_range==undefined) _range = 15;
			if (_speed==undefined) _speed = 4;
			if (_step==undefined) _step = 3;
			
			// pass params from constructor
			range = _range;
			speed = _speed;
			step = _step;
			
		}
		
		// "do the magic"
		public function doEffect(bmpSource:BitmapData, _w:Number, _h:Number) {
			
			// if effect is enabled, do it
 			if (_isEnabled) {
				
				// make 3x1 bitmap
				var bmpTriple = returnTripleBitmap(bmpSource, _w, _h);
				
				var stepCount = 0;
				var sx;
				
				// process each horiontal line
				for (var i = 0; i < _h; i++) {
					
					sx = Math.ceil(range * Math.sin(((alfa + stepCount) * Math.PI) / 180));
					bmpSource.copyPixels(bmpTriple, new Rectangle(_w + sx, i, _w, 1), new Point(0, i));
					stepCount += step;
				}
				
				alfa += speed;
				
			}
			
			return bmpSource;
			
		}
		
		// make 3x1 bitmap
		public function returnTripleBitmap(source:BitmapData, _w:Number, _h:Number) {
			
			var bmpTriple:BitmapData = new BitmapData(_w * 3, _h, true, 0xff0000);
			
			bmpTriple.copyPixels(source, new Rectangle(0, 0, _w, _h), new Point(0, 0));
			bmpTriple.copyPixels(source, new Rectangle(0, 0, _w, _h), new Point(_w, 0));
			bmpTriple.copyPixels(source, new Rectangle(0, 0, _w, _h), new Point(_w*2, 0));
			
			return bmpTriple;
			
		}
		
	}
