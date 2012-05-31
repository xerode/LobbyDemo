package lobby.particles {
	
	import lobby.states.AState;
	import org.flintparticles.twoD.emitters.Emitter2D;
	import org.flintparticles.twoD.renderers.BitmapRenderer;
	
	import flash.filters.BlurFilter;
	import flash.filters.ColorMatrixFilter;
	import flash.geom.Rectangle;

	/**
	 * @author xerode
	 */
	public class SparklerDemo extends AState {
		
		private var _renderer:BitmapRenderer;
		private var _emitter:Emitter2D;
		
		public function SparklerDemo() {
		}
		
		override public function create():void {
			_renderer = new BitmapRenderer( new Rectangle( 0, 0, 640, 480 ) );
			_renderer.addFilter( new BlurFilter( 2, 2, 1 ) );
			_renderer.addFilter( new ColorMatrixFilter( [ 1,0,0,0,0,0,1,0,0,0,0,0,1,0,0,0,0,0,0.95,0 ] ) );
			addChild( _renderer );
			      
			_emitter = new SparklerEmitter();
			_emitter.x = _currentUserInput.x;
			_emitter.y = _currentUserInput.y;
			_renderer.addEmitter( _emitter );
		}
		
		override public function destroy():void {
			
			stop();
			
			_renderer.removeEmitter( _emitter );
			removeChild( _renderer );
			
			_emitter = null;
			_renderer = null;
			
		}
		
		override public function start():void {
			_emitter.start();
		}
		
		override public function stop():void {
			_emitter.stop();
		}
		
		override public function update():void {
			_emitter.x += ( _currentUserInput.x - _emitter.x ) / 5;
			_emitter.y += ( _currentUserInput.y - _emitter.y ) / 5;
		}

		public function get emitter() : Emitter2D {
			return _emitter;
		}

		public function set emitter(emitter : Emitter2D) : void {
			_emitter = emitter;
		}
	}
}
