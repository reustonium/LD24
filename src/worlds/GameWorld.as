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
			add(GC.sky = new Sky());
			add(GC.player = new Player(130, 100));
			
			// Make Floors
			GC.floorList.push(new Floor(0, FP.height - 50, 1550, 50));
			GC.floorList.push(new Floor(1760, FP.height - 50, 120, 50));
			GC.floorList.push(new Floor(1950, FP.height - 50, 4450, 50));
			for each (var floor:Floor in GC.floorList)
			{
				add(floor);
			}
			
			// Make Tree's
			for (var i:int = 0 ; i < 20; i++)
			{
				var smallTree:Tree = new Tree(100 + FP.random * 5400, FP.height - 60 - 64);
				GC.treeList.push(smallTree);
				add(smallTree);
			}
			
			// Add Volcano
			for (var j:int = 0; j < 5; j++)
			{
				var vol:Entity = new Entity(1000 + FP.random * 1000 * j, FP.height -60 -240, new Image(GC.IMAGE_VOLCANO));
				vol.setHitbox(240, 240, 0, 0);
				vol.type = 'floor';
				GC.volcanoList.push(vol);
				add(vol);
				trace('added volcano');
			}
		}
		
		override public function update():void 
		{
			super.update();
		}
	}

}