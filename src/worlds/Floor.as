package worlds 
{
	import net.flashpunk.Entity;
	
	/**
	 * @project LD24
	 * @author reustonium
	 */
	public class Floor extends Entity 
	{
		
		public function Floor(x:int, y:int, len:int, hei:int) 
		{
			super(x, y);
			setHitbox(len, hei);
			type = 'floor';
		}
		
	}

}