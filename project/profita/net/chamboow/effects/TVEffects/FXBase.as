	
	/* TV FX class plugin base class */
	/* made in chamboow labs */
	
	// this is base class for each tv effect
	
	class net.chamboow.effects.TVEffects.FXBase {
		
		// is effect enabled or not
		public var _isEnabled:Boolean = true;
		
		public function FXBase() {
		
		}
		
		// disable effect
		public function disable() {
			
			_isEnabled = false;
			
		}
		
		// enable effect
		public function enable() {
			
			_isEnabled = true;
			
		}
		
	}
