package lobby.states {
	/**
	 * @author xerode
	 */
	public interface IState {
		
		function create():void;
		
		function destroy():void;
		
		function start():void;
		
		function stop():void;
		
		function update():void;
		
		function setFather( o:Object ):void;
		
		function getFather():Object;
		
		function setUserInput( nx:Number, ny:Number ):void;
		
	}
}
