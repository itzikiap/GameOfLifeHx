package;
import openfl.display.Sprite;
import openfl.filters.BitmapFilter;
import openfl.filters.ColorMatrixFilter;

class Cell extends Sprite
{
	var cells:Array<Sprite>;
	
	public function new(i:Int = -1, j:Int = -1)
	{
		super();
		cells = new Array<Sprite>();
		cells.push(createCellGraphics(1));
		cells.push(createCellGraphics(2));
		cells.push(createCellGraphics(3));
		cells.push(createCellGraphics(4));


//		changeColorIndex(4);
		if (i + j >= 0)
		{
			x = i * Data.CELL_WIDTH;
			y = j * Data.CELL_WIDTH;
		}
	}
	
	function createCellGraphics(colorIndex:Int):Sprite 
	{
		var spr = new Sprite();
		spr.graphics.beginFill(Data.COLORS[colorIndex]);
		//trace(Data.COLORS[colorIndex]);
		spr.graphics.drawRect(-Data.CELL_WIDTH / 2, -Data.CELL_WIDTH  / 2, Data.CELL_WIDTH, Data.CELL_WIDTH);
		spr.graphics.endFill();
		spr.cacheAsBitmap = true;
		addChild(spr);
		return spr;
	}

	public function changeColorIndex(index:Int)
	{
		for (i in 0...numChildren) getChildAt(i).visible = (i == index);
	}
}