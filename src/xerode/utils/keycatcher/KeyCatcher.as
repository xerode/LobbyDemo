package xerode.utils.keycatcher {
	import spark.components.WindowedApplication;
	import mx.core.FlexGlobals;

	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.KeyboardEvent;
	

	/**
	 * @author xerode
	 */
	public class KeyCatcher extends EventDispatcher {
		
		public static const KEY_DOWN:String = "key_down";
		public static const KEY_UP:String = "key_up";
		
		private var _lastKeyDown:String = "";
		private var _lastKeyUp:String = "";
		
		public function KeyCatcher() {
			
		}
		
		public function addListeners():void {
			( FlexGlobals.topLevelApplication as WindowedApplication ).addEventListener(KeyboardEvent.KEY_DOWN, onKeyboardEvent);
			( FlexGlobals.topLevelApplication as WindowedApplication ).addEventListener(KeyboardEvent.KEY_UP, onKeyboardEvent);
		}
		
		public function removeListeners():void {
			( FlexGlobals.topLevelApplication as WindowedApplication ).removeEventListener(KeyboardEvent.KEY_DOWN, onKeyboardEvent);
			( FlexGlobals.topLevelApplication as WindowedApplication ).removeEventListener(KeyboardEvent.KEY_UP, onKeyboardEvent);
		}
		
		private function numToChar(num:int):String {
			if (num > 47 && num < 58) {
				var strNums:String = "0123456789";
			    return strNums.charAt(num - 48);
			} else if (num > 64 && num < 91) {
			    var strCaps:String = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
			    return strCaps.charAt(num - 65);
			} else if (num > 96 && num < 123) {
			    var strLow:String = "abcdefghijklmnopqrstuvwxyz";
			    return strLow.charAt(num - 97);
			} else {
			    return num.toString();
			}
		}
		
		private function onKeyboardEvent(event : KeyboardEvent) : void {
			
			switch( event.type ) {
				
				case KeyboardEvent.KEY_DOWN:
				
						trace( "down" );
						_lastKeyDown = numToChar( event.keyCode );
						this.dispatchEvent(new Event(KEY_DOWN));
				
					break;
				
				case KeyboardEvent.KEY_UP:
				
						_lastKeyUp = numToChar( event.keyCode );
						this.dispatchEvent(new Event(KEY_UP));
				
					break;
				
			}
			
		}

		public function get lastKeyDown() : String {
			return _lastKeyDown;
		}

		public function get lastKeyUp() : String {
			return _lastKeyUp;
		}
		
	}
}
