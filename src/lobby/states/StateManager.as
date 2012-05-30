package lobby.states {
	/**
	 * @author xerode
	 */
	 
	import flash.utils.getDefinitionByName;
	 
	public class StateManager {
		
		public function getState( s:String ):AState {
			
			var cr:Class = getDefinitionByName( s ) as Class; 
			
			var ci:AState = new cr() as AState;
			
			return ci;
			
		}
		
	}
}
