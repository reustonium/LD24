package  
{
	import actors.Player;
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Text;
	import net.flashpunk.utils.Data;
	import worlds.Floor;
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
		[Embed(source = 'assets/tree.png')] 
		public static const IMAGE_TREE:Class;
		[Embed(source = 'assets/mm_bg.png')] 
		public static const IMAGE_MM_BG:Class;
		[Embed(source = 'assets/gameworld.png')] 
		public static const IMAGE_WORLD:Class;
		[Embed(source = 'assets/volcano.png')] 
		public static const IMAGE_VOLCANO:Class;
		
		// Fonts
		[Embed(source = 'assets/primma.ttf', embedAsCFF = "false", fontFamily = 'primma')]
		public static const FONT_COLLEGE:Class;
		
		// MainMenu Items
		public static const MENU_COLOR:String = "0x444444";
		public static const MENU_COLOR_ACTIVE:String = "0xff6100"; 
		public static const MENU_ITEMS:Array = ["Play Game", "About Game"];
		
		// Game Constants
		public static var player:Player;
		public static var sky:Sky;
		public static var floorList:Array = new Array();
		public static const gravity:Number = 0.5;
		public static const moveSpeed:Number = 0.15;
		
		// Entities List
		public static var treeList:Array = new Array();
		public static var volcanoList:Array = new Array();
		public static var message:Entity = new Entity(FP.halfWidth, FP.halfHeight);
		public static var messageText:Text;
		
		// Wife List
		public static const wifeList:Array = ['Frog', 'Bird', 'Robot'];
	}
}