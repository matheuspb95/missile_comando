package  
{
	import org.flixel.*;
	/**
	 * ...
	 * @author Matheus
	 */
	
	//tela de controles
	
	public class controlsState extends FlxState
	{
		[Embed(source = "../assets/mouse_100x100.png")] private var mousePNG:Class;
		[Embed(source = "../assets/Jogo_275x206.png")] private var jogoPNG:Class;
		
		private var mouse:FlxSprite = new FlxSprite(290, 5, mousePNG);
		private var text:FlxText = new FlxText(5, 5, 280, "Impeça os mísseis de atingirem as cidades");
		private var jogo:FlxSprite = new FlxSprite(5, 50, jogoPNG);
		private var ok:FlxButton = new FlxButton(175, 265, "OK", menu);

		public function controlsState() 
		{
		}
		override public function create():void
		{
			FlxG.bgColor = 0xffDCDCDC;
			text.size = 13;
			text.color = 0xff000000;
			add(ok);
			add(jogo);
			add(mouse);
			add(text);
		}
		public function menu():void
		{
			FlxG.switchState(new MenuState);
		}
	}

}