package data;

class LevelData
{
	public var minDays:Int;
	public var xDim:Int;
	public var yDim:Int;
	public var tiles:Array<Array<String>>;
	public var extras:Array<ExtraItem>;
	public var flips:Array<Array<Int>>;

	public function new(minDays:Int, xDim:Int, yDim:Int, tiles:Array<Array<String>>, flips:Array<Array<Int>>)
	{
		this.minDays = minDays;
		this.xDim = xDim;
		this.yDim = yDim;
		this.tiles = tiles;
		this.extras = new Array<ExtraItem>();
		this.flips = flips;
	}
}

