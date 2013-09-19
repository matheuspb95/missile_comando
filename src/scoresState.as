package  
{
	import org.flixel.*;
	/**
	 * ...
	 * @author Matheus
	 */
	
	 //tela de scores
	 
	public class scoresState extends FlxState
	{
		private var Score1:Number = 0;
		private var Text:FlxText = new FlxText(120, 120, 2000, "SEU SCORE: ");
		public function scoresState() 
		{
		}
		public function seuScore(S:Number)
		{
			Score1 = S;
		}
		override public function create():void
		{
			Text.text += Score1;
			Text.size = 20;
			add(Text);
		}
	}

}