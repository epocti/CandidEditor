package gui.control;

import openfl.display.BitmapData;
import openfl.display.Bitmap;
import openfl.display.Sprite;

class BitmapButton extends Sprite {
	public var img:Bitmap;

	public function new(imgData:BitmapData){
		super();

		img = new Bitmap(imgData);
		addChild(img);
	}
}
