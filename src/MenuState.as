package  
{
	import flash.accessibility.Accessibility;
	import mx.core.FlexSprite;
	import org.flixel.*;
	/**
	 * ...
	 * @author Matheus
	 */
	public class MenuState extends FlxState
	{
		[Embed(source = '../assets/naves_terra.png')]private var fundoPNG:Class;
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
			controls = new FlxButton(160, 140, "CONTROLS"); //, funcaocontrols
			scores = new FlxButton(160, 170, "SCORES"); //, funcaoscores
			credits = new FlxButton(160, 200, "CREDITS"); //, funcaocredits
			add(start);
			add(controls);
			add(scores);
			add(credits);
		}
		public function funcaostart():void
		{
			FlxG.switchState(new nivel1State);
		}
		public function funcaocontrols():void
		{
			FlxG.switchState(new controlsState);
		}
		public function funcaoscores():void
		{
			FlxG.switchState(new scoresState);
		}
		public function funcaocredits():void
		{
			FlxG.switchState(new creditsState);
		}
	}

}