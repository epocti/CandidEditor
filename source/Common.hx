package;

import openfl.net.SharedObject;
import views.*;

class Common {
	public static var preferences:SharedObject;
	public static var currentTool:String = "brush";

	public static var cursorIsOnCanvas:Bool = false;

	public static var canvas:Canvas;
	public static var toolWindow:Window;
	public static var colorsWindow:Window;
	public static var newCanvasWindow:Window;
	public static var menuWindow:MenuWindow;

	public static var statusBar:StatusBar;

	public static var primaryColor:Int = 0xFF000000;
	public static var secondaryColor:Int = 0xFFFFFFFF;

	public static var controlKeyDown:Bool = false;
	public static var mouseWheelZooms:Bool = true;

	public static function saveWindowPositions():Void {
		preferences.data.lastToolWindowPos = toolWindow.getPosition();
		preferences.data.lastColorsWindowPos = colorsWindow.getPosition();
		preferences.data.lastNewCanvasWindowPos = newCanvasWindow.getPosition();
	}
}
