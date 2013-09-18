package  
{
	import org.flixel.*;
	import flash.text.TextField;
	/**
	 * ...
	 * @author ...
	 */
	public class gameover extends FlxState
	{
		[Embed(source = '../assets/GameOver_400x300.jpg')]private var GameOverPNG:Class;
		
		private var Score1:int;
		private var scores:scorestate = new scorestate();
		private var Missies1:int;
		private var NavesDest:int;
		private var cidades1:int;
		private var nome:FlxInputText = new FlxInputText(100, 180, "ENTER YOUR NAME", 140, 0xff000000, 0xffffffff);
		private var Text:FlxText = new FlxText(100, 80, 2000);
		private var GameOver:FlxText = new FlxText(100, 10, 200, "GAME OVER");
		private var BG:FlxSprite = new FlxSprite(0, 0, GameOverPNG);
		private var box:FlxSprite = new FlxSprite(80, 50);
		
		public function gameover() 
		{	
		}
		public function seuScore(S:int, M:int, C:int):void
		{
			Score1 = S;
			Missies1 = M;
			cidades1 = C;
		}
		override public function create():void
		{
			FlxG.mouse.show();
			add(BG);
			
			box.makeGraphic(250, 180, 0xff000000)
			box.alpha = 0.5;
			add(box);
			
			Text.text = "Naves Destruidas: " + Score1;
			Score1 = Score1*100/Missies1;
			Text.text += "\nMisseis Usados: " + Missies1;
			Text.text += "\nCidades Destruidas: " + (6 - cidades1);
			Score1 = Score1 - 100 * (7 - cidades1);
			Text.text += "\n\nScore: " + Score1 * 10;
			Text.size = 15;
			add(Text);
			
			GameOver.size = 25;
			GameOver.alignment = "center";

			add(GameOver);
			
			nome.alignment = "left";
			nome.background = true;
			nome.backgroundColor = 0xff888888;
			nome.text = "ENTER YOUR NAME";
			nome.maxLength = 15;
			nome.enterCallBack = enterCallBack;
			add(nome);
			
		}
		override public function update():void
		{
			super.update();
			if (FlxG.keys.SPACE)
				FlxG.switchState(new MenuState);
		}
		public function enterCallBack(N:String):void
		{
			scores.addScore(N, Score1);
			FlxG.switchState(new MenuState);
			//FlxG.switchState(scores);
			//Text.text += "\n\n\n\nHi-Score: " + HiScores.data.scores + "\nNome: " + HiScores.data.nome;
		}
	}

}