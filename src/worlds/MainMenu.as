package worlds 
{
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.graphics.Text;
	import net.flashpunk.World;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;
	
	/**
	 * @project LD24
	 * @author reustonium
	 */
	public class MainMenu extends World 
	{
		protected var activeMenuItem:int = 0;
		
		public function MainMenu() 
		{
			
		}
		
		override public function begin():void 
		{	
			super.begin();
			add(new Entity(0, 0, new Image(GC.MAINMENU)));
			
			// Define Input
			Input.define("menuUp", Key.W, Key.UP);
			Input.define("menuDown", Key.S, Key.DOWN);
			Input.define("menuSelect", Key.SPACE, Key.ENTER, Key.NUMPAD_ENTER);
		
			// Build Menu
			buildMenu();
		}
		
		override public function update():void 
		{
			super.update();
		
			if (Input.pressed("menuUp")) changeItem("menuUp");
			if (Input.pressed("menuDown")) changeItem("menuDown");
		}
		
		public function changeItem(inp:String):void
		{
			if (inp == "menuUp") 
			{
				activeMenuItem -= 1;
				if (activeMenuItem < 0) activeMenuItem = 0;
			}
			
			if (inp == "menuDown")
			{
				activeMenuItem += 1;
				if (activeMenuItem > this.typeCount("menuEntity")-1 ) activeMenuItem = this.typeCount("menuEntity")-1;
			}
			buildMenu();
		}
		
		public function buildMenu():void
		{
			var garbageList:Array = new Array();
			this.getType("menuEntity", garbageList);
			this.removeList(garbageList);
			
			for each(var mItem:String in GC.MENU_ITEMS)
			{
				Text.font = 'primma';
				Text.size = 36;
				var curText:Text = new Text(mItem.toUpperCase());
				
				if (GC.MENU_ITEMS.indexOf(mItem) == activeMenuItem) curText.color = uint(GC.MENU_COLOR_ACTIVE);
				else curText.color = uint(GC.MENU_COLOR);
				
				var curItem:Entity = new Entity(FP.halfWidth - 50, GC.MENU_ITEMS.indexOf(mItem) * 35 + FP.halfHeight, curText);
				curItem.type = "menuEntity";
				curItem.setHitbox(curText.width, curText.height, 0, 0);
				add(curItem);
			}
		}
		
	}

}