package worlds 
{
	import actors.Player;
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.World;
	
	/**
	 * @project LD24
	 * @author reustonium
	 */
	public class GameWorld extends World 
	{
		protected var sky:Entity;
		
		public function GameWorld() 
		{
			
		}

		override public function begin():void 
		{
			super.begin();
			add(new Entity(0, 0, GC.sky = new Sky()));
			add(new Entity(0, FP.height - 50, GC.ground = new Ground()));
			add(new Player(30, 300));
			add(new Floor(0, FP.height - 50));
		}
		
		override public function update():void 
		{
			super.update();
			
		}
	}

}