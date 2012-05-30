package lobby.states {
	import xerode.geom.Vector2D;
	import flash.display.Sprite;

	import lobby.states.IState;

	/**
	 * @author xerode
	 */
	public class AState extends Sprite implements IState {
		
		protected var _currentUserInput:Vector2D = new Vector2D();
		protected var _previousUserInput:Vector2D = new Vector2D();
		
		protected var _father:Object;
		
		public function AState() {
			super();
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
			throw new Error("This method must be overridden by a subclass");
		}
		
		public function update():void {
			throw new Error("This method must be overridden by a subclass");
		}
		
		public function setFather( o:Object ):void {
			_father = o;
		}
		
		public function getFather():Object {
			return _father;
		}
		
		public function setUserInput( nx:Number, ny:Number ):void {
			_previousUserInput = _currentUserInput.clone();
			_currentUserInput.setTo( nx, ny);
		}

		public function get currentUserInput() : Vector2D {
			return _currentUserInput;
		}

		public function get previousUserInput() : Vector2D {
			return _previousUserInput;
		}
		
	}
}
