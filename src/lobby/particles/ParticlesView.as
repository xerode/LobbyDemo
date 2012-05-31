package lobby.particles {
	import lobby.states.AState;
	import lobby.states.StateLibrary;
	import lobby.states.StateManager;

	import spark.components.Group;
	import spark.core.SpriteVisualElement;

	import uk.co.soulwire.cv.MotionTracker;

	import mx.events.FlexEvent;

	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.events.Event;
	import flash.events.TimerEvent;
	import flash.media.Camera;
	import flash.media.Video;
	import flash.utils.Timer;
	

	/**
	 * @author xerode
	 */
	public class ParticlesView extends Group {
		
		private var _stateManager:StateManager = new StateManager();
		private var _currentState:AState;
		
		public var spriteContainer:SpriteVisualElement;
		
		private var _source : Bitmap;
		private var _video : BitmapData;
		
		private var _motionTracker:MotionTracker;
		
		private var _timer:Timer;
		public const TIMER_TICK:uint = 30000;
		
		private var _isPlaying:Boolean;
		
		public function ParticlesView() {
			
			this.addEventListener( FlexEvent.CREATION_COMPLETE, onCreationComplete );
			
		}
		
		public function setState( s:AState ):void {
			
			if( _currentState ) {
				_currentState.stop();
				spriteContainer.removeChild( _currentState );
				_currentState.destroy();
				_currentState = null;
			}
			
			s.setFather( this );
			s.create();
			
			_currentState = s;
			
			spriteContainer.addChild( _currentState );
			
			_currentState.start();
			
		}
		
		public function init():void {
			
			StateLibrary.touch();
			
			initCamera();
			initParticles();
			
			start();
			
		}
		
		public function initCamera():void {
			
			var camW:uint = 640;
			var camH:uint = 480;

			// Create the camera
			var cam : Camera = Camera.getCamera();
			
			
			if( cam ) {
				
				cam.setMode(camW, camH, 60 );
			
				// Create a video
				var vid : Video = new Video(camW, camH);
				vid.smoothing = true;
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
				
			}
			
		}
		
		public function initParticles():void {
			
			setState( _stateManager.getStateByName( _stateManager.STATES[ 0 ] ) );
			
		}
		
		public function start():void {
			
			_timer = new Timer( TIMER_TICK );
			_timer.addEventListener( TimerEvent.TIMER, onTimer );
			_timer.start();
			
			_isPlaying = true;
			
			spriteContainer.addEventListener( Event.ENTER_FRAME, onFrame );
			
		}
		
		public function stop():void {
			
			spriteContainer.removeEventListener( Event.ENTER_FRAME, onFrame );
			
			_isPlaying = false;
			
			_timer.stop();
			_timer.removeEventListener( TimerEvent.TIMER, onTimer );
			_timer = null;
			
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
		
		private function onTimer(event : TimerEvent) : void {
			
			trace( "change timer" );
			
			setState( _stateManager.getNextState() );
			
		}

		public function get isPlaying() : Boolean {
			return _isPlaying;
		}
	
	}
}
