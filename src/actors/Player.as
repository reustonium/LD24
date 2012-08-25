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
		protected var jumpPower:Number = -10;
		protected var maxSpeed:Number = 3;
		
		public function Player(x:int, y:int) 
		{
			super(x, y, playerImage = new Image(GC.IMAGE_PLAYER));	
			setHitbox(48, 48);
			
			Input.define('moveLeft', Key.LEFT, Key.A);
			Input.define('moveRight', Key.RIGHT, Key.D);
			Input.define('jump', Key.W, Key.UP);
		}
		
		override public function update():void 
		{
			super.update();
			
			// Check for player left/right movement
			if (Input.check('moveLeft')) 
			{ 
				speed.x -= GC.moveSpeed; 
				if (speed.x < -maxSpeed) { speed.x = -maxSpeed;}
			}
			if (Input.check('moveRight')) 
			{ 
				speed.x += GC.moveSpeed; 
				if (speed.x > maxSpeed) { speed.x = maxSpeed;}
			}
			
			// Impose Gravity if not on floor
			if (!collide('floor', x, y + 1)) { speed.y += GC.gravity; }
			
			// Allow Jumping only if on the floor
			if (collide('floor', x, y + 1))
			{
				if (Input.check('jump')) { speed.y = jumpPower;}
			}
			
			// Ground Friction
			if (!Input.check('moveLeft') && !Input.check('moveRight')) { speed.x = 0; }
			
			// Move Player
			for (var i:int = 0; i < Math.abs(speed.x); i ++)
			{
				if (!collide("floor", x + FP.sign(speed.x), y)) { x += FP.sign(speed.x); }
				else { speed.x = 0; }
			}
			
			for (i = 0; i < Math.abs(speed.y); i ++)
			{
				if (!collide("floor", x, y + FP.sign(speed.y))) { y += FP.sign(speed.y); }
				else { speed.y = 0; }
			}
			
			// Scroll Backdrops and Entities
			if (x > FP.width - 200 || x < 100)
			{
				// Backdrops and Player
				GC.sky.x -= speed.x;
				GC.ground.x -= speed.x;
				x -= speed.x;
				
				trace(GC.treeList);
				
				for each(var tree:Tree in GC.treeList)
				{
					tree.x -= speed.x;
				}
			}
		}
	}
}