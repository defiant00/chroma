package states;

import data.*;
import flixel.FlxG;
import flixel.FlxState;
import flixel.FlxSprite;
import flixel.ui.FlxButton;
import openfl.display.Tilesheet;

class MapState extends FlxState
{
	public var game:GameData;
	
	var _flag:FlxSprite;

	override public function create():Void
	{
		add(new FlxSprite("assets/images/placeholder_map_bg.png"));
		
		var y = 200;
		for (m in game.missions)
		{
			var b = new FlxButton(800, y, m.name, selectMission.bind(m));
			b.onOver.callback = overButton.bind(m);
			b.onOut.callback = outButton.bind(m);
			add(b);
			y += 40;
		}
		
		_flag = new FlxSprite();
		_flag.loadGraphic("assets/images/placeholder_tiles.png", true, 32, 32);
		_flag.animation.frameIndex = 1;
		
		_flag.visible = false;
		add(_flag);

		super.create();
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
	}
	
	function selectMission(mission:MissionData):Void
	{
		var l = new LevelState();
		l.game = game;
		FlxG.switchState(l);
	}
	
	function overButton(mission:MissionData):Void
	{
		_flag.setPosition(mission.location.x, mission.location.y);
		_flag.visible = true;
	}
	
	function outButton(mission:MissionData):Void
	{
		_flag.visible = false;
	}
}