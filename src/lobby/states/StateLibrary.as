package lobby.states {
	import lobby.particles.GravityDemo;
	import lobby.particles.SparklerDemo;
	/**
	 * @author xerode
	 */
	public class StateLibrary {
		
		public static function touch():void {
			
			var ci:*;
			
			ci = new SparklerDemo();
			
			ci = null;
			
			ci = new GravityDemo();
			
			ci = null;
			
		}
		
	}
}
