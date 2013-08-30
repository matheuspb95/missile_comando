package  
{
	import adobe.utils.CustomActions;
	import org.flixel.*;
	/**
	 * ...
	 * @author Matheus
	 */
	public class nivel1State extends FlxState
	{
		[Embed(source = '../assets/nivel1.png')]private var fundoPNG:Class;
		[Embed(source = '../assets/canhao.png')]private var canhaoPNG:Class;
		[Embed(source = '../assets/mira.png')]private var miraPNG:Class;
		
		private var scorestate:scoresState = new scoresState();
		private var missil:FlxGroup = new FlxGroup();
		private var fundo:FlxSprite = new FlxSprite(0, 0, fundoPNG);
		private var cidade:FlxGroup;
		private var canhao:FlxSprite = new FlxSprite(184, 268, canhaoPNG);
		private var HUD:FlxText = new FlxText(0, 0, 400);
		private var numMisseis:int;
		private var numCidades:int = 6;
		private var score:uint = 0;
		private var tempo:Number = 0;
		private var naves:FlxGroup;
		private var func:Boolean = true;
		private var stopTime:Number;
		
		public function nivel1State() 
		{
		}
		override public function create():void
		{
			FlxG.mouse.show(miraPNG);
			HUD.alignment = "right";
			cidade = new FlxGroup(6);
			naves = new FlxGroup();
			var c:Predio;
			for (var i:int = 0; i < 3; i++)
			{
				c = new Predio(22 + i * 54);
				cidade.add(c);
			}
			for (i = 0; i < 3; i++)
			{
				c = new Predio(238 + i * 54);
				cidade.add(c);
			}
			add(fundo);
			add(HUD);
			add(cidade);
			add(canhao);
			add(missil);
		}
		override public function update():void
		{
			super.update();
			tempo += FlxG.elapsed;
			tempo = Math.round(tempo * 1000);
			tempo = tempo / 1000;
			if (tempo % 2 == 0)
			{
				addNaves();
			}
			if (FlxG.mouse.justPressed())
			{
				if (func)
				{
					missil.add(new Missil());
					numMisseis++
				}
			}
			if (FlxG.overlap(naves, cidade, Destroy))
			{
				numCidades--;
			}
			if (FlxG.overlap(naves, missil, Destroy))
			{
				score += 10;
			}
			if (FlxG.overlap(naves, canhao))
			{
				func = false;
				stopTime = tempo;
			}
			if (stopTime+3  < tempo)
				func = true;
			if (numCidades == 0)
			{
				
				score -= numMisseis * 2;
				score *= tempo / 10;
				scorestate.seuScore(score);
				FlxG.switchState(scorestate);
			}
			//verificar colisão naves+cidades
			//verificar colisão naves+misseis
			//verificar colisão naves+canhao
			//criar tela de pause
			HUD.text = "SCORE: " + score + "\n" + "TEMPO: \n" + tempo;
		}
		public function Destroy(N:FlxObject, C:FlxObject):void
		{
			C.kill();
			N.kill();
		}
		public function addNaves():void
		{
			naves.add(new Nave(FlxG.random() * 400));
			naves.add(new Nave(FlxG.random() * 400));
			naves.add(new Nave(FlxG.random() * 400));
			add(naves);
		}
	}
}