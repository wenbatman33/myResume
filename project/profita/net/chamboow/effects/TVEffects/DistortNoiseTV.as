	
	/* TV FX class plugin */
	/* made in chamboow labs */	
	
	import flash.display.BitmapData;
	import flash.geom.Rectangle;
	import flash.geom.Point;
	import net.chamboow.effects.TVEffects.FXBase;	
	
	class net.chamboow.effects.TVEffects.DistortNoiseTV extends FXBase {
		
		public var range:Number; // distort range
		public var speed:Number; // distor speed
		public var step:Number; // distort sstep
		
		private var alfa:Number = 0; 
		
		public function DistortNoiseTV(_range:Number, _speed:Number, _step:Number) {
			
			// set default values (if not given in constructor)
			if (_range==undefined) _range = 4;
			if (_speed==undefined) _speed = 7;
			if (_step==undefined) _step = 1;
			
			// pass params from constructor
			range = _range;
			speed = _speed;
			step = _step;
			
		}
		
		// "do the magic"
		public function doEffect(bmpSource:BitmapData, _w:Number, _h:Number) {
			
			var stepCount = 0;
			var sx;
			
			// if effect is enabled, do it
			if (_isEnabled) {
				
				// make 3x1 bitmap
				var bmpTriple = returnTripleBitmap(bmpSource, _w, _h);
				
				// process each horizontal line
				for (var i = 0; i < _h; i++) {
					
					var rr = Math.random() * range;
					sx = rr * Math.sin(((alfa + stepCount) * Math.PI) / 180);
					bmpSource.copyPixels(bmpTriple, new Rectangle(_w + sx, i, _w, 1), new Point(0, i));
					
					stepCount += step;
					
				}
				
				alfa += speed;
			}
			
			return bmpSource;
			
		}
		
		// return 3x1 bitmap
		public function returnTripleBitmap(source:BitmapData, _w:Number, _h:Number) {
			
			var bmpTriple:BitmapData = new BitmapData(_w * 3, _h, true, 0xff0000);
			
			bmpTriple.copyPixels(source, new Rectangle(0, 0, _w, _h), new Point(0, 0));
			bmpTriple.copyPixels(source, new Rectangle(0, 0, _w, _h), new Point(_w, 0));
			bmpTriple.copyPixels(source, new Rectangle(0, 0, _w, _h), new Point(_w * 2, 0));
			
			return bmpTriple;
			
		}
		
	}
