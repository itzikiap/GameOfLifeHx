package;
import openfl.display.Sprite;
import openfl.filters.BitmapFilter;
import openfl.filters.ColorMatrixFilter;

class Cell extends Sprite
{
	static inline var SIZE:Float = 20;

	public function new(i:Int = -1, j:Int = -1)
	{
		super();
		this.graphics.beginFill(0x777777);
		this.graphics.drawRect(-SIZE / 2, -SIZE / 2, SIZE, SIZE);
		this.graphics.endFill();

		if (i + j >= 0)
		{
			x = i * SIZE;
			y = j * SIZE;
		}
	}

	public function changeColorIndex(index:Int)
	{
		//this.set_filters([new ColorMatrixFilter([index, index, index, index])]);
	}

}