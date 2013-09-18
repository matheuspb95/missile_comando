package 
{
	import org.flixel.system.FlxPreloader;
	/**
	 * ...
	 * @author Matheus
	 */
	public class Preloader extends FlxPreloader 
	{
		public function Preloader() 
		{
			className = "Main";
			super();
			minDisplayTime = 3;
		}
	}
}