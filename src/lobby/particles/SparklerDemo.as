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
		
		private var _emitter:Emitter2D;
		
		public function SparklerDemo() {
		}
		
		override public function create():void {
			var renderer:BitmapRenderer = new BitmapRenderer( new Rectangle( 0, 0, 640, 480 ) );
			renderer.addFilter( new BlurFilter( 2, 2, 1 ) );
			renderer.addFilter( new ColorMatrixFilter( [ 1,0,0,0,0,0,1,0,0,0,0,0,1,0,0,0,0,0,0.95,0 ] ) );
			addChild( renderer );
			      
			_emitter = new SparklerSprite( renderer );
			renderer.addEmitter( _emitter );
			_emitter.start();
		}

		public function get emitter() : Emitter2D {
			return _emitter;
		}

		public function set emitter(emitter : Emitter2D) : void {
			_emitter = emitter;
		}
	}
}
