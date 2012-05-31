package lobby.particles {
	import org.flintparticles.twoD.actions.GravityWell;
	import org.flintparticles.twoD.emitters.Emitter2D;
	
	import org.flintparticles.common.counters.Blast;
  import org.flintparticles.common.initializers.ColorInit;
  import org.flintparticles.twoD.actions.Move;
  import org.flintparticles.twoD.initializers.Position;
  import org.flintparticles.twoD.zones.DiscZone;

  import flash.geom.Point;

	/**
	 * @author xerode
	 */
	public class GravityWellsEmitter extends Emitter2D {
		
		private var _gravityControl:GravityWell;
		
		public function GravityWellsEmitter() {
			counter = new Blast( 10000 );
      
			addInitializer( new ColorInit( 0xFFFF00FF, 0xFF00FFFF ) );
			addInitializer( new Position( new DiscZone( new Point( 320, 240 ), 240 ) ) );
			
			addAction( new Move() );
			
			_gravityControl = new GravityWell( -25, 320, 240 );
			
			addAction( _gravityControl );
			
			// addAction( new GravityWell( 30, 160, 120 ) );
			
      		addAction( new GravityWell( 25, 213, 160 ) );
      		addAction( new GravityWell( 25, 426, 320 ) );
      		addAction( new GravityWell( 25, 213, 320 ) );
      		addAction( new GravityWell( 25, 426, 160 ) );
			
		}

		public function get gravityControl() : GravityWell {
			return _gravityControl;
		}

		public function set gravityControl(gravityControl : GravityWell) : void {
			_gravityControl = gravityControl;
		}
		
	}
}
