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
	var _state:State;

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
			m.state = _state;
			FlxG.switchState(m);
		}

		super.update(elapsed);
	}

	function loadGameData():Void
	{
		_state = new State();
		var stat = new StaticData();
		_state.staticData = stat;
		var g = Json.parse(File.getContent("assets/data/game.json"));
		
		// Animations
		var aArr:Array<Dynamic> = g.animations;
		for (animation in aArr)
		{
			var a = new Animation(animation.name, animation.indices, animation.frameRate, animation.looped, animation.flipX, animation.flipY);
			stat.animations.push(a);
		}
		
		// Missions
		var mArr:Array<Dynamic> = g.missions;
		for (mission in mArr)
		{
			var m = new MissionData(mission.id, mission.name, mission.description, mission.locX, mission.locY);
			var lArr:Array<Dynamic> = mission.levels;
			for (level in lArr)
			{
				var l = new LevelData(level.minDays, level.xDim, level.yDim);
				
				var tArr:Array<Dynamic> = level.tiles;
				for (tile in tArr)
				{
					l.tiles.push(new Tile(tile.name, tile.block, tile.blockAir));
				}
				
				var dArr:Array<Dynamic> = level.doodads;
				for (doodad in dArr)
				{
					l.doodads.push(new Doodad(doodad.name, doodad.x, doodad.y, doodad.z));
				}
				
				m.levels.push(l);
			}
			stat.missions.push(m);
		}
	}
}
