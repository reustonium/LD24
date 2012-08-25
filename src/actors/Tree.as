package actors 
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	
	/**
	 * @project LD24
	 * @author reustonium
	 */
	public class Tree extends Entity 
	{
		
		public function Tree(x:int, y:int)
		{
			super(x, y, new Image(GC.IMAGE_TREE));
			setHitbox(64, 64, 0, 0);
			type = 'floor';
		}
		
	}

}