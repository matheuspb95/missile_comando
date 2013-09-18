package  
{
	import org.flixel.*;
	import org.flixel.plugin.photonstorm.*;
	import org.flixel.plugin.photonstorm.FX.BlurFX;
	/**
	 * ...
	 * @author Matheus
	 */
	public class Nave extends FlxSprite
	{
		[Embed(source = '../assets/naves_7x10.png')]private var navePNG:Class;
		[Embed(source = '../assets/explosion_20x20x5.png')]private var explosionPNG:Class;
		[Embed(source = '../assets/bomb.mp3')]private var explosionSFX:Class;
		
		private var explosion:FlxSound = new FlxSound();
		private var ver:Boolean = true;
		
		public function Nave(X:Number,V:Number) 
		{
			super(X, 0, navePNG);
			antialiasing = true;
			if (X < 200)
			{
				angle = -FlxG.random() * 45;
				velocity.y = Math.cos(angle * 0.0174) * V;
				velocity.x = -Math.sin(angle * 0.0174) * V;
			}
			else
			{
				angle = FlxG.random() * 45;
				velocity.y = Math.cos(angle * 0.0174) * V;
				velocity.x = -Math.sin(angle * 0.0174) * V;
			}
		}
		override public function update():void
		{
			super.update();
			if (y > 278)
			{
				kill();
			}
			if (y > 0 && frame == 4)
			{
				exists = false;
				alive = false;
			}
		}
		override public function kill():void
		{
			solid = false;
			explosion.loadEmbedded(explosionSFX);
			explosion.play();
			angle = 0;
			velocity.x = 0;
			velocity.y = 0;
			if (ver)
			{
				loadGraphic(explosionPNG, true, false, 20, 20);
				addAnimation("explode", [0, 1, 2, 3, 4], 12, false);
				play("explode");
			}
			ver = false;
			if (finished)
			{
				exists = false;
				alive = false;
			}
		}
	}
}