package ;

import openfl.events.KeyboardEvent;

class ShortcutHandler {
	public static function onKeyDown(evt:KeyboardEvent):Void {
		// Modifier checks
		if(evt.controlKey || evt.commandKey){
			Common.controlKeyDown = true;
		}
		if(evt.shiftKey){
			Common.shiftKeyDown = true;
		}

		// Shortcuts with ctrl/cmd + shift
		if(Common.controlKeyDown && Common.shiftKeyDown){
			if(evt.keyCode == 83){
				ActionHandler.saveAs();
			}
		}
		// Shortcuts with only ctrl/cmd
		else if(Common.controlKeyDown){
			if(evt.keyCode == 83){	// CTRL+S - Save
				ActionHandler.save();
			}
			else if(evt.keyCode == 79){	// CTRL+O - Open
				ActionHandler.open();
			}
		}
	}
	
	public static function onKeyUp(evt:KeyboardEvent):Void {
		// Modifier checks
		if(!evt.controlKey || !evt.commandKey){
			Common.controlKeyDown = false;
		}
		if(!evt.shiftKey){
			Common.shiftKeyDown = false;
		}
	}
}