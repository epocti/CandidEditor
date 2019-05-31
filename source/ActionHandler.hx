package ;

import openfl.printing.PrintJob;
import lime.ui.FileDialog;
import lime.utils.Resource;

class ActionHandler {
    public static function save():Void {
        var saveDialog:FileDialog = new FileDialog();
		saveDialog.save(new Resource(), "png", null, "Save Image");
    }

    public static function saveAs():Void {
        var saveDialog:FileDialog = new FileDialog();
		saveDialog.save(new Resource(), "png", null, "Save As Image");
    }

    public static function open():Void {
        var openDialog:FileDialog = new FileDialog();
		openDialog.open("png", null, "Open Image");
    }
}