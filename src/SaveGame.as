package
{
	import org.flixel.FlxG;
	import org.flixel.FlxSave;
	
	public class SaveGame
	{	
		// Name all the profiles you want to use.
		// A typical setup is 1 global for things
		// like settings, and multiple profiles
		// the player can switch between.
		public static const GLOBAL:int = 0;
		public static const PROFILE1:int = 1;
		public static const PROFILE2:int = 2;
		public static const PROFILE3:int = 3;
		
		/**
		 * Whether or not init has been called already.
		 */
		public static var initialized:Boolean = false;
		
		/**
		 * Init prepares any number of save games for use.
		 * 
		 * @param	Force		Force to re-initialize the save games if they have already been initialized.
		 * @param	...args		Any number of save games to initialize.
		 */
		public static function init(Force:Boolean = false, ...args):void {
			if (!initialized || Force) {
				FlxG.saves = new Array();
				for each (var arg:int in args) {
					FlxG.saves[arg] = new FlxSave();
					FlxG.saves[arg].bind("SAVE"+String(arg));
				}
				initialized = true;
			}
		}
		
		/**
		 * If the save game doesn't exist, create will fill it with the values supplied.
		 * It will not overwrite existing values unless Overwrite is set to true!
		 * Setting overwrite to true is useful for resetting a profile when a save is deleted.
		 * 
		 * @param	Save		The save number under which to save the values.
		 * @param	Values		An object containing all values to be saved.
		 * @param	Overwrite	Set to true to overwrite existing values (useful for resetting/deleting a save).
		 */
		public static function create(Save:int, Values:Object, Overwrite:Boolean=false):void {
			for (var value:* in Values)
				if (Overwrite || FlxG.saves[Save].data[value] == undefined)
				FlxG.saves[Save].data[value] = Values[value];
			FlxG.saves[Save].flush();
		}
		
	}

}