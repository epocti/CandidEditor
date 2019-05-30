package ;

import openfl.events.KeyboardEvent;

class ShortcutHandler {
    public static function onKeyDown(evt:KeyboardEvent):Void {
        if(evt.controlKey || evt.commandKey){
			Common.controlKeyDown = true;
		}
		if(Common.controlKeyDown){
			if(evt.keyCode == 80){
                ActionHandler.printCanvas();
			}
		}
    }
    public static function onKeyUp(evt:KeyboardEvent):Void {
        if(!evt.controlKey || !evt.commandKey){
			Common.controlKeyDown = false;
		}
    }
}