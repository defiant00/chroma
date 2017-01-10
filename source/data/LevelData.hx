package data;

class LevelData
{
	public var minDays:Int;
	public var xDim:Int;
	public var yDim:Int;
	public var tiles:Array<Array<String>>;
	public var extras:Array<ExtraItem>;

	public function new(minDays:Int, xDim:Int, yDim:Int, tiles:Array<Array<String>>)
	{
		this.minDays = minDays;
		this.xDim = xDim;
		this.yDim = yDim;
		this.tiles = tiles;
		this.extras = new Array<ExtraItem>();
	}
}

