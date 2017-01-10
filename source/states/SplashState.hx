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
		
		// Animations
		var aArr:Array<Dynamic> = g.animations;
		for (animation in aArr)
		{
			var a = new Animation(animation.name, animation.indices, animation.frameRate, animation.looped, animation.flipX, animation.flipY);
			_game.animations.push(a);
		}
		
		// Tiles
		var tArr:Array<Dynamic> = g.tiles;
		for (tile in tArr)
		{
			var t = new Tile(tile.name, tile.land, tile.air);
			_game.tiles.push(t);
		}
		
		// Missions
		var mArr:Array<Dynamic> = g.missions;
		for (mission in mArr)
		{
			var m = new MissionData(mission.id, mission.name, mission.description, mission.locX, mission.locY);
			var lArr:Array<Dynamic> = mission.levels;
			for (level in lArr)
			{
				var tiles:Array<Array<String>> = level.tiles;
				
				// [y][x] makes the array readable in json, flip them here so we can use [x][y] in the rest of the code
				var reordered = new Array<Array<String>>();
				for (x in 0...level.xDim)
				{
					reordered.push(new Array<String>());
					for (y in 0...level.yDim)
					{
						reordered[x].push(tiles[y][x]); 
					}
				}
				
				var l = new LevelData(level.minDays, level.xDim, level.yDim, reordered);
				
				var eArr:Array<Dynamic> = level.extras;
				for (extra in eArr)
				{
					l.extras.push(new ExtraItem(extra.name, extra.x, extra.y));
				}
				
				m.levels.push(l);
			}
			_game.missions.push(m);
		}
	}
}
