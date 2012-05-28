package lobby.particles {
	
	import org.flintparticles.twoD.emitters.Emitter2D;
	import org.flintparticles.twoD.renderers.BitmapRenderer;
		
	import flash.display.Sprite;
	import flash.filters.BlurFilter;
	import flash.filters.ColorMatrixFilter;
	import flash.geom.Rectangle;

	/**
	 * @author xerode
	 */
	public class SparklerDemo extends Sprite {
		
		private var _emitter:Emitter2D;
		
		public function SparklerDemo() {
		}
		
		public function setupSparkler():void {
			var renderer:BitmapRenderer = new BitmapRenderer( new Rectangle( 0, 0, 400, 400 ) );
			renderer.addFilter( new BlurFilter( 2, 2, 1 ) );
			renderer.addFilter( new ColorMatrixFilter( [ 1,0,0,0,0,0,1,0,0,0,0,0,1,0,0,0,0,0,0.95,0 ] ) );
			addChild( renderer );
			      
			_emitter = new SparklerSprite( renderer );
			renderer.addEmitter( _emitter );
			_emitter.start( );
		}
	}
}
