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
	public var game:GameData;
	var tiles:FlxTypedGroup<FlxSprite>;
	var characters:FlxTypedGroup<FlxSprite>;
	var extras:Array<FlxTypedGroup<FlxSprite>>;
	
	var level:LevelData;
	var collisionMap:Array<Array<Bool>>;
	
	override public function create():Void
	{
		// TODO - Get the actual mission...
		level = game.missions[0].levels[0];
		calculateCollisionMap();
		
		add(tiles = new FlxTypedGroup<FlxSprite>());
		var t = TileLoader.GetBaseTileSprite(game);
		
		for (x in 0...level.xDim)
		{
			for (y in 0...level.yDim)
			{
				var s = new FlxSprite(x * 32, y * 32);
				s.loadGraphicFromSprite(t);
				s.animation.play(level.tiles[x][y], -1);
				tiles.add(s);
			}
		}
		
		var maxZ = -1;
		for (e in level.extras)
		{
			if (maxZ < e.z)
			{
				maxZ = e.z;
			}
		}
		
		if (maxZ > -1)
		{
			extras = new Array<FlxTypedGroup<FlxSprite>>();
			for (i in 0...(maxZ + 1))
			{
				extras.push(new FlxTypedGroup<FlxSprite>());
			}
			
			for (e in level.extras)
			{
				var s = new FlxSprite(e.x, e.y);
				s.loadGraphicFromSprite(t);
				s.animation.play(e.name, -1);
				extras[e.z].add(s);
			}
			
			extras[0].sort(FlxSort.byY);
			add(extras[0]);
		}
		add(characters = new FlxTypedGroup<FlxSprite>());
		for (i in 1...(maxZ + 1))
		{
			extras[i].sort(FlxSort.byY);
			add(extras[i]);
		}
		
		// Display collision map (debug purposes only)
		if (true)
		{
			for (x in 0...level.xDim)
			{
				for (y in 0...level.yDim)
				{
					if (collisionMap[x][y])
					{
						var s = new FlxSprite(x * 32, y * 32);
						s.loadGraphicFromSprite(t);
						s.color = FlxColor.RED;
						s.animation.play("hash");
						add(s);
					}
				}
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
		}
	}
	
	function calculateCollisionMap():Void
	{
		collisionMap = new Array<Array<Bool>>();
		for (x in 0...level.xDim)
		{
			collisionMap.push(new Array<Bool>());
			for (y in 0...level.yDim)
			{
				collisionMap[x].push(game.tileblock[level.tiles[x][y]]);
			}
		}
		
		for (f in level.flips)
		{
			collisionMap[f[0]][f[1]] = !collisionMap[f[0]][f[1]];
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
