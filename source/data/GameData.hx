package data;

class GameData
{
	public var status:StatusData;
	public var missions:Array<MissionData>;

	public function new()
	{
		missions = new Array<MissionData>();
	}
}