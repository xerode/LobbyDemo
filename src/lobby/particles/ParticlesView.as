package lobby.particles {
	import flash.display.Sprite;
	import spark.core.SpriteVisualElement;
	import mx.events.FlexEvent;
	import spark.components.Group;

	/**
	 * @author xerode
	 */
	public class ParticlesView extends Group {
		
		public var spriteContainer:SpriteVisualElement;
		
		private var _testSprite:SparklerDemo;
		
		public function ParticlesView() {
			
			this.addEventListener( FlexEvent.CREATION_COMPLETE, onCreationComplete );
			
		}
		
		public function init():void {
			
			/*
			_testSprite = new Sprite();
			
			_testSprite.graphics.beginFill( 0xff00ff );
			_testSprite.graphics.drawRect( 0, 0, 300, 300 );
			_testSprite.graphics.endFill();
			
			spriteContainer.addChild( _testSprite );
			*/
			
			_testSprite = new SparklerDemo();
			_testSprite.setupSparkler();
			
			spriteContainer.addChild( _testSprite );
			
		}

		private function onCreationComplete(event : FlexEvent) : void {
			
			trace( "ParticlesView.onCreationComplete" );
			
			init();
			
		}
	}
}
