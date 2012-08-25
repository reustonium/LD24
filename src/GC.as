package  
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Text;
	import net.flashpunk.utils.Data;
	import worlds.Ground;
	import worlds.Sky;
	/**
	 * @project LD24
	 * @author reustonium
	 */
	public class GC
	{
		// Screen Constants
		public static const SCREEN_SCALE:int = 1;
		
		// Images
		[Embed(source = 'assets/mainmenu.png')] 
		public static const IMAGE_MAINMENU:Class;
		[Embed(source = 'assets/sky.png')] 
		public static const IMAGE_SKY:Class;
		[Embed(source = 'assets/ground.png')] 
		public static const IMAGE_GROUND:Class;
		[Embed(source = 'assets/player.png')] 
		public static const IMAGE_PLAYER:Class;
		
		// Fonts
		[Embed(source = 'assets/primma.ttf', embedAsCFF = "false", fontFamily = 'primma')]
		public static const FONT_COLLEGE:Class;
		
		// MainMenu Items
		public static const MENU_COLOR:String = "0x444444";
		public static const MENU_COLOR_ACTIVE:String = "0xff6100"; 
		public static const MENU_ITEMS:Array = ["Play Game", "About Game", "Game Options"];
		
		// Game Constants
		public static var sky:Sky;
		public static var ground:Ground;
		public static var gravity:Number = 0.2;
	}
}