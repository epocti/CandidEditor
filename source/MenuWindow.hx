package;

import openfl.events.MouseEvent;
import openfl.display.Sprite;
import openfl.display.Bitmap;
import openfl.display.BitmapData;
import gui.control.ImageButton;

class MenuWindow extends Sprite {
	var backing:Bitmap;

	public function new(width:Int){
		super();
		backing = new Bitmap(new BitmapData(1, 22, false, 0xFF101010));
		backing.width = width;
		addChild(backing);

		var openButton:ImageButton = new ImageButton("assets/icon/open.png");
		openButton.x = 4;
		openButton.y = 4;
		addChild(openButton);
		openButton.addEventListener(MouseEvent.CLICK, onOpenButtonClick);

		var saveButton:ImageButton = new ImageButton("assets/icon/save.png");
		saveButton.x = 24;
		saveButton.y = 4;
		addChild(saveButton);
		saveButton.addEventListener(MouseEvent.CLICK, onSaveButtonClick);

		var saveAsButton:ImageButton = new ImageButton("assets/icon/saveas.png");
		saveAsButton.x = 44;
		saveAsButton.y = 4;
		addChild(saveAsButton);
		saveAsButton.addEventListener(MouseEvent.CLICK, onSaveAsButtonClick);
	}

	public function update(newWidth:Int):Void {
		backing.width = newWidth;
	}

	function onOpenButtonClick(evt:MouseEvent){
		ActionHandler.open();
	}

	function onSaveButtonClick(evt:MouseEvent){
		ActionHandler.save();
	}

	function onSaveAsButtonClick(evt:MouseEvent){
		ActionHandler.saveAs();
	}
}
