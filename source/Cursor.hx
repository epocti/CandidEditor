package;

import openfl.ui.Mouse;
import openfl.Assets;
import openfl.display.Bitmap;
import openfl.events.Event;
import openfl.display.Sprite;

class Cursor extends Sprite {
	var cursor:Bitmap;
	var current:String;

	public function new(){
		super();
		this.mouseChildren = false;
		this.hitArea = null;

		Mouse.hide();

		cursor = new Bitmap(Assets.getPath("assets/cursors/default.png"));
		cursor.x = 0;
		cursor.y = 0;
		current = "default";
		addChild(cursor);

		addEventListener(Event.ENTER_FRAME, onUpdate);
	}

	function onUpdate(evt:Event){
		this.x = stage.mouseX;
		this.y = stage.mouseY;
	}

	public function changeTo(cursorName:String){
		if(cursorName != current){
			cursor.bitmapData = Assets.getBitmapData("assets/cursors/" + cursorName + ".png");
			current = cursorName;
		}
	}
}
