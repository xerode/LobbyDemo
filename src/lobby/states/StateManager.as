package lobby.states {
	/**
	 * @author xerode
	 */
	import flash.utils.getDefinitionByName;

	public class StateManager {
		public const STATES : Array = 	[
											"lobby.particles.SparklerDemo",
											"lobby.particles.GravityDemo"
										];
		private var _stateIndex : uint = 0;

		public function getStateByName (s : String) : AState {
			if ( STATES.lastIndexOf(s) == -1 ) {
				throw new Error(s + " not found in states list");
				return;
			}

			var cr : Class = getDefinitionByName(s) as Class;

			var ci : AState = new cr() as AState;

			return ci;
		}

		public function getNextState() : AState {
			_stateIndex += 1;

			if ( _stateIndex >= STATES.length ) {
				_stateIndex = 0;
			}

			return getStateByName( STATES[ _stateIndex ] );
		}

		public function get stateIndex() : uint {
			return _stateIndex;
		}

		public function set stateIndex(stateIndex : uint) : void {
			_stateIndex = stateIndex;
		}
	}
}
