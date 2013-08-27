package  
{
	import org.flixel.*;
	/**
	 * ...
	 * @author Matheus
	 */
	public class Predio extends FlxSprite
	{
		[Embed(source = '../assets/cidade1.png')]private var cidade1PNG:Class;
		public function Predio(X:Number) 
		{
			super(X, 260);
			loadGraphic(cidade1PNG, true, true, 32, 28);
			solid = true;
			addAnimation("burn", [1], 0, false);
			addAnimation("destroy", [2], 0, false);
		}
		override public function update():void
		{
			super.update();
		}
		override public function kill():void
		{
			play("burn");
		}
	}
}