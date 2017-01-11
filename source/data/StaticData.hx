package data;

class StaticData
{
	public var missions:Array<MissionData>;
	public var animations:Array<Animation>;

	public function new()
	{
		missions = new Array<MissionData>();
		animations = new Array<Animation>();
	}
}