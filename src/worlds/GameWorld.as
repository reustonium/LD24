package worlds 
{
	import actors.Player;
	import actors.Tree;
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
		public function GameWorld() 
		{
			
		}

		override public function begin():void 
		{
			super.begin();
			add(new Entity(0, 0, GC.sky = new Sky()));
			add(new Entity(0, FP.height - 50, GC.ground = new Ground()));
			add(GC.player = new Player(130, 100));
			add(new Floor(0, FP.height - 50));
			
			// Make Tree's
			for (var i:int; i < 5; i++)
			{
				var smallTree:Tree = new Tree(100 + 200*i, FP.height - 50 - 64);
				GC.treeList.push(smallTree);
				add(smallTree);
			}
		}
		
		override public function update():void 
		{
			super.update();
		}
	}

}