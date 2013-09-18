package  
{
	import org.flixel.*;
	/**
	 * ...
	 * @author Matheus
	 */
	public class nivel1State extends FlxState
	{
		[Embed(source = '../assets/Background_nivel1_400x300.png')]private var fundoPNG:Class;
		[Embed(source = '../assets/canhao_32x20x2.png')]private var canhaoPNG:Class;
		[Embed(source = '../assets/mira_11x11.png')]private var miraPNG:Class;
		
		private var pauseMenu:FlxGroup = new FlxGroup;
		private var GO:gameover = new gameover();
		private var missil:FlxGroup = new FlxGroup();
		private var fundo:FlxSprite = new FlxSprite(0, 0, fundoPNG);
		private var cidade:FlxGroup;
		private var canhao:FlxSprite = new FlxSprite(184, 268);
		private var HUD:FlxText = new FlxText(0, 0, 400);
		private var numMisseis:int;
		private var numCidades:int = 6;
		private var tempo:Number = 59;
		private var naves:FlxGroup;
		private var func:Boolean = true;
		private var stopTime:Number;
		private var cont:Number = 0;
		
		override public function create():void
		{ 			
			FlxG.mouse.show(miraPNG);
			FlxG.score = 0;
			add(fundo);
			
			HUD.alignment = "right";
			add(HUD);
			
			cidade = new FlxGroup(6);
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
			add(cidade);
			
			canhao.loadGraphic(canhaoPNG, true, false, 32, 20);
			canhao.addAnimation("fail", [1], 0, true);
			add(canhao);
			
			naves = new FlxGroup();
			
			add(missil);
			
			pauseMenu.add(new FlxSprite(100, 25).makeGraphic(200, 225, 0xaa000000));
			pauseMenu.add(new FlxText(150, 35, 200, "PAUSE"));
			pauseMenu.add(new FlxButton(160, 70, "Continue", play));
			pauseMenu.add(new FlxButton(160, 100, "Quit", Quit));
		}
		override public function update():void
		{
			if(FlxG.keys.justPressed("P"))
	        {
		        FlxG.paused = true;
				add(pauseMenu);
	        }
	        if(FlxG.paused)
	        {
				pauseMenu.update();
		        if(FlxG.keys.justPressed("Q"))
		        {
			        FlxG.switchState(new MenuState());
		        }
		        return;
			}
			tempo -= FlxG.elapsed;
			tempo = Math.round(tempo * 100) / 100;
			if (tempo % 5 == 0 && tempo > 6)
			{
				addNaves();
			}
			if (FlxG.mouse.justPressed() && func)
			{
				missil.add(new Missil(FlxG.mouse.x, FlxG.mouse.y));
				numMisseis++
			}
			if (FlxG.overlap(naves, cidade, Destroy))
			{
				numCidades--;
			}
			if (FlxG.overlap(naves, missil, Destroy))
			{
				FlxG.score++;
			}
			if (FlxG.overlap(naves, canhao))
			{
				func = false;
				canhao.play("fail");
				stopTime = tempo;
			}
			if (stopTime-3  > tempo)
				func = true;
				canhao.frame = 0;
			if (numCidades <= 0)
			{
				GO.seuScore(FlxG.score, numMisseis, numCidades);
				FlxG.fade(0xff000000, 0.25, changestate);
			}
			if (tempo < 0)
			{
				FlxG.switchState(new nivel2state);
			}	
			HUD.text = "SCORE: " + FlxG.score + "\n" + "TEMPO: 0:" + (int((Math.round(tempo) / 10))? "" + Math.round(tempo): "0" + Math.round(tempo));
			super.update();
		}
		public function Destroy(N:FlxObject, C:FlxObject):void
		{
			C.kill();
			N.kill();
		}
		public function addNaves():void
		{
			naves.add(new Nave(FlxG.random() * 400, 30));
			naves.add(new Nave(FlxG.random() * 400, 30));
			naves.add(new Nave(FlxG.random() * 400, 30));
			add(naves);
		}
		public function changestate():void
		{
			FlxG.switchState(GO);
		}
		public function play():void
		{
			FlxG.paused = false;
			remove(pauseMenu);
		}
		public function Quit():void
		{
			FlxG.switchState(new MenuState());
		}
	}
}