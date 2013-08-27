package 
{
	
	import org.flixel.FlxGame;
	
	[SWF(width="800",height="600",backgroundColor="0x000000")]
	[Frame(factoryClass="Preloader")]
	
	/**
	 * ...
	 * @author Matheus
	 */
	public class Main extends FlxGame 
	{

		public function Main():void 
		{
			super(400, 300, MenuState, 2, 60, 60);
		}
	}

}