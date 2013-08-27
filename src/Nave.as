package  
{
	import org.flixel.*;
	/**
	 * ...
	 * @author Matheus
	 */
	public class Nave extends FlxSprite
	{
		[Embed(source = '../assets/naves.png')]private var navePNG:Class;
		public function Nave(X:Number) 
		{
			super(X, 0, navePNG);
			antialiasing = true;
			if (X < 200)
			{
				angle = -FlxG.random() * 55;
				velocity.y = Math.cos(angle * 0.0174) * 50;
				velocity.x = -Math.sin(angle * 0.0174) * 50;
			}
			else
			{
				angle = FlxG.random() * 55;
				velocity.y = Math.cos(angle * 0.0174) * 50;
				velocity.x = -Math.sin(angle * 0.0174) * 50;
			}
		}
		override public function update():void
		{
			super.update();
		}
	}
}