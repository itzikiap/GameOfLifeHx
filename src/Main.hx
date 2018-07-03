package;

import openfl.display.Sprite;
import openfl.Lib;
import openfl.events.Event;

class Main extends Sprite 
{
	var boardDef:Array2d<Int>;
	var boardDisplay:Array2d<Cell>;

	public function new() 
	{
		super();
		
		resetBoard();
		createDisplay();
		
		distributeCells();
		renderDisplay();
		this.addEventListener(Event.ENTER_FRAME, this_enterFrame);
	}
	
	function distributeCells() 
	{
		var cellsCount = Math.floor(Data.DIMENTIONS.x * Data.DIMENTIONS.y / 2);
		for (i in 0...cellsCount) boardDef[getRand()][getRand()] = 1;
	}
	
	inline function getRand():Int 
	{
		return Math.floor(Math.random() * Data.DIMENTIONS.x);
	}
	
	function createDisplay() 
	{
		boardDisplay = new Array2d<Cell>();
		for (i in 0...Data.DIMENTIONS.x) 
		{
			boardDisplay.push([]);
			for (j in 0...Data.DIMENTIONS.y) 
			{
				boardDisplay[i].push(new Cell(i, j));
				this.addChild(boardDisplay[i][j]);
			}
		}
	}
	
	function this_enterFrame(e):Void 
	{
		caluclateBoardStep();
		renderDisplay();
	}
	
	function renderDisplay() 
	{
		for (i in 0...Data.DIMENTIONS.x) 
		{
			for (j in 0...Data.DIMENTIONS.y) 
			{
				boardDisplay[i][j].changeColorIndex(boardDef[i][j]);
			}
		}
		
	}
	
	function caluclateBoardStep() 
	{
		var result:Array2d<Int> = [];
		for (i in 0...Data.DIMENTIONS.x) 
		{
			result[i] = [];
			for (j in 0...Data.DIMENTIONS.y) 
			{
				result[i][j] = checkCell(i, j) ? 1 : 0; 
			}
		}
		boardDef = result;
	}
	
	inline function checkCell(i:Int = 0, j:Int = 0):Bool {
		var sum = 0;
		for (q in -1...1) {
			for (w in -1...1) {
				if (!(q == 0 && w == 0) && checkBounds(i + q, j + w)) sum += boardDef[i + q][j + w];
			}
		}
		return Data.LIFE_RULES.indexOf(sum) > -1;
	}
	
	inline function checkBounds(x:Int, y:Int):Bool 
	{
		return x >= 0 && x <= Data.DIMENTIONS.x && y >= 0 && y <= Data.DIMENTIONS.y;
	}
	
	function resetBoard() {
		boardDef = [for (i in 0...Data.DIMENTIONS.x) [for (j in 0...Data.DIMENTIONS.y) 0]];
	}
}

typedef Array2d<T>=Array<Array<T>>

typedef Point = {
	var x:Int;
	var y:Int;
}