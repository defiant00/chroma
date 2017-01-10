package data;

class Tile 
{
	public var name:String;
	public var land:Bool;
	public var air:Bool;
	
	public function new(name:String, land:Bool, air:Bool) 
	{
		this.name = name;
		this.land = land;
		this.air = air;
	}
}