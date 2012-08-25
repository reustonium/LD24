package worlds 
{
	import net.flashpunk.Entity;
	
	/**
	 * @project LD24
	 * @author reustonium
	 */
	public class Floor extends Entity 
	{
		
		public function Floor(x:int, y:int) 
		{
			super(x, y);
			setHitbox(640, 50);
			type = 'floor';
		}
		
	}

}