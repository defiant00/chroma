package data;

class Tile 
{
	public var name:String;
	public var block:Bool;
	public var blockAir:Bool;
	
	public function new(name:String, block:Bool, blockAir:Bool)
	{
		this.name = name;
		this.block = block;
		this.blockAir = blockAir;
	}
}