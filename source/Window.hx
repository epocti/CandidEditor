package;

import openfl.display.DisplayObject;
import openfl.events.MouseEvent;
import openfl.geom.Rectangle;
import openfl.geom.Point;
import openfl.display.BitmapData;
import openfl.display.Bitmap;
import openfl.display.Sprite;
import openfl.display.Shape;
import gui.Label;
import openfl.Lib;

class Window extends Sprite {
	var titleText:String;
	var titleHeight:Int = 20;
	var titleLabel:Label;

	var windowWidth:Int;
	var windowHeight:Int;

	var window:Bitmap;

	public function new(width:Int = 64, height:Int = 64, title:String = "Window", backColor:Int = 0xFFFFFFFF, isModal:Bool = false){
		super();

		windowWidth = width;
		windowHeight = height;
		titleText = title;

		window = new Bitmap(new BitmapData(width + 2, height + titleHeight + 1, true, 0xFF00CCCC));
		window.bitmapData.fillRect(new Rectangle(1, titleHeight, windowWidth, windowHeight), backColor);

		this.titleLabel = new Label(titleText, titleHeight - 8);
		this.titleLabel.x = 2;
		this.titleLabel.y = 0;

		addChild(window);
		addChild(this.titleLabel);

		this.addEventListener(MouseEvent.MOUSE_DOWN, onMouseDown);
		this.addEventListener(MouseEvent.MOUSE_UP, onMouseUp);
	}

	public function getPosition():Point {
		return new Point(this.x, this.y);
	}

	public function setPosition(pos:Point):Void {
		this.x = pos.x;
		this.y = pos.y;
	}

	public function getLastChild():DisplayObject {
		return this.getChildAt(this.numChildren - 1);
	}

	function onMouseDown(evt:MouseEvent){
		if((stage.mouseX >= this.x && stage.mouseY >= this.y) && (stage.mouseX <= (this.x + windowWidth) && stage.mouseY <= (this.y + titleHeight))) this.startDrag();
	}
	function onMouseUp(evt:MouseEvent){
		this.stopDrag();
		Common.saveWindowPositions();
	}
}