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

    public static function printCanvas():Void {
        if(PrintJob.isSupported){
            trace("Show print dialog.");
            var printJob:PrintJob = new PrintJob();
            if(printJob.start()){
                try {
                    printJob.addPage(Common.canvas);
                    printJob.send();
                } catch(e:Dynamic) {
                    lime.app.Application.current.window.alert("An error ocurred while printing.\n" + e.toString(), "Print Error");
                }
            }
        }
        else {
            lime.app.Application.current.window.alert("Unfortunately, printing is currently not supported on this system.", "Print Error");
            trace("Printing is unsupported on this system!");
        }
    }
}