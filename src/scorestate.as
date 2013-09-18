package  
{
	import org.flixel.*;
	/**
	 * ...
	 * @author ...
	 */
	public class scorestate extends FlxState
	{
		private var HiScores:FlxSave = new FlxSave();
		private var T:FlxText = new FlxText(20, 20, 260);
		override public function create():void
		{
			T.text = HiScores.name+ "\n";
			T.text += HiScores.data.nome+"\n";
			T.text += HiScores.data.score;
			add(T);
		}
		override public function update():void
		{
			super.update();
			if (FlxG.keys.ESCAPE)
				FlxG.switchState(new MenuState);
		}
		public function addScore(N:String, S:int):void
		{
			HiScores.bind("hi");
			HiScores.data.nome = N;
			HiScores.data.score = S;
			HiScores.flush();
		}
	}
}