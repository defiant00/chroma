package states;

import flixel.FlxState;
import flixel.FlxSprite;

class MapState extends FlxState
{
	public var Player:Player;

	override public function create():Void
	{
		add(new FlxSprite("assets/images/placeholder_map_bg.png"));

		super.create();
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
	}
}