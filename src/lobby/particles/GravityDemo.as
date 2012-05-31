package lobby.particles {
	import lobby.states.AState;
	
	import org.flintparticles.twoD.emitters.Emitter2D;
	import org.flintparticles.twoD.renderers.PixelRenderer;
	
	import flash.display.Sprite;
	import flash.filters.BlurFilter;
	import flash.filters.ColorMatrixFilter;
	import flash.geom.Rectangle;

	/**
	 * @author xerode
	 */
	public class GravityDemo extends AState {
		
		private var _renderer:PixelRenderer;
		private var _emitter:GravityWellsEmitter;
		
		public function GravityDemo() {
			super();
		}
		
		override public function create():void {
			_emitter = new GravityWellsEmitter();

			_renderer = new PixelRenderer( new Rectangle( 0, 0, 640, 480 ) );
			_renderer.addFilter( new BlurFilter( 2, 2, 1 ) );
			_renderer.addFilter( new ColorMatrixFilter( [ 1,0,0,0,0,0,1,0,0,0,0,0,1,0,0,0,0,0,0.99,0 ] ) );
			_renderer.addEmitter( _emitter );
			addChild( _renderer );
			
		}
		
		override public function destroy():void {
			
			stop();
			
			_renderer.removeEmitter( _emitter );
			_renderer.filters = [];
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
			_emitter.gravityControl.x += ( ( _currentUserInput.x ) - _emitter.gravityControl.x ) / 2;
			_emitter.gravityControl.y += ( ( _currentUserInput.y ) - _emitter.gravityControl.y ) / 2;
		}
		
	}
}
