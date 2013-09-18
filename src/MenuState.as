package  
{
	import org.flixel.*;
	/**
	 * ...
	 * @author Matheus
	 */
	public class MenuState extends FlxState
	{
		[Embed(source = '../assets/Splash_400x300.png')]private var fundoPNG:Class;
		private var sprite:FlxSprite;
		private var start:FlxButton;
		private var scores:FlxButton;
		private var controls:FlxButton;
		private var credits:FlxButton;
		
		public function MenuState() 
		{
		}
		override public function create():void
		{
			FlxG.mouse.show();
			
			sprite = new FlxSprite(0, 0, fundoPNG);
			add(sprite);
			
			start = new FlxButton(160, 110, "START", funcaostart);
			add(start);
			
			controls = new FlxButton(160, 140, "CONTROLS", funcaocontrols); //
			add(controls);
			
			scores = new FlxButton(160, 170, "SCORES"); //, funcaoscores
			add(scores);
			
			credits = new FlxButton(160, 200, "CREDITS"); //, funcaocredits
			add(credits);
		}
		public function funcaostart():void
		{
			FlxG.switchState(new Aviso);
			//FlxG.fade(0xff000000, 1, changestate(1));
		}
		public function funcaocontrols():void
		{
			//FlxG.fade(0xff000000, 1, changestate(2));
			FlxG.switchState(new controlsState);
		}
		public function funcaoscores():void
		{
			//FlxG.fade(0xff000000, 1, changestate(3));
			FlxG.switchState(new scorestate);
		}
		public function funcaocredits():void
		{
			//FlxG.fade(0xff000000, 1, changestate(4));
			FlxG.switchState(new creditsState);
		}
	}
}