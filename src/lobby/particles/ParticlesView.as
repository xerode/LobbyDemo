package lobby.particles {
	
	import uk.co.soulwire.cv.MotionTracker;
	import spark.core.SpriteVisualElement;
	import mx.events.FlexEvent;
	import spark.components.Group;
	
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.Shape;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.filters.ColorMatrixFilter;
	import flash.media.Camera;
	import flash.media.Video;

	/**
	 * @author xerode
	 */
	public class ParticlesView extends Group {
		
		public var spriteContainer:SpriteVisualElement;
		
		private var _sparkler:SparklerDemo;
		
		private var _target : Shape;
		private var _bounds : Shape;
		private var _output : Bitmap;
		private var _source : Bitmap;
		private var _video : BitmapData;
		
		private var _motionTracker:MotionTracker;
		
		public function ParticlesView() {
			
			this.addEventListener( FlexEvent.CREATION_COMPLETE, onCreationComplete );
			
		}
		
		public function init():void {
			
			initCamera();
			initSparkler();
			
		}
		
		public function initSparkler():void {
			
			_sparkler = new SparklerDemo();
			_sparkler.setupSparkler();
			
			spriteContainer.addChild( _sparkler );
			
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
			
			/*
			// Show the image the MotionTracker is processing and using to track
			_output = new Bitmap(_motionTracker.trackingImage);
			_output.x = camW + 20;
			_output.y = 10;
			spriteContainer.addChild(_output);
			
			// A shape to represent the tracking point
			_target = new Shape();
			_target.graphics.lineStyle(0, 0xFFFFFF);
			_target.graphics.drawCircle(0, 0, 10);
			spriteContainer.addChild(_target);
			
			// A box to represent the activity area
			_bounds = new Shape();
			_bounds.x = _output.x;
			_bounds.y = _output.y;
			spriteContainer.addChild(_bounds);
			*/
			
			spriteContainer.addEventListener( Event.ENTER_FRAME, onFrame );
			
		}

		private function onCreationComplete(event : FlexEvent) : void {
			
			trace( "ParticlesView.onCreationComplete" );
			
			init();
			
		}
		
		private function onFrame(event : Event) : void {
			
			// Tell the MotionTracker to update itself
			_motionTracker.track();
			
			_sparkler.emitter.x += ( _motionTracker.x - _sparkler.emitter.x ) / 5;
			_sparkler.emitter.y += ( _motionTracker.y - _sparkler.emitter.y ) / 5;
			
			/*
			// Move the target with some easing
			_target.x += ((_motionTracker.x + _bounds.x) - _target.x) / 10;
			_target.y += ((_motionTracker.y + _bounds.y) - _target.y) / 10;
			*/
			
			_video.draw(_motionTracker.input);
			
			// If there is enough movement (see the MotionTracker's minArea property) then continue
			if ( !_motionTracker.hasMovement ) return;
			
			/*
			// Draw the motion bounds so we can see what the MotionTracker is doing
			_bounds.graphics.clear();
			_bounds.graphics.lineStyle(0, 0xFFFFFF);
			_bounds.graphics.drawRect(_motionTracker.motionArea.x, _motionTracker.motionArea.y, _motionTracker.motionArea.width, _motionTracker.motionArea.height);
			*/
		}
	
	}
}
