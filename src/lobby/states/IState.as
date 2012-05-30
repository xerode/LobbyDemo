package lobby.states {
	/**
	 * @author xerode
	 */
	public interface IState {
		
		function setFather( o:Object ):void;
		
		function getFather():Object;
		
		function create():void;
		
		function destroy():void;
		
		function start():void;
		
		function stop():void;
		
	}
}
