package ;

import openfl.text.TextFieldAutoSize;
import gui.Label;
import openfl.display.Sprite;
import openfl.geom.Rectangle;
import openfl.display.BitmapData;
import openfl.display.Bitmap;

class StatusBar extends Sprite {
	var backing:Bitmap;
	var zoomLabel:Label;
	var toolLabel:Label;

	public function new(width:Int, height:Int){
		super();

		backing = new Bitmap(new BitmapData(1, 24));
		backing.bitmapData.fillRect(new Rectangle(0, 0, 1, 24), 0xFFFFFFFF);
		backing.width = width;
		y = height - 22;
		addChild(backing);

		zoomLabel = new Label("100%");
		zoomLabel.x = 0;
		zoomLabel.y = 0;
		addChild(zoomLabel);

		toolLabel = new Label("Brush");
		toolLabel.x = 100;
		toolLabel.y = 0;
		addChild(toolLabel);
	}

	public function update(newWidth:Int, newHeight:Int){
		backing.width = newWidth;
		y = newHeight - 22;
	}

	public function setZoomLevel(newLevel:Float){
		zoomLabel.setText(newLevel + "%");
	}

	public function updateTool(newTool:String){
		toolLabel.setText(newTool);
	}
}