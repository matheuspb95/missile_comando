package  
{
	import org.flixel.*;
	/**
	 * ...
	 * @author ...
	 */
	public class TestState extends FlxState
	{
		[Embed(source = '../assets/Particle.png')]private var partPNG:Class;
		
		private var missil:FlxGroup = new FlxGroup();
		private var explosao:FlxEmitterExt = new FlxEmitterExt();
		private var part:FlxSprite = new FlxSprite();
		public var ponto:FlxPoint = new FlxPoint(0, 0);
		
		public function TestState() 
		{
		}
		override public function create():void
		{
			FlxG.mouse.show();
			explosao.makeParticles(partPNG, 300);
			explosao.setMotion(0, 0, 0, 360, 15, 1.5);
			add(explosao);
			add(missil);
		}
		override public function update():void
		{
			super.update();
			if (FlxG.mouse.justPressed())
			{
				ponto.x = FlxG.mouse.x;
				ponto.y = FlxG.mouse.y;
				missil.add(new Missil);
			}
			if ()
			{
				explosao.x = ponto.x;
				explosao.y = ponto.y;
				explosao.start();
			}
		}
	}

}