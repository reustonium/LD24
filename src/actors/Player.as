package actors 
{
	import flash.geom.Point;
	import menus.MatingMenu;
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;
	import worlds.Floor;
	import worlds.GameWorld;
	
	/**
	 * @project LD24
	 * @author reustonium
	 */
	public class Player extends Entity 
	{
		protected var playerImage:Image;
		protected var speed:Point = new Point(0, 0);
		
		// Player Abilities
		protected var jumpPower:Number = -2;
		protected var maxSpeed:Number = 3;
		protected var canFly:Boolean = false;
		protected var canTele:Boolean = false;
		
		// Player Timers
		protected var flyTime:Number = 0;
		protected var flyTimer:Number = 0;
		protected var messageSleep:Number = 3;
		protected var messageSleepTimer:Number = 0;
		
		public function Player(x:int, y:int) 
		{
			super(x, y, playerImage = new Image(GC.IMAGE_PLAYER));	
			setHitbox(48, 48);
			
			Input.define('moveLeft', Key.LEFT, Key.A);
			Input.define('moveRight', Key.RIGHT, Key.D);
			Input.define('jump', Key.W, Key.UP);
			Input.define('mate', Key.M);
			Input.define('tele', Key.T);
		}
		
		override public function update():void 
		{
			super.update();
			
			// Check for Mating
			if (FP.world.classCount(MatingMenu) == 0 )
			{
				if (Input.pressed('mate')) { new MatingMenu()}
			}
			
			// Check for player left/right movement
			checkMove();
			
			// Impose Gravity if not on floor
			if (!collide('floor', x, y + 1)) { speed.y += GC.gravity; }
			
			// Allow Jumping only if on the floor
			if (!canFly) 
			{
				if (collide('floor', x, y + 1))
				{
					if (Input.check('jump')) { speed.y = jumpPower; }
				}
			}
			if (canFly) 
			{ 
				if (Input.check('jump') && (flyTimer < flyTime)) 
				{ 
					speed.y = jumpPower;
					flyTimer += FP.elapsed;
				}
				
				if (collide('floor', x, y + 1)) { flyTimer = 0;}
			}
			
			// Ground Friction
			if (!Input.check('moveLeft') && !Input.check('moveRight')) { speed.x = 0; }
			
			// Teleport
			if (canTele)
			{
				if (Input.pressed('tele'))
				{
					x = ((FP.width-400) * FP.random) + 200;
					y = ((FP.height-300) * FP.random) + 50;
				}
			}
			// Move Player
			movePlayer();
			
			// Scroll Backdrops and Entities
			if (x > FP.width - 200 || x < 100)

			{
				// Backdrops and Player
				GC.sky.x -= speed.x;
				x -= speed.x;
				for each (var floor:Floor in GC.floorList)
				{
					floor.x -= speed.x;
				}
			
				for each(var tree:Tree in GC.treeList) { tree.x -= speed.x; }
				for each(var vol:Entity in GC.volcanoList) { vol.x -= speed.x; }
			}
			
			// Check for Death
			checkDeath();
		}
		
		public function mated(mate:String):void
		{
			trace(mate);
			if (mate == 'Frog') { jumpPower -= 4; }
			if (mate == 'Bird') { canFly = true; flyTime+=0.5}
			if (mate == 'Robot') { canTele = true; }
		}
		
		public function checkMove():void
		{
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
		}
		
		public function movePlayer():void
		{
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
		}
		
		public function checkDeath():void
		{
			if (y > FP.screen.height) 
			{ 
				GC.messageText.text = 'You are super dead'; 
				GC.message.visible = true;
				GC.message.width = 200;
				
				messageSleepTimer += FP.elapsed;
				
				if(messageSleepTimer>messageSleep) { FP.world = new GameWorld(); }
			}
		}
	}
}