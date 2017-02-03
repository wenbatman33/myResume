	
	/* TV FX class plugin */
	/* made in chamboow labs */	
	
	import flash.display.BitmapData;
	import flash.geom.Rectangle;
	import flash.geom.Point;
	import net.chamboow.effects.TVEffects.FXBase;	

	class net.chamboow.effects.TVEffects.ChannelTransformTV extends FXBase {
		
		public var xRange:Number; // random range in X axis
		public var yRange:Number; // random range in Y axis
		
		//public function ChannelTransformTV(_xRange:Number = 10, _yRange:Number = 0) {
		public function ChannelTransformTV(_xRange:Number, _yRange:Number) {
			
			// set default values (if not given in constructor)
			if (_xRange==undefined) _xRange = 10;
			if (_yRange==undefined) _yRange = 0;
			
			// pass params from constructor
			xRange = _xRange;
			yRange = _yRange;
			
		}
		
		// "do the magic"
		public function doEffect(bmpSource:BitmapData, _w:Number, _h:Number) {
			
			// random values for X and Y axis
			var sx = Math.ceil(Math.random() * xRange);
			var sy = Math.ceil(Math.random() * yRange);
			
			// if effect is enabled, do it
			if (_isEnabled) {
				
				// make 2x1 bitmap
				var bmpDouble = returnDoubleBitmap(bmpSource, _w, _h);
				
				// copy channels
				if (Math.random()>.5)
				bmpSource.copyChannel(bmpDouble, new Rectangle(sx, sy, _w, _h), new Point(0, 0), 1, 1);
				else
				bmpSource.copyChannel(bmpDouble, new Rectangle(0, 0, _w, _h), new Point(sx, sy), 1, 1);
				
			}
			
			return bmpSource;
			
		}
		
		// return 2x1 bitmap
		public function returnDoubleBitmap(source:BitmapData, _w:Number, _h:Number) {
			
			var bmpDouble:BitmapData = new BitmapData(_w * 2, _h, true, 0xff0000);
			
			bmpDouble.copyPixels(source, new Rectangle(0, 0, _w, _h), new Point(0, 0));
			bmpDouble.copyPixels(source, new Rectangle(0, 0, _w, _h), new Point(_w, 0));
			
			return bmpDouble;
			
		}
		
		
	}
