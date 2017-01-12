package data;

class MissionData
{
	public var id:Int;
	public var name:String;
	public var description:String;
	public var locX:Int;
	public var locY:Int;
	public var levels:Array<LevelData>;

	public function new(id:Int, name:String, description:String, locX:Int, locY:Int)
	{
		this.id = id;
		this.name = name;
		this.description = description;
		this.locX = locX;
		this.locY = locY;
		levels = new Array<LevelData>();
	}
}