package worlds 
{
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.graphics.Text;
	import net.flashpunk.World;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;
	
	/**
	 * @project LD24
	 * @author reustonium
	 */
	public class MainMenu extends World 
	{
		protected var clickToPlay:Entity;
		
		public function MainMenu() 
		{
			
		}
		
		override public function begin():void 
		{
			var clickText:Text = new Text("Click to Play");
			clickText.color = 0x000000;
			clickToPlay = new Entity(FP.screen.width/2 - 50, FP.screen.height - 30, clickText);
			
			add(new Entity(0, 0, new Image(GC.MAINMENU)));
			add(clickToPlay);
			super.begin();
		}
		
		override public function update():void 
		{
			if (Input.mouseReleased)
			{
				trace("mouse released");
			}
			
			else if (Input.mousePressed)
			{
				trace("mouse Pressed");
				FP.world = new GameWorld();
			}
			super.update();
		}
		
	}

}