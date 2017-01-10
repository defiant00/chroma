package states;

import data.*;
import flixel.FlxG;
import flixel.FlxState;
import flixel.FlxSprite;
import flixel.graphics.frames.FlxFramesCollection;
import flixel.math.FlxRect;
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
		
		_flag = TileLoader.GetBaseTileSprite(game);
		_flag.animation.play("flag");
		
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
		_flag.setPosition(mission.locX, mission.locY);
		_flag.visible = true;
	}
	
	function outButton(mission:MissionData):Void
	{
		_flag.visible = false;
	}
}