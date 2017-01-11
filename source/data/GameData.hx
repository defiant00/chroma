package data;

class GameData
{
	public var status:StatusData;
	public var missions:Array<MissionData>;
	public var animations:Array<Animation>;
	public var tileblock:Map<String, Bool>;

	public function new()
	{
		missions = new Array<MissionData>();
		animations = new Array<Animation>();
		tileblock = new Map<String, Bool>();
	}
}