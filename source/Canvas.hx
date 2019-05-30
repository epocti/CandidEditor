package;

import lime.ui.MouseCursor;
import openfl.ui.Mouse;
import openfl.events.MouseEvent;
import openfl.events.Event;
import openfl.geom.Rectangle;
import openfl.display.BitmapData;
import openfl.display.Bitmap;
import openfl.display.Sprite;

class Canvas extends Sprite {
	public var canvas:Bitmap;

	var lastMouseX:Int = 0;
	var lastMouseY:Int = 0;
	var mouseIsDown:Bool = false;

	public function new(width:Int, height:Int, initFill:Int = 0xFFFFFFFF){
		super();

		canvas = new Bitmap(new BitmapData(width, height));
		canvas.bitmapData.fillRect(new Rectangle(0, 0, width, height), initFill);
		addChild(canvas);

		addEventListener(Event.ENTER_FRAME, onUpdate);
		addEventListener(MouseEvent.MOUSE_DOWN, onMouseDown);
		addEventListener(MouseEvent.MOUSE_UP, onMouseUp);
		addEventListener(MouseEvent.MOUSE_OVER, onMouseEnter);
		addEventListener(MouseEvent.MOUSE_OUT, onMouseLeave);
	}

	function onUpdate(evt:Event):Void {
		if(mouseIsDown){
			if(Common.currentTool == "brush"){
				drawLine(Std.int(lastMouseX / scaleX), Std.int(lastMouseY / scaleY), Std.int((stage.mouseX - this.x) / scaleX), Std.int((stage.mouseY - this.y) / scaleY), Common.primaryColor);
			}
			else if(Common.currentTool == "paw" && Common.cursorIsOnCanvas){
				// TODO: paw tool will cause windows to stop dragging if moved too fast over the canvas
				this.startDrag();
			}
			lastMouseX = Std.int(stage.mouseX - this.x);
			lastMouseY = Std.int(stage.mouseY - this.y);
		}
		else {
			if(Common.currentTool == "paw" && Common.cursorIsOnCanvas){
				this.stopDrag();
			}
		}
	}

	private function onMouseDown(evt:MouseEvent):Void {
		lastMouseX = Std.int(stage.mouseX - this.x);
		lastMouseY = Std.int(stage.mouseY - this.y);
		mouseIsDown = true;
	}
	private function onMouseUp(evt:MouseEvent):Void {
		mouseIsDown = false;
	}

	// Change mouse cursor on canvas enter/exit
	private function onMouseEnter(evt:MouseEvent):Void {
		Common.cursorIsOnCanvas = true;
		Mouse.cursor = MouseCursor.CROSSHAIR;
	}
	private function onMouseLeave(evt:MouseEvent):Void {
		Common.cursorIsOnCanvas = false;
		Mouse.cursor = MouseCursor.DEFAULT;
	}

	public function onMouseScroll(evt:MouseEvent):Void {
		// Zooming in/out using scroll wheel
		if(evt.delta > 0){
			if(scaleX >= 1 && !(scaleX >= 8)){	// Increase by 25% if larger than 100% and not at 800%
				scaleX += .25;
				scaleY += .25;
			}
			else if(!(scaleX >= 8)){	// Multiply by 2 if smaller than 100%
				scaleX *= 2;
				scaleY *= 2;
			}
		}
		else {
			if(scaleX - .25 >= 1){	// Decrease by 25% if larger than 100%
				scaleX -= .25;
				scaleY -= .25;
			}
			else if((scaleX / 2) >= .125){	// Limit to 12.5%
				scaleX /= 2;
				scaleY /= 2;
			}
		}

		// Filter if the scale is not a round number
		if(Std.int(scaleX) == scaleX && Std.int(scaleY) == scaleY) canvas.smoothing = false;
		else canvas.smoothing = true;

		// Zoom to mouse location
		this.x = Std.int((stage.mouseX) - (this.x));
		this.y = Std.int((stage.mouseY) - (this.y));

		// Update status bar's zoom info
		Common.statusBar.setZoomLevel(scaleX * 100);
	}

	// Canvas dragging (called from Main)
	public function onMouseWheelDown(evt:MouseEvent){
		startDrag();
	}
	public function onMouseWheelUp(evt:MouseEvent){
		stopDrag();
	}

	public function drawLine(x1:Int, y1:Int, x2:Int, y2:Int, color:UInt):Void {
		// delta of exact value and rounded value of the dependant variable
		var d:Int = 0;

		var dy:Int = Std.int(Math.abs(y2 - y1));
		var dx:Int = Std.int(Math.abs(x2 - x1));

		var dy2:Int = (dy << 1); // slope scaling factors to avoid floating
		var dx2:Int = (dx << 1); // point

		var ix:Int = x1 < x2 ? 1 : -1; // increment direction
		var iy:Int = y1 < y2 ? 1 : -1;

		if(dy <= dx){
			while(true){
				canvas.bitmapData.setPixel(x1-1, y1, color);
				canvas.bitmapData.setPixel(x1+1, y1, color);
				canvas.bitmapData.setPixel(x1, y1-1, color);
				canvas.bitmapData.setPixel(x1, y1+1, color);
				canvas.bitmapData.setPixel(x1, y1, color);
				if (x1 == x2) break;
				x1 += ix;
				d += dy2;
				if (d > dx) {
					y1 += iy;
					d -= dx2;
				}
			}
		}
		else {
			while(true){
				canvas.bitmapData.setPixel(x1-1, y1, color);
				canvas.bitmapData.setPixel(x1+1, y1, color);
				canvas.bitmapData.setPixel(x1, y1-1, color);
				canvas.bitmapData.setPixel(x1, y1+1, color);
				canvas.bitmapData.setPixel(x1, y1, color);
				if (y1 == y2) break;
				y1 += iy;
				d += dx2;
				if (d > dy) {
					x1 += ix;
					d -= dy2;
				}
			}
		}
	}
}