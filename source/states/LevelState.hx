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
	
	var _hilights:Array<Array<FlxSprite>>;
	var xDim = 100;
	var yDim = 100;

	override public function create():Void
	{
		_hilights = new Array();

		for (x in 0...16)
		{
			var xa = new Array();
			_hilights.push(xa);
			for (y in 0...16)
			{
				var s = new FlxSprite(x * 32, y * 32);
				s.loadGraphic("assets/images/placeholder_tiles.png", true, 32, 32);
				s.visible = false;
				xa.push(s);
				add(s);
			}
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

			if (x > -1 && x < 16 && y > -1 && y < 16)
			{
				_hilights[x][y].visible = !_hilights[x][y].visible;
			}
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

class PathingItem
{
	public var x:Int;
	public var y:Int;
	public var val:Int;
	
	public function new(x:Int, y:Int, val:Int)
	{
		this.x = x;
		this.y = y;
		this.val = val;
	}
}