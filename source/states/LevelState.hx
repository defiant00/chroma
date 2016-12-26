package states;

import data.*;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.graphics.frames.FlxFramesCollection;
import flixel.math.FlxRect;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.math.FlxMath;
import flixel.util.FlxColor;

class LevelState extends FlxState
{
	public var game:GameData;
	
	var xDim:Int;
	var yDim:Int;
	
	var tileMapSize = 2048;
	var smallTileSize = 32;
	var bigTileSize = 64;
	var numSmallTileRows = 4;
	var numSmallTilesPerRow:Int;
	var numBigTilesPerRow:Int;
	var numBigTileRows = 30;
	var bigTileOffset:Int;

	public function new()
	{
		numSmallTilesPerRow = Std.int(tileMapSize / smallTileSize);
		numBigTilesPerRow = Std.int(tileMapSize / bigTileSize);
		bigTileOffset = numSmallTilesPerRow * numSmallTileRows;
		super();
	}
	
	override public function create():Void
	{
		var tiles = new FlxSprite("assets/images/placeholder_tiles.png");
		var f = new FlxFramesCollection(tiles.graphic);
		
		for (r in 0...numSmallTileRows)
		{
			for (t in 0...numSmallTilesPerRow)
			{
				f.addSpriteSheetFrame(new FlxRect(t * smallTileSize, r * smallTileSize, smallTileSize, smallTileSize));
			}
		}
		for (r in 2...numBigTileRows)
		{
			for (t in 0...numBigTilesPerRow)
			{
				f.addSpriteSheetFrame(new FlxRect(t * bigTileSize, r * bigTileSize, bigTileSize, bigTileSize));
			}
		}
		
		tiles.setFrames(f);
		
		// TODO - Get the actual mission...
		var lvl = game.missions[0].levels[0];
		for (y in 0...lvl.base.length)
		{
			for (x in 0...lvl.base[y].length)
			{
				var s = new FlxSprite(x * 32, y * 32);
				s.loadGraphicFromSprite(tiles);
				s.animation.frameIndex = lvl.base[y][x] + numSmallTilesPerRow;
				add(s);
			}
		}
		
		for (e in lvl.extras)
		{
			var s = new FlxSprite(e.x, e.y);
			s.loadGraphicFromSprite(tiles);
			s.animation.frameIndex = e.id + bigTileOffset;
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
