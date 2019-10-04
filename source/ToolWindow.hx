package;

import openfl.events.MouseEvent;
import openfl.utils.Assets;
import openfl.geom.Point;
import gui.control.ImageButton;

class ToolWindow extends Window {
	public function new(){
		super(60, 250, "Tools", 0xFF101010);
		if(Common.preferences.data.lastToolWindowPos != null) this.setPosition(Common.preferences.data.lastToolWindowPos);
		else this.setPosition(new Point(0, 22));

		var selToolButton:ImageButton = new ImageButton("assets/icon/toolSelect.png");
		selToolButton.x = 4;
		selToolButton.y = 20;
		addChild(selToolButton);
		selToolButton.addEventListener(MouseEvent.CLICK, onSelToolButtonClick);

		var circleSelToolButton:ImageButton = new ImageButton("assets/icon/toolCircleSelect.png");
		circleSelToolButton.x = 4;
		circleSelToolButton.y = 48;
		addChild(circleSelToolButton);
		circleSelToolButton.addEventListener(MouseEvent.CLICK, onCircleSelToolButtonClick);

		var lassoToolButton:ImageButton = new ImageButton("assets/icon/toolLasso.png");
		lassoToolButton.x = 4;
		lassoToolButton.y = 74;
		addChild(lassoToolButton);
		lassoToolButton.addEventListener(MouseEvent.CLICK, onLassoToolButtonClick);

		var moveToolButton:ImageButton = new ImageButton("assets/icon/toolMove.png");
		moveToolButton.x = 32;
		moveToolButton.y = 20;
		addChild(moveToolButton);
		moveToolButton.addEventListener(MouseEvent.CLICK, onMoveToolButtonClick);

		var moveSelToolButton:ImageButton = new ImageButton("assets/icon/toolMoveSel.png");
		moveSelToolButton.x = 32;
		moveSelToolButton.y = 48;
		addChild(moveSelToolButton);
		moveSelToolButton.addEventListener(MouseEvent.CLICK, onMoveSelToolButtonClick);

		var zoomToolButton:ImageButton = new ImageButton("assets/icon/toolZoom.png");
		zoomToolButton.x = 32;
		zoomToolButton.y = 74;
		addChild(zoomToolButton);
		zoomToolButton.addEventListener(MouseEvent.CLICK, onZoomToolButtonClick);

		var wandToolButton:ImageButton = new ImageButton("assets/icon/toolWand.png");
		wandToolButton.x = 4;
		wandToolButton.y = 102;
		addChild(wandToolButton);
		wandToolButton.addEventListener(MouseEvent.CLICK, onWandToolButtonClick);

		var bucketToolButton:ImageButton = new ImageButton("assets/icon/toolBucket.png");
		bucketToolButton.x = 32;
		bucketToolButton.y = 102;
		addChild(bucketToolButton);
		bucketToolButton.addEventListener(MouseEvent.CLICK, onBucketToolButtonClick);

		var gradientToolButton:ImageButton = new ImageButton("assets/icon/toolGradient.png");
		gradientToolButton.x = 4;
		gradientToolButton.y = 130;
		addChild(gradientToolButton);
		gradientToolButton.addEventListener(MouseEvent.CLICK, onGradientToolButtonClick);

		var eyedropperToolButton:ImageButton = new ImageButton("assets/icon/toolEyedropper.png");
		eyedropperToolButton.x = 32;
		eyedropperToolButton.y = 130;
		addChild(eyedropperToolButton);
		eyedropperToolButton.addEventListener(MouseEvent.CLICK, onEyedropperToolButtonClick);

		var brushToolButton:ImageButton = new ImageButton("assets/icon/toolPaint.png");
		brushToolButton.x = 4;
		brushToolButton.y = 158;
		addChild(brushToolButton);
		brushToolButton.addEventListener(MouseEvent.CLICK, onBrushToolButtonClick);

		var pencilToolButton:ImageButton = new ImageButton("assets/icon/toolPencil.png");
		pencilToolButton.x = 32;
		pencilToolButton.y = 158;
		addChild(pencilToolButton);
		pencilToolButton.addEventListener(MouseEvent.CLICK, onPencilToolButtonClick);

		var eraserToolButton:ImageButton = new ImageButton("assets/icon/toolEraser.png");
		eraserToolButton.x = 4;
		eraserToolButton.y = 186;
		addChild(eraserToolButton);
		eraserToolButton.addEventListener(MouseEvent.CLICK, onEraserToolButtonClick);

		var textToolButton:ImageButton = new ImageButton("assets/icon/toolText.png");
		textToolButton.x = 32;
		textToolButton.y = 186;
		addChild(textToolButton);
		textToolButton.addEventListener(MouseEvent.CLICK, onTextToolButtonClick);

		var lineToolButton:ImageButton = new ImageButton("assets/icon/toolLine.png");
		lineToolButton.x = 4;
		lineToolButton.y = 214;
		addChild(lineToolButton);
		lineToolButton.addEventListener(MouseEvent.CLICK, onLineToolButtonClick);

		var shapeToolButton:ImageButton = new ImageButton("assets/icon/toolShape.png");
		shapeToolButton.x = 32;
		shapeToolButton.y = 214;
		addChild(shapeToolButton);
		shapeToolButton.addEventListener(MouseEvent.CLICK, onShapeToolButtonClick);

		var pawToolButton:ImageButton = new ImageButton("assets/icon/toolPaw.png");
		pawToolButton.x = 4;
		pawToolButton.y = 242;
		addChild(pawToolButton);
		pawToolButton.addEventListener(MouseEvent.CLICK, onPawToolButtonClick);
	}

