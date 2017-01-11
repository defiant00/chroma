package data;

class LevelData
{
	public var minDays:Int;
	public var xDim:Int;
	public var yDim:Int;
	public var tiles:Array<Tile>;
	public var doodads:Array<Doodad>;

	public function new(minDays:Int, xDim:Int, yDim:Int)
	{
		this.minDays = minDays;
		this.xDim = xDim;
		this.yDim = yDim;
		this.tiles = new Array<Tile>();
		this.doodads = new Array<Doodad>();
	}
	
	public inline function getTile(x:Int, y:Int):Tile
	{
		return tiles[x + y * xDim];
	}
}

