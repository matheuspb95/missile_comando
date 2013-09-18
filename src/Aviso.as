package  
{
	import org.flixel.*;
	/**
	 * ...
	 * @author ...
	 */
	public class Aviso extends FlxState
	{
		[Embed(source = '../assets/TelaInicial_400x300x2.png')]private var fundoPNG:Class;
		[Embed(source = '../assets/alarm.mp3')]private var alarmSFX:Class;
		
		private var fundo:FlxSprite = new FlxSprite();
		private var T:FlxText = new FlxText(30, 120, 350);
		private var tempo:Number = 0;
		
		public function Aviso() 
		{	
		}
		
		override public function create():void
		{
			FlxG.mouse.hide();
			FlxG.play(alarmSFX, 1, true);
			
			fundo.loadGraphic(fundoPNG, true, false, 400, 300);
			fundo.addAnimation("aviso", [0, 1], 2, true);
			add(fundo);
			
			T.size = 40;
			T.alignment = "center";
			add(T);
		}
		override public function update():void
		{
			tempo += FlxG.elapsed;
			super.update();
			fundo.play("aviso");
	
			if (tempo > 2)
				T.text = "ATENÇÃO";
			
			if (tempo > 4.5)
			{
				T.y = 60;
				T.text = "MISSEIS ALIENIGENAS \nA CAMINHO";
			}
			
			if (tempo > 7)
			{
				T.y = 80
				T.text = "EVACUEM \nAS CIDADES";
			}
			
			if (tempo > 9.5)
				T.text = "PREPAREM \nOS MISSEIS";
				
			if (tempo > 11)
				remove(T);
				
			if (tempo > 12 || FlxG.keys.ESCAPE)
				FlxG.fade(0xff000000, 2, changestate);
		}
		
		public function changestate():void
		{
			FlxG.switchState(new nivel1State)	
		}
	}
}