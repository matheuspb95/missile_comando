package  
{
	import org.flixel.*;
	/**
	 * ...
	 * @author Matheus
	 */
	public class nivel1State extends FlxState
	{
		[Embed(source = '../assets/nivel1.png')]private var fundoPNG:Class;
		[Embed(source = '../assets/mira.png')]private var miraPNG:Class;
		private var fundo:FlxSprite = new FlxSprite(0, 0, fundoPNG);;
		private var HUD:FlxText = new FlxText(0, 0, 400);
		private var score:uint = 0;
		private var tempo:Number = 0;
		private var nave:Naves;
		
		public function nivel1State() 
		{
		}
		override public function create():void
		{
			FlxG.mouse.show(miraPNG);
			HUD.alignment = "right";
			add(fundo);
			add(HUD);
		}
		override public function update():void
		{
			super.update();
			tempo += FlxG.elapsed;
			tempo = Math.round(tempo * 1000);
			tempo = tempo / 1000;
			if (tempo % 3 == 0)
			{
				nave = new Naves();
				nave.spawnNaves(FlxG.random() * 400);
				nave.spawnNaves(FlxG.random() * 400);
				nave.spawnNaves(FlxG.random() * 400);
				add(nave);
			}
			HUD.text = "SCORE: " + score + "\n" + "TEMPO: \n" + tempo;
		}
	}

}