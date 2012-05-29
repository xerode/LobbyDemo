package lobby {
	import lobby.particles.ParticlesContainer;
	import mx.events.ResizeEvent;
	import spark.components.Button;
	import spark.components.WindowedApplication;

	import xerode.utils.keycatcher.KeyCatcher;

	import mx.events.AIREvent;

	import flash.display.StageDisplayState;
	import flash.events.Event;
	import flash.events.MouseEvent;

	/**
	 * @author xerode
	 */
	public class LobbyWindowedApplication extends WindowedApplication {
		
		private var _keyCatcher:KeyCatcher;
		private var _fullscreen:Boolean = false;
		
		public var fullscreenButton:Button;
		
		public var particles:ParticlesContainer;
		
		public function LobbyWindowedApplication() {
			
			this.addEventListener( AIREvent.WINDOW_COMPLETE, onWindowComplete );
			
		}
		
		public function init():void {
			trace( "init()" );
			
			status = "Press 'F' to go fullscreen";
			
			this.addEventListener(ResizeEvent.RESIZE, onWindowResize );
			
			initKeyCatcher();
			initFullScreenButton();
		}

		private function onWindowResize(event : ResizeEvent) : void {
			trace( "resized to " + stage.stageWidth + " x " + stage.stageHeight );
			
			_fullscreen = ( stage.displayState == StageDisplayState.FULL_SCREEN_INTERACTIVE );
			
			( _fullscreen ) ? status = "Press 'Esc' to exit fullscreen" : status = "Press 'F' to go fullscreen";
			
		}
		
		public function initFullScreenButton():void {
			trace( "initFullScreenButton()" );
			fullscreenButton.addEventListener(MouseEvent.CLICK, onFullScreenButtonClick );
		}

		private function initKeyCatcher():void {
			trace( "initKeyCatcher()" );
			_keyCatcher = new KeyCatcher();
			_keyCatcher.addListeners();
			_keyCatcher.addEventListener( KeyCatcher.KEY_DOWN, onKeyChange );
			_keyCatcher.addEventListener( KeyCatcher.KEY_UP, onKeyChange );
			
		}
		
		private function toggleFullscreen():void {
			
			_fullscreen = ! _fullscreen;
			
			( _fullscreen ) ? stage.displayState = StageDisplayState.FULL_SCREEN_INTERACTIVE : stage.displayState = StageDisplayState.NORMAL;
			
		}

		private function onWindowComplete(event : AIREvent) : void {
			this.removeEventListener(AIREvent.WINDOW_COMPLETE, onWindowComplete );
			init();
		}
		
		private function onKeyChange(event : Event) : void {
			
			switch( event.type ) {
				
				case KeyCatcher.KEY_UP:
					if( _keyCatcher.lastKeyDown == "F" ) {
						toggleFullscreen();
					}
				break;
				
			}
			
		}
		
		private function onFullScreenButtonClick(event : MouseEvent) : void {
			toggleFullscreen();
		}

	}
}
