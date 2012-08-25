package menus 
{
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.Graphic;
	import net.flashpunk.graphics.Graphiclist;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.graphics.Text;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;
	
	/**
	 * @project LD24
	 * @author reustonium
	 */
	public class MatingMenu extends Entity 
	{
		protected var display:Graphiclist;
		protected var activeSelection:int;
		protected var menuOptions:Array;
		
		public function MatingMenu() 
		{
			// Controls for the Menu
			Input.define("menuUp", Key.W, Key.UP);
			Input.define("menuDown", Key.S, Key.DOWN);
			Input.define("menuSelect", Key.SPACE, Key.ENTER, Key.NUMPAD_ENTER);
			
			buildMenu();
			

			
			super(FP.halfWidth * 0.5, FP.halfHeight * 0.5, display);
			FP.world.add(this);
		}
		
		override public function update():void 
		{
			super.update();
		
			if (Input.pressed(Key.ESCAPE)) { FP.world.remove(this); }
			if (Input.pressed('menuUp') && activeSelection >= 1) 
			{ 
				activeSelection--;
				colorMenu(); 
			}
			if (Input.pressed('menuDown') && activeSelection < GC.wifeList.length-1) 
			{ 
				activeSelection++;
				colorMenu(); 
			}
			if (Input.pressed('menuSelect'))
			{
				var temp:Text = menuOptions[activeSelection];
				GC.player.mated(temp.text);
				FP.world.remove(this);
			}
		}
		
		public function buildMenu():void
		{
			display = new Graphiclist();
			menuOptions = new Array();
			
			// Add Box to display
			display.add(new Image(GC.IMAGE_MM_BG));
			
			for (var i:int; i < GC.wifeList.length; i++)
			{
				var curText:Text = new Text(GC.wifeList[i], 20, i * 60);
				menuOptions.push(curText);
				
				display.add(curText);
			}
			
			colorMenu();
		}
		
		public function colorMenu():void
		{
			trace(activeSelection);
			for each (var item:Text in menuOptions)
			{
				item.color = 0x000000;
			}
			
			var selected:Text = menuOptions[activeSelection];
			selected.color = 0xff00ff;
		}
	}
}