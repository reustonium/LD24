package  
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Text;
	import net.flashpunk.utils.Data;
	/**
	 * @project LD24
	 * @author reustonium
	 */
	public class GC
	{
		// Images
		[Embed(source = 'assets/mainmenu.png')] 
		public static const MAINMENU:Class;
		
		// MainMenu Items
		public static const MENU_COLOR:String = "0x444444";
		public static const MENU_COLOR_ACTIVE:String = "0xff0000"; 
		public static const MENU_ITEMS:Array = ["Play Game", "About Game", "Game Options"];
	}
}