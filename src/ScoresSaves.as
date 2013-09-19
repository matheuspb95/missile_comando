package  
{
	import org.flixel.*;
	/**
	 * ...
	 * @author Matheus
	 */
	public class ScoresSaves extends FlxState
	{
		private var HS:Array = new Array()
		private var n:String = "a";
		private var t:FlxText = new FlxText(30, 30, 200, "");
		public function ScoresSaves() 
		{
		}
		override public function create():void
		{
			for (var i:int = 0; i < 10;i++)
			{
				HS[i] = new Score(10 - i, n);
				t.text += HS[i].print() + "\n";
				n += "a";
			}
			add(t);
		}
	}
}