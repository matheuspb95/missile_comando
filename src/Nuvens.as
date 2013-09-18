package  
{
	import org.flixel.*;
	/**
	 * ...
	 * @author ...
	 */
	public class Nuvens extends FlxSprite
	{
		[Embed(source = '../assets/nuvens_50x20.png')]private var nuvemPNG:Class;
		
		public function Nuvens(Y:Number) 
		{
			super(400, Y, nuvemPNG);
			velocity.x = -FlxG.random() * 160 + 80;
		}
		override public function update():void
		{
			super.update();
		}
	}

}