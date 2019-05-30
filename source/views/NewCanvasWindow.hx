package views;

import openfl.events.MouseEvent;
import openfl.events.Event;
import openfl.geom.Rectangle;
import openfl.geom.Point;
import openfl.display.BitmapData;
import gui.control.Slider;
import gui.control.ImageButton;
import gui.control.BitmapButton;
import gui.Label;

class NewCanvasWindow extends Window {

	public function new(){
		super(450, 300, "New Canvas...", 0xFF101010);
		if(Common.preferences.data.lastNewCanvasWindowPos != null) this.setPosition(Common.preferences.data.lastNewCanvasWindowPos);
		else this.setPosition(new Point(0, 100));
    }
}
