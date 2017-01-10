package states;

import data.*;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.math.FlxMath;
import flixel.util.FlxColor;

class LevelState extends FlxState
{
	public var game:GameData;
	
	var xDim:Int;
	var yDim:Int;
	
	override public function create():Void
	{
		var tiles = TileLoader.GetBaseTileSprite(game);
		
		// TODO - Get the actual mission...
		var lvl = game.missions[0].levels[0];
		for (x in 0...lvl.xDim)
		{
			for (y in 0...lvl.yDim)
			{
				var s = new FlxSprite(x * 32, y * 32);
				s.loadGraphicFromSprite(tiles);
				s.animation.play(lvl.tiles[x][y]);
				add(s);
			}
		}
		
		for (e in lvl.extras)
		{
			var s = new FlxSprite(e.x, e.y);
			s.loadGraphicFromSprite(tiles);
			s.animation.play(e.name);
			add(s);
		}
		
		super.create();
	}

	override public function update(elapsed:Float):Void
	{
		doMouse();

		super.update(elapsed);
	}

	function doMouse():Void
	{
		if (FlxG.mouse.justPressed)
		{
			var x = FlxG.mouse.screenX >> 5;
			var y = FlxG.mouse.screenY >> 5;
		}
	}
	
	function calculatePathingMap(xLoc:Int, yLoc:Int, val:Int):Array<Array<Int>>
	{
		var status = new Array<Array<Int>>();
		
		for (x in 0...xDim)
		{
			var inner = new Array<Int>();
			status.push(inner);
			for (y in 0...yDim)
			{
				inner.push(0);
			}
		}
		
		var items = new List<PathingItem>();
		items.add(new PathingItem(xLoc, yLoc, val));
		
		while (items.length > 0)
		{
			var item = items.pop();
			
			if (item.x > -1 && item.y > -1 && item.x < xDim && item.y < yDim && status[item.x][item.y] < item.val)
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
