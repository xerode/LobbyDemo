package lobby.particles {
	
	import lobby.states.StateLibrary;
	import lobby.states.AState;
	import lobby.states.StateManager;
	import uk.co.soulwire.cv.MotionTracker;
	import spark.core.SpriteVisualElement;
	import mx.events.FlexEvent;
	import spark.components.Group;
	
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.events.Event;
	import flash.media.Camera;
	import flash.media.Video;

	/**
	 * @author xerode
	 */
	public class ParticlesView extends Group {
		
		public var spriteContainer:SpriteVisualElement;
		
		private var _source : Bitmap;
		private var _video : BitmapData;
		
		private var _motionTracker:MotionTracker;
		
		private var _stateManager:StateManager = new StateManager();
		private var _currentState:AState;
		
		public function ParticlesView() {
			
			this.addEventListener( FlexEvent.CREATION_COMPLETE, onCreationComplete );
			
		}
		
		public function setState( s:String ):void {
			
			if( _currentState ) {
				_currentState.stop();
				spriteContainer.removeChild( _currentState );
				_currentState.destroy();
				_currentState = null;
			}
			
			var ns:AState = _stateManager.getState( s );
			
			ns.setFather( this );
			ns.create();
			
			_currentState = ns;
			
			spriteContainer.addChild( _currentState );
			
			_currentState.start();
			
		}
		
		public function init():void {
			
			StateLibrary.touch();
			
			initCamera();
			initParticles();
			
		}
		
		public function initParticles():void {
			
			setState( "lobby.particles.SparklerDemo" );
			
		}
		
		public function initCamera():void {
			
			var camW:uint = 640;
			var camH:uint = 480;

			// Create the camera
			var cam : Camera = Camera.getCamera();
			cam.setMode(camW, camH, 60 );
			
			// Create a video
			var vid : Video = new Video(camW, camH);
			vid.attachCamera(cam);
			
			// Create the Motion Tracker
			_motionTracker = new MotionTracker(vid);
			
			// We flip the input as we want a mirror image
			_motionTracker.flipInput = true;
			
			// Display the camera input with the same filters (minus the blur) as the MotionTracker is using
			_video = new BitmapData(camW, camH, false, 0);
			_source = new Bitmap(_video);
			_source.scaleX = -1;
			_source.x = camW;
			spriteContainer.addChild(_source);
			
			spriteContainer.addEventListener( Event.ENTER_FRAME, onFrame );
			
		}

		private function onCreationComplete(event : FlexEvent) : void {
			
			trace( "ParticlesView.onCreationComplete" );
			
			init();
			
		}
		
		private function onFrame(event : Event) : void {
			
			// Tell the MotionTracker to update itself
			_motionTracker.track();
			
			// Pushes MotionTracker values to currentState, update currentState
			_currentState.setUserInput( _motionTracker.x, _motionTracker.y );
			_currentState.update();
			
			_video.draw( _motionTracker.input );
			
			// If there is enough movement (see the MotionTracker's minArea property) then continue
			if ( !_motionTracker.hasMovement ) return;
			
		}
	
	}
}
