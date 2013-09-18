package  
{
	import org.flixel.*;
	/**
	 * ...
	 * @author Matheus
	 */
	public class Predio extends FlxSprite
	{
		[Embed(source = '../assets/cidade_25x24x3.png')]private var cidade1PNG:Class;
		public function Predio(X:Number) 
		{
			super(X, 264);
			loadGraphic(cidade1PNG, true, true, 25, 24);
			solid = true;
			addAnimation("burn", [1,1,1,2], 8, false);
		}
		override public function update():void
		{
			super.update();
		}
		override public function kill():void
		{
			alive = false;
			solid = false;
			play("burn");
		}
	}
}