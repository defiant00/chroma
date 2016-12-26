package data;

class LevelData
{
	public var minDays:Int;
	public var xDim:Int;
	public var yDim:Int;
	public var base:Array<Array<Int>>;
	public var extras:Array<ExtraItem>;

	public function new(minDays:Int, xDim:Int, yDim:Int, base:Array<Array<Int>>)
	{
		this.minDays = minDays;
		this.xDim = xDim;
		this.yDim = yDim;
		this.base = base;
		this.extras = new Array<ExtraItem>();
	}
}

