package worlds 
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;

	/**
	 * @project LD24
	 * @author reustonium
	 */
	public class Sky extends Entity
	{
		
		public function Sky() 
		{
			super(0, 0, new Image(GC.IMAGE_WORLD));
			type = 'sky';
		}
		
	}

}