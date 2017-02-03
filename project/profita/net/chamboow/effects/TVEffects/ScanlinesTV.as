	
	/* TV FX class plugin */
	/* made in chamboow labs */	
	
	import flash.display.BitmapData;
	import flash.geom.Rectangle;
	import net.chamboow.effects.TVEffects.FXBase;
	
	class net.chamboow.effects.TVEffects.ScanlinesTV extends FXBase {
		
		public var minLines:Number; // minimum number of scanlines
		public var maxLines:Number; // maximum number of scanlines
		
		public function ScanlinesTV(_minLines:Number, _maxLines:Number) {
			
			// set default values (if not given in constructor)
			if (_minLines==undefined) _minLines = 2;
			if (_maxLines==undefined) _maxLines = 2;
			
			// pass params from constructor
			minLines = _minLines;
			maxLines = _maxLines;
			
		}
		
		// "do the magic"
		public function doEffect(bmpSource:BitmapData, _w:Number, _h:Number) {
			
			// check if values are correct
			if (minLines < 2) minLines = 2;
			if (maxLines < minLines) maxLines = minLines;
			
			var sl = minLines + Math.ceil(Math.random() * (maxLines - minLines));
			
			// if effect is enabled, do it
			if (_isEnabled)
			for (var i = 0; i < _h; i++) {
				
				if (i % sl) bmpSource.fillRect(new Rectangle(0, i, _w, 1), 0x00ffffff);
				
			}
			
			return bmpSource;
			
		}
		
		
	}
