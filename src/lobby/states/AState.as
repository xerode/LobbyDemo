package lobby.states {
	import flash.display.Sprite;

	import lobby.states.IState;

	/**
	 * @author xerode
	 */
	public class AState extends Sprite implements IState {
		
		private var _father:Object;
		
		public function AState() {
			super();
		}
		
		public function setFather( o:Object ):void {
			_father = o;
		}
		
		public function getFather():Object {
			return _father;
		}

		public function create() : void {
			throw new Error( "This method must be overridden by a subclass" );
		}

		public function destroy() : void {
			throw new Error( "This method must be overridden by a subclass" );
		}

		public function start() : void {
			throw new Error( "This method must be overridden by a subclass" );
		}

		public function stop() : void {
			throw new Error( "This method must be overridden by a subclass" );
		}
	}
}
