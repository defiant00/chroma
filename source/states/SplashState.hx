package states;

import data.*;
import flixel.FlxState;
import flixel.FlxG;
import flixel.input.keyboard.FlxKey;
import flixel.text.FlxText;
import haxe.Json;
import sys.io.File;

class SplashState extends FlxState
{
	var _totalTime:Float;
	var _game:GameData;

	override public function create():Void
	{
		FlxG.mouse.useSystemCursor = true;

		var t = new FlxText("Deffie Games Presents...");
		t.size = 32;
		t.screenCenter();
		add(t);

		_totalTime = 0;

		loadGameData();

		super.create();
	}

	override public function update(elapsed:Float):Void
	{
		_totalTime += elapsed;

		if (_totalTime > 3 || FlxG.mouse.justPressed || FlxG.keys.anyJustPressed([ESCAPE, SPACE, ENTER]))
		{
			var m = new MenuState();
			m.game = _game;
			FlxG.switchState(m);
		}

		super.update(elapsed);
	}

	function loadGameData():Void
	{
		_game = new GameData();
		var g = Json.parse(File.getContent("assets/data/game.json"));
		var mArr:Array<Dynamic> = g.missions;
		for (mission in mArr)
		{
			var m = new MissionData(mission.id, mission.name, mission.description, mission.locX, mission.locY);
			var lArr:Array<Dynamic> = mission.levels;
			for (level in lArr)
			{
				var l = new LevelData(level.minDays, level.mapCode);
				m.levels.push(l);
			}
			_game.missions.push(m);
		}
	}
}
