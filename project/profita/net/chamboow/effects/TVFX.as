
	/* TV FX class */
	/* made in chamboow labs */

	import flash.display.Bitmap;
	import flash.display.BitmapData;

	class net.chamboow.effects.TVFX extends MovieClip {
		
		private var mcSource:MovieClip; // source movieclip
		private var mcTarget:MovieClip; // target movieclip
		private var _w:Number; // render area width
		private var _h:Number; // render area height
		private var fxArray:Array; // array with effects instances
		private var bmpSource:BitmapData; // source bitmap data
		private var onefHolder:MovieClip; // onEnterFrame holder
		private var _isEnabled:Boolean = true;
		
		/* class constructor, params: source, target, width, height */
		public function TVFX(_mcSource:MovieClip,_mcTarget:MovieClip, __width:Number, __height:Number) {
			
			mcSource = _mcSource; // source movieclip
			mcTarget = _mcTarget; // target movieclip
			_w = __width; // width
			_h = __height; // height
			
			fxArray = [];
			
			bmpSource = new BitmapData(_w, _h, true, 0xff0000);
			
			// add final render to target movieclip
			
			mcTarget.attachBitmap(bmpSource, mcTarget.getNextHighestDepth());
			
			onefHolder = mcTarget.createEmptyMovieClip("onefHolder", mcTarget.getNextHighestDepth());
			
		}
		
		/* start rendering animation */
		public function startRender() {
			
			render();
			onefHolder.onEnterFrame = mx.utils.Delegate.create(this, render);
			
		}
		
		/* disable all effects */
		public function disable() {
			
			_isEnabled = false;
			
		}
		
		/* enable all effects */
		public function enable() {
			
			_isEnabled = true;
			
		}
		
		/* stop rendering animation */
		public function stopRender() {
			
			onefHolder.onEnterFrame = null;
			
		}
		
		/* add tv effect to effects list */
		public function addFX(instance:Object) {
			
			fxArray.push(instance);
			
		}
		
		/* single render call */
		public function render() {
			
			bmpSource.fillRect(bmpSource.rectangle, 0); // clear bitmap data
			bmpSource.draw(mcSource); // draw current state of source movieclip
			
			// do all effects on the list
			if (_isEnabled)
			for (var i = 0; i < fxArray.length; i++) {
				
				bmpSource = fxArray[i].doEffect(bmpSource, _w, _h,mcTarget);
				
			}
			
		}
		
	}
