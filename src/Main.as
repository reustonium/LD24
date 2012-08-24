package 
{
	import net.flashpunk.FP;
	import net.flashpunk.World;
	import net.flashpunk.Engine;
	import worlds.MainMenu;
	
	/**
	 * Made for LD24
	 * 08/24/12
	 * by @reustonium
	 */
	
	public class Main extends Engine 
	{
		
		public function Main():void 
		{
			super(320, 240, 60, false);
			FP.screen.scale = 2;
		}	
		
		override public function init():void 
		{
			FP.world = new MainMenu();
			super.init();
		}

	}
}