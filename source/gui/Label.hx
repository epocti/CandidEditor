package gui;

import openfl.text.TextFormat;
import openfl.text.TextFieldAutoSize;
import openfl.text.TextField;
import openfl.text.TextFieldType;
import openfl.display.Sprite;

class Label extends Sprite {
	var textField:TextField;
	var formatting:TextFormat;

	public function new(text:String = "Label", size:Int = 16, color:Int = 0xFF000000, font:String = "Nunito Regular", bold:Bool = false, italic:Bool = false, underline:Bool = false){
		super();
		formatting = new TextFormat(font, size, color, bold, italic, underline);

		textField = new TextField();
		textField.defaultTextFormat = formatting;
		textField.selectable = false;
		textField.autoSize = TextFieldAutoSize.LEFT;
		textField.text = text;
		addChild(textField);
	}

	function updateFormatting():Void {
		textField.defaultTextFormat = formatting;
	}

	public function setSize(newSize:Int):Void {
		formatting.size = newSize;
		updateFormatting();
	}

	public function getText():String {
		return textField.text;
	}

	public function setText(newText:String){
		textField.text = newText;
	}

	public function enableEditing(){
		textField.selectable = true;
		textField.type = TextFieldType.INPUT;
	}
}
