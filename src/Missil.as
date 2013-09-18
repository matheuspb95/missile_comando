package  
{
	import org.flixel.*;
	/**
	 * ...
	 * @author ...
	 */
	public class Missil extends FlxSprite
	{
		[Embed(source = '../assets/missil_5x9.png')]private var missilPNG:Class;
		[Embed(source = '../assets/explosion_30x30x14.png')]private var explosionPNG:Class;
		[Embed(source = '../assets/missle.mp3')]private var missileSFX:Class;
		[Embed(source = '../assets/bomb.mp3')]private var explosionSFX:Class;
		
		private var explosion:FlxSound = new FlxSound();
		private var missile:FlxSound = new FlxSound();
		private var ver:Boolean = true;
		private var ponto:FlxPoint = new FlxPoint(0, 0);
		private var time:Number = 0;
		
		public function Missil(X:Number, Y:Number) 
		{
			super(198, 260, missilPNG);
			missile.loadEmbedded(missileSFX);
			missile.play();
			antialiasing = true;
			ponto.x = X;
			ponto.y = Y;
			angle = ((Math.atan2((Y - 260), (X - 198)) * 180) / Math.PI) + 90;
			velocity.y = -Math.cos(angle * Math.PI/180) * 200;
			velocity.x = Math.sin(angle * Math.PI / 180) * 200;
		}
		override public function update():void
		{
			super.update();
			if (frame > 0)
			{
				velocity.x = 0;
				velocity.y = 0;
			}
			if (finished)
			{
				exists = false;
				alive = false;
			}
			if (y < ponto.y)
			{
				kill();
				time += FlxG.elapsed;
			}
		}
		override public function kill():void
		{			
			explosion.loadEmbedded(explosionSFX);
			explosion.play();
			angle = 0;
			velocity.x = 0;
			velocity.y = 0;
			if (ver)
			{
				x -= 15;
				y -= 15;
				loadGraphic(explosionPNG, true, false, 30, 30);
				addAnimation("explode", [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13], 13, false);
				play("explode");
			}
			ver = false;
		}
	}
}