	function onSelToolButtonClick(evt:MouseEvent){
		updateTool("select", "Rectangular Select");
	}
	function onCircleSelToolButtonClick(evt:MouseEvent){
		updateTool("circleSelect", "Circular Select");
	}
	function onLassoToolButtonClick(evt:MouseEvent){
		updateTool("lasso", "Lasso Select");
	}
	function onMoveToolButtonClick(evt:MouseEvent){
		updateTool("move", "Move");
	}
	function onMoveSelToolButtonClick(evt:MouseEvent){
		updateTool("moveSel", "Move Selection");
	}
	function onZoomToolButtonClick(evt:MouseEvent){
		updateTool("zoom", "Zoom Tool");
	}
	function onWandToolButtonClick(evt:MouseEvent){
		updateTool("wand", "Wand Select");
	}
	function onBucketToolButtonClick(evt:MouseEvent){
		updateTool("bucket", "Fill Bucket");
	}
	function onGradientToolButtonClick(evt:MouseEvent){
		updateTool("gradient", "Gradient Tool");
	}
	function onEyedropperToolButtonClick(evt:MouseEvent){
		updateTool("eyedropper", "Eyedropper");
	}
	function onBrushToolButtonClick(evt:MouseEvent){
		updateTool("brush", "Brush");
	}
	function onPencilToolButtonClick(evt:MouseEvent){
		updateTool("pencil", "Pen");
	}
	function onEraserToolButtonClick(evt:MouseEvent){
		updateTool("eraser", "Eraser");
	}
	function onTextToolButtonClick(evt:MouseEvent){
		updateTool("text", "Text Tool");
	}
	function onLineToolButtonClick(evt:MouseEvent){
		updateTool("line", "Line Tool");
	}
	function onShapeToolButtonClick(evt:MouseEvent){
		updateTool("shape", "Shape Tool");
	}
	function onPawToolButtonClick(evt:MouseEvent){
		updateTool("paw", "Paw Tool");
	}

	function updateTool(id:String, name:String):Void {
		if(!Common.modalWindowOpen){
			Common.currentTool = id;
			Common.statusBar.updateTool(name);
		}
	}
}