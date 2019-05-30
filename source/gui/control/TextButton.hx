package gui.control;

import openfl.geom.Rectangle;
import openfl.display.Sprite;
import openfl.events.MouseEvent;
import openfl.display.BitmapData;
import openfl.display.Bitmap;

class TextButton extends Sprite {
	var bgImage:Bitmap;
	var label:Label;

	// Element properties
	var buttonWidth:Int;
	var buttonHeight:Int;

	// Element colors
	var borderColor:Int = 0xFF66A1CC;
	var buttonColor:Int = 0xFFDDDDDD;
	var buttonColorOver:Int = 0xFF7FC9FF;
	var buttonColorDown:Int = 0xFF66A1CC;

	public function new(label:Label, buttonWidth:Int = 6, buttonHeight = 6, borderColor:Int = 0xFF66A1CC, buttonColor:Int = 0xFFDDDDDD, buttonColorOver:Int = 0xFF7FC9FF, buttonColorDown:Int = 0xFF66A1CC){
		super();

		this.label = label;
		
		this.buttonWidth = buttonWidth + Std.int(this.label.width);
		this.buttonHeight = buttonHeight + Std.int(this.label.height);
		this.label.x = (buttonWidth / 2);// - (this.label.width / 2);
		this.label.y = (buttonHeight / 2);// - (this.label.height / 2);
		
		this.borderColor = borderColor;
		this.buttonColor = buttonColor;
		this.buttonColorOver = buttonColorOver;
		this.buttonColorDown = buttonColorDown;

		bgImage = new Bitmap(new BitmapData(this.buttonWidth + 2, this.buttonHeight + 2));
		// Border
		bgImage.bitmapData.fillRect(new Rectangle(0, 0, this.buttonWidth + 2, this.buttonHeight + 2), this.borderColor);
		// Inner
		bgImage.bitmapData.fillRect(new Rectangle(1, 1, this.buttonWidth, this.buttonHeight), this.buttonColor);
		addChild(bgImage);

		addChild(this.label);

		addEventListener(MouseEvent.MOUSE_DOWN, onMouseDown);
		addEventListener(MouseEvent.MOUSE_UP, onMouseUp);
		addEventListener(MouseEvent.MOUSE_OVER, onMouseOver);
		addEventListener(MouseEvent.MOUSE_OUT, onMouseLeave);
	}

	function onMouseDown(evt:MouseEvent){
		bgImage.bitmapData.fillRect(new Rectangle(1, 1, buttonWidth, buttonHeight), buttonColorDown);
	}

	function onMouseUp(evt:MouseEvent){
		bgImage.bitmapData.fillRect(new Rectangle(1, 1, buttonWidth, buttonHeight), buttonColor);
	}

	function onMouseOver(evt:MouseEvent){
		bgImage.bitmapData.fillRect(new Rectangle(1, 1, buttonWidth, buttonHeight), buttonColorOver);
	}

	function onMouseLeave(evt:MouseEvent){
		bgImage.bitmapData.fillRect(new Rectangle(1, 1, buttonWidth, buttonHeight), buttonColor);
	}
}
