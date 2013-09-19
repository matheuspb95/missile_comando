package 
{
	import org.flixel.*;
	public class Naves extends FlxGroup
	{
		public function Naves()
		{
			super();
		}
		public function spawnNaves(x:int):void
		{
			var tempNave:Nave = new Nave(x);
			add(tempNave);
		}
		override public function update():void
		{
			super.update();
		}
	}
}