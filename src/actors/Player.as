package actors 
{
	import flash.geom.Point;
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;
	
	/**
	 * @project LD24
	 * @author reustonium
	 */
	public class Player extends Entity 
	{
		protected var playerImage:Image;
		protected var speed:Point = new Point(0, 0);
		
		public function Player(x:int, y:int) 
		{
			super(x, y, playerImage = new Image(GC.IMAGE_PLAYER));	
			setHitbox(48, 48);
			
			Input.define('moveLeft', Key.LEFT, Key.A);
			Input.define('moveRight', Key.RIGHT, Key.D);
		}
		
		override public function update():void 
		{
			super.update();
			
			// Check for player left/right movement
			if (Input.check('moveLeft')) { speed.x -= 0.25; }
			if (Input.check('moveRight')) { speed.x += 0.25; }
			
			// Impose Gravity if not on floor
			if (!collide('floor', x, y + 1)) { speed.y += GC.gravity; }
			
			// Ground Friction
			if (!Input.check('moveLeft') && !Input.check('moveRight')) { speed.x = 0; }
			
			// Move Player
			for (var i:int; i < Math.abs(speed.x); i++)
			{
				if (!collide('floor', x + FP.sign(speed.x), y)) { x += FP.sign(speed.x); }
				else { speed.x = 0; }
			}
			for (var i:int; i < Math.abs(speed.y); i++)
			{
				if (!collide('floor', x, FP.sign(speed.y) + y)) { y += FP.sign(speed.y); }
				else { speed.y = 0; }
			}
		}
		
	}

}