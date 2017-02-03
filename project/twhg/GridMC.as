import flash.display.BitmapData;
import flash.geom.Point;
class GridMC extends MovieClip
{
	
	private var bmp		:BitmapData;
	private var _point	:Point = null;
	public function GridMC()
	{
		Stage.addListener(this);		
		
	}
	public function loadBitmap(_linkID:String):Void
	{
		bmp = BitmapData.loadBitmap(_linkID);
		onResize();
	}
	public function onResize():Void
	{
		drawSquare(this, 0, 0, Stage.width, Stage.height);
		if(_point != null)
		{
			align = _point;
		}
	}
	public function set align(_point:Point):Void
	{		
		this._point = _point
		this.globalToLocal(this._point);
		this._x = this._point.x
		this._y = this._point.y
	}
	private function drawSquare(target:MovieClip, x1, y1, x2, y2):Void
	{
		target.clear();
		target.beginBitmapFill(bmp);
		target.moveTo(x1,y1);
		target.lineTo(x2,y1);
		target.lineTo(x2,y2);
		target.lineTo(x1,y2);
		target.lineTo(x1,y1);
		target.endFill();
	}
}