package  
{
	import org.flixel.*;
	/**
	 * ...
	 * @author ...
	 */
	public class Missil extends FlxSprite
	{
		[Embed(source = '../assets/missil.png')]private var missilPNG:Class;
		public var ponto:FlxPoint = new FlxPoint(0, 0);
		public var explosao:FlxEmitterExt = new FlxEmitterExt();
		//public var part:FlxSprite = new FlxSprite();
		
		public function Missil() 
		{
			super(196, 270, missilPNG);
			antialiasing = true;
			/*part.makeGraphic(1, 1, 0xffff0000);
			for (var i:int = 0; i < 300; i++)
			{
				explosao.add(part);
			}
			explosao.setMotion(0, 0, 0, 360, 15, 1.5);*/
			ponto.x = FlxG.mouse.x;
			ponto.y = FlxG.mouse.y;
		}
		override public function update():void
		{
			super.update();
			angle = ((Math.atan2((ponto.y - 290), (ponto.x - 190)) * 180) / Math.PI) + 90;
			velocity.y = -Math.cos(angle * 0.0174) * 200;
			velocity.x = Math.sin(angle * 0.0174) * 200;
			/*if (y < ponto.y)
			{
				explosao.x = ponto.x;
				explosao.y = ponto.y;
				explosao.start();
				kill();
			}*/
		}
		override public function kill():void
		{
			alive = false;
			exists = false;
		}
	}
}