package;

import openfl.events.MouseEvent;
import openfl.events.Event;
import openfl.geom.Rectangle;
import openfl.geom.Point;
import openfl.display.BitmapData;
import gui.control.Slider;
import gui.control.ImageButton;
import gui.control.BitmapButton;
import gui.Label;

class ColorsWindow extends Window {
	var primaryColorPreview:BitmapButton;
	var secondaryColorPreview:BitmapButton;

	var redSlider:Slider;
	var redLabel:Label;
	var greenSlider:Slider;
	var greenLabel:Label;
	var blueSlider:Slider;
	var blueLabel:Label;

	var swapButton:ImageButton;
	var editingPrimary:Bool = true;

	var mouseIsDownOnSlider = false;

	public function new(){
		super(360, 128, "Colors", 0xFF101010);
		if(Common.preferences.data.lastColorsWindowPos != null) this.setPosition(Common.preferences.data.lastColorsWindowPos);
		else this.setPosition(new Point(0, 180));

		// Secondary color preview/button
		secondaryColorPreview = new BitmapButton(new BitmapData(24, 24));
		secondaryColorPreview.img.bitmapData.fillRect(new Rectangle(0, 0, 24, 24), 0xFFFFFFFF);
		secondaryColorPreview.img.bitmapData.fillRect(new Rectangle(1, 1, 22, 22), Common.secondaryColor);
		secondaryColorPreview.x = 16;
		secondaryColorPreview.y = titleHeight + 16;
		addChild(secondaryColorPreview);
		secondaryColorPreview.addEventListener(MouseEvent.CLICK, onSecondaryColorPreviewClick);

		// Primary color preview/button
		primaryColorPreview = new BitmapButton(new BitmapData(24, 24));
		primaryColorPreview.img.bitmapData.fillRect(new Rectangle(0, 0, 24, 24), 0xFF00CCCC);
		primaryColorPreview.img.bitmapData.fillRect(new Rectangle(1, 1, 22, 22), Common.primaryColor);
		primaryColorPreview.x = 4;
		primaryColorPreview.y = titleHeight + 4;
		addChild(primaryColorPreview);
		primaryColorPreview.addEventListener(MouseEvent.CLICK, onPrimaryColorPreviewClick);
		
		// Red slider
		redSlider = new Slider(255, 255, false, false);
		redSlider.x = 44;
		redSlider.y = titleHeight + 16;
		addChild(redSlider);
		redSlider.addEventListener(MouseEvent.MOUSE_DOWN, onMouseDownOnSlider);
		redSlider.addEventListener(MouseEvent.MOUSE_UP, onMouseUpOnSlider);
		// Red value label
		redLabel = new Label("", 12, 0xFFFFFFFF);
		redLabel.x = redSlider.x + redSlider.width + 2;
		redLabel.y = titleHeight + 6;
		addChild(redLabel);

		// Green slider
		greenSlider = new Slider(255, 255, false, false);
		greenSlider.x = 44;
		greenSlider.y = titleHeight + 32;
		addChild(greenSlider);
		greenSlider.addEventListener(MouseEvent.MOUSE_DOWN, onMouseDownOnSlider);
		greenSlider.addEventListener(MouseEvent.MOUSE_UP, onMouseUpOnSlider);
		// Green value label
		greenLabel = new Label("", 12, 0xFFFFFFFF);
		greenLabel.x = greenSlider.x + greenSlider.width + 2;
		greenLabel.y = titleHeight + 22;
		addChild(greenLabel);

		// Blue slider
		blueSlider = new Slider(255, 255, false, false);
		blueSlider.x = 44;
		blueSlider.y = titleHeight + 48;
		addChild(blueSlider);
		blueSlider.addEventListener(MouseEvent.MOUSE_DOWN, onMouseDownOnSlider);
		blueSlider.addEventListener(MouseEvent.MOUSE_UP, onMouseUpOnSlider);
		// Blue value label
		blueLabel = new Label("", 12, 0xFFFFFFFF);
		blueLabel.x = blueSlider.x + blueSlider.width + 2;
		blueLabel.y = titleHeight + 38;
		addChild(blueLabel);

		// Swap colors button
		swapButton = new ImageButton("assets/ui/colorSwap.png");
		swapButton.x = primaryColorPreview.x + 26;
		swapButton.y = titleHeight + 2;
		addChild(swapButton);
		swapButton.addEventListener(MouseEvent.CLICK, onSwapButtonClick);

		addEventListener(Event.ENTER_FRAME, onUpdate);
	}

