package data;

class GameData
{
	public var status:StatusData;
	public var missions:Array<MissionData>;
	public var animations:Array<Animation>;
	public var tiles:Array<Tile>;

	public function new()
	{
		missions = new Array<MissionData>();
		animations = new Array<Animation>();
		tiles = new Array<Tile>();
	}
}