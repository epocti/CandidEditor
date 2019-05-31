package;

import openfl.events.MouseEvent;
import openfl.display.Bitmap;
import openfl.events.Event;
import openfl.events.KeyboardEvent;
import openfl.display.BitmapData;
import openfl.display.Sprite;
import openfl.net.SharedObject;
import views.*;
import lime.app.Application;

class Main extends Sprite {
	var background:Bitmap;

	public function new(){
		super();
		// Initialize/load the preferences file
		Common.preferences = SharedObject.getLocal("cePrefs");
		
		// Background
		background = new Bitmap(new BitmapData(1, 1));
		background.bitmapData.setPixel(0, 0, 0x222222);
		background.x = 0;
		background.y = 0;
		background.scaleX = stage.stageWidth;
		background.scaleY = stage.stageHeight;
		addChild(background);

		Common.canvas = new Canvas(800, 600);

		trace("Init resolution: "+ stage.stageWidth + ", " + stage.stageHeight);
		trace("Init scale: " + stage.window.scale);

		stage.frameRate = 60;
		stage.color = 0x222222;

		if(Common.preferences.data.lastWindowWidth != null && Common.preferences.data.lastWindowHeight != null) stage.window.resize(Common.preferences.data.lastWindowWidth, Common.preferences.data.lastWindowHeight);
		if(Common.preferences.data.lastWindowX != null && Common.preferences.data.lastWindowY != null) stage.window.move(Common.preferences.data.lastWindowX, Common.preferences.data.lastWindowY);
		
		// Canvas
		addChild(Common.canvas);
		// Center canvas
		Common.canvas.x = Std.int((stage.stageWidth / 2) - (Common.canvas.width / 2));
		Common.canvas.y = Std.int((stage.stageHeight / 2) - (Common.canvas.height / 2));

		// Tool Window
		Common.toolWindow = new ToolWindow();
		addChild(Common.toolWindow);

		// Colors Window
		Common.colorsWindow = new ColorsWindow();
		//Common.colorsWindow.y = 180;
		addChild(Common.colorsWindow);

		// New Canvas Window
		//Common.newCanvasWindow = new NewCanvasWindow();
		//addChild(Common.newCanvasWindow);

		// Menu
		Common.menuWindow = new MenuWindow(stage.stageWidth);
		addChild(Common.menuWindow);

		// Status bar
		Common.statusBar = new StatusBar(stage.stageWidth, stage.stageHeight);
		addChild(Common.statusBar);

		// Create listeners
		stage.addEventListener(Event.RESIZE, onWindowResize);
		Application.current.window.onMove.add(onWindowMove);
		addEventListener(MouseEvent.MOUSE_WHEEL, onMouseScroll);
		addEventListener(MouseEvent.MIDDLE_MOUSE_DOWN, onMouseWheelDown);
		addEventListener(MouseEvent.MIDDLE_MOUSE_UP, onMouseWheelUp);
		stage.addEventListener(KeyboardEvent.KEY_DOWN, onKeyDown);
		stage.addEventListener(KeyboardEvent.KEY_UP, onKeyUp);
		stage.addEventListener(Event.CLOSE, onApplicationClose);
	}

	private function onWindowResize(evt:Event):Void {
		// Rescale background
		background.scaleX = stage.stageWidth;
		background.scaleY = stage.stageHeight;
		// Update menu/status bar
		Common.menuWindow.update(stage.stageWidth);
		Common.statusBar.update(stage.stageWidth, stage.stageHeight);
		// Set preference for last size
		Common.preferences.data.lastWindowWidth = stage.stageWidth;
		Common.preferences.data.lastWindowHeight = stage.stageHeight;
		
	}

	private function onWindowMove(x:Float, y:Float){
		// Set preference for last window coordinates
		Common.preferences.data.lastWindowX = stage.window.x;
		Common.preferences.data.lastWindowY = stage.window.y;
	}

	// Keyboard shortcut handling
	function onKeyDown(evt:KeyboardEvent){
		ShortcutHandler.onKeyDown(evt);
	}
	function onKeyUp(evt:KeyboardEvent){
		ShortcutHandler.onKeyUp(evt);
	}

	// Global canvas moving and zooming
	function onMouseScroll(evt:MouseEvent){
		Common.canvas.onMouseScroll(evt);
	}
	function onMouseWheelDown(evt:MouseEvent){
		Common.canvas.onMouseWheelDown(evt);
	}
	function onMouseWheelUp(evt:MouseEvent){
		Common.canvas.onMouseWheelUp(evt);
	}

	function onApplicationClose(evt:Event){
		// Save preferences
		Common.preferences.flush();
	}
}