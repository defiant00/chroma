package states;

import data.*;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.util.FlxColor;
import flixel.util.FlxSort;

class LevelState extends FlxState
{
	public var state:State;
	var tiles:FlxTypedGroup<FlxSprite>;
	var characters:FlxTypedGroup<FlxSprite>;
	var belowDoodads:FlxTypedGroup<ZSprite>;
	var aboveDoodads:FlxTypedGroup<ZSprite>;
	
	var level:LevelData;
	
	override public function create():Void
	{
		// TODO - Get the actual mission...
		level = state.staticData.missions[0].levels[0];
		
		add(tiles = new FlxTypedGroup<FlxSprite>());
		add(belowDoodads = new FlxTypedGroup<ZSprite>());
		add(characters = new FlxTypedGroup<FlxSprite>());
		add(aboveDoodads = new FlxTypedGroup<ZSprite>());
		
		var baseTile = TileLoader.GetBaseTileSprite(state.staticData);
		
		for (x in 0...level.xDim)
		{
			for (y in 0...level.yDim)
			{
				var s = new FlxSprite(x * 32, y * 32);
				s.loadGraphicFromSprite(baseTile);
				s.animation.play(level.getTile(x, y).name, -1);
				tiles.add(s);
			}
		}
		
		for (d in level.doodads)
		{
			var s = new ZSprite(d.x, d.y, d.z);
			s.loadGraphicFromSprite(baseTile);
			s.animation.play(d.name, -1);
			(d.z < 0 ? belowDoodads : aboveDoodads).add(s);
		}
		
		belowDoodads.sort(ZSprite.sortByZ);
		aboveDoodads.sort(ZSprite.sortByZ);
		
		super.create();
	}

	override public function update(elapsed:Float):Void
	{
		doInput();

		super.update(elapsed);
	}

	function doInput():Void
	{
		if (FlxG.mouse.justPressed)
		{
			var x = FlxG.mouse.x >> 5;
			var y = FlxG.mouse.y >> 5;
		}
		
		var scrollArea = 64;
		var fixedX = FlxG.mouse.x + FlxG.camera.x;
		var fixedY = FlxG.mouse.y + FlxG.camera.y;
		
		if (FlxG.keys.pressed.UP || FlxG.keys.pressed.W || fixedY < scrollArea)
		{
			FlxG.camera.y += state.currentData.scrollRate;
		}
		if (FlxG.keys.pressed.DOWN || FlxG.keys.pressed.S || (fixedY > 720 - scrollArea))
		{
			FlxG.camera.y -= state.currentData.scrollRate;
		}
		if (FlxG.keys.pressed.LEFT || FlxG.keys.pressed.A || fixedX < scrollArea)
		{
			FlxG.camera.x += state.currentData.scrollRate;
		}
		if (FlxG.keys.pressed.RIGHT || FlxG.keys.pressed.D || (fixedX > 1280 - scrollArea))
		{
			FlxG.camera.x -= state.currentData.scrollRate;
		}
	}
	
	function calculatePathingMap(xLoc:Int, yLoc:Int, val:Int):Array<Array<Int>>
	{
		var status = new Array<Array<Int>>();
		
		for (x in 0...level.xDim)
		{
			var inner = new Array<Int>();
			status.push(inner);
			for (y in 0...level.yDim)
			{
				inner.push(0);
			}
		}
		
		var items = new List<PathingItem>();
		items.add(new PathingItem(xLoc, yLoc, val));
		
		while (items.length > 0)
		{
			var item = items.pop();
			
			if (item.x > -1 && item.y > -1 && item.x < level.xDim && item.y < level.yDim && status[item.x][item.y] < item.val)
			{
				status[item.x][item.y] = item.val;
				items.add(new PathingItem(item.x - 1, item.y, item.val - 1));
				items.add(new PathingItem(item.x + 1, item.y, item.val - 1));
				items.add(new PathingItem(item.x, item.y - 1, item.val - 1));
				items.add(new PathingItem(item.x, item.y + 1, item.val - 1));
			}
		}
		
		return status;
	}
}
