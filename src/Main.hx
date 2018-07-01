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
		
		//this.addEventListener(Event.ENTER_FRAME, this_enterFrame);
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
		var result:Array2d<Int> = [[]];
				
		for (i in 0...Data.DIMENTIONS.x) 
		{
			for (j in 0...Data.DIMENTIONS.y) 
			{
				result[i][j] = checkCell(i, j) ? 1 : 0; 
			}
		}
	}
	
	function checkCell(x:Int = 0, y:Int = 0):Bool {
		var sum = 0;
		for (i in -1...1) {
			for (j in -1...1) {
				if (i + j != 0) sum += boardDef[x + i][y + j];
			}
		}
		return Data.LIFE_RULES.indexOf(sum) > -1;
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