	function onUpdate(evt:Event){
		redLabel.setText("R: " + redSlider.getValue());
		greenLabel.setText("G: " + greenSlider.getValue());
		blueLabel.setText("B: " + blueSlider.getValue());

		if(mouseIsDownOnSlider){
			if(editingPrimary){
				Common.primaryColor = (255 & 0xFF) << 24 | (redSlider.getValue() & 0xFF) << 16 | (greenSlider.getValue() & 0xFF) << 8 | (blueSlider.getValue() & 0xFF);
				primaryColorPreview.img.bitmapData.fillRect(new Rectangle(1, 1, 22, 22), Common.primaryColor);
			}
			else {
				Common.secondaryColor = (255 & 0xFF) << 24 | (redSlider.getValue() & 0xFF) << 16 | (greenSlider.getValue() & 0xFF) << 8 | (blueSlider.getValue() & 0xFF);
				secondaryColorPreview.img.bitmapData.fillRect(new Rectangle(1, 1, 22, 22), Common.secondaryColor);
			}
		}
	}

	function onPrimaryColorPreviewClick(evt:MouseEvent){
		redSlider.setValue((Common.primaryColor >> 16) & 0x000000FF);
		greenSlider.setValue((Common.primaryColor >> 8) & 0x000000FF);
		blueSlider.setValue((Common.primaryColor) & 0x000000FF);

		editingPrimary = true;

		primaryColorPreview.img.bitmapData.fillRect(new Rectangle(0, 0, 24, 24), 0xFF00CCCC);
		primaryColorPreview.img.bitmapData.fillRect(new Rectangle(1, 1, 22, 22), Common.primaryColor);
		secondaryColorPreview.img.bitmapData.fillRect(new Rectangle(0, 0, 24, 24), 0xFFFFFFFF);
		secondaryColorPreview.img.bitmapData.fillRect(new Rectangle(1, 1, 22, 22), Common.secondaryColor);
	}
	function onSecondaryColorPreviewClick(evt:MouseEvent){
		redSlider.setValue((Common.secondaryColor >> 16) & 0x000000FF);
		greenSlider.setValue((Common.secondaryColor >> 8) & 0x000000FF);
		blueSlider.setValue((Common.secondaryColor) & 0x000000FF);

		editingPrimary = false;

		primaryColorPreview.img.bitmapData.fillRect(new Rectangle(0, 0, 24, 24), 0xFFFFFFFF);
		primaryColorPreview.img.bitmapData.fillRect(new Rectangle(1, 1, 22, 22), Common.primaryColor);
		secondaryColorPreview.img.bitmapData.fillRect(new Rectangle(0, 0, 24, 24), 0xFF00CCCC);
		secondaryColorPreview.img.bitmapData.fillRect(new Rectangle(1, 1, 22, 22), Common.secondaryColor);
	}

	function onMouseDownOnSlider(evt:MouseEvent){
		mouseIsDownOnSlider = true;
	}
	function onMouseUpOnSlider(evt:MouseEvent){
		mouseIsDownOnSlider = false;
	}

	function onSwapButtonClick(evt:MouseEvent){
		var temp:Int = Common.primaryColor;
		Common.primaryColor = Common.secondaryColor;
		Common.secondaryColor = temp;

		if(editingPrimary){
			onPrimaryColorPreviewClick(null);
		}
		else onSecondaryColorPreviewClick(null);

		//primaryColorPreview.img.bitmapData.fillRect(new Rectangle(1, 1, 22, 22), Common.primaryColor);
		//secondaryColorPreview.img.bitmapData.fillRect(new Rectangle(1, 1, 22, 22), Common.secondaryColor);
	}
}
