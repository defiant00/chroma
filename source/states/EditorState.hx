package states;

import data.*;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.util.FlxColor;
import flixel.util.FlxSort;
import haxe.Json;
import sys.io.File;

class EditorState extends FlxState
{
	public var state:State;
	var tiles:FlxTypedGroup<FlxSprite>;
	var belowDoodads:FlxTypedGroup<ZSprite>;
	var aboveDoodads:FlxTypedGroup<ZSprite>;
	var indicators:Array<FlxSprite>;
	var indGroup:FlxTypedGroup<FlxSprite>;
	
	var level:LevelData;
	
	override public function create():Void
	{
		// TODO - Get the actual mission...
		level = state.staticData.missions[0].levels[0];
		
		loadSprites();
		
		super.create();
	}

	override public function update(elapsed:Float):Void
	{
		doInput();

		super.update(elapsed);
	}
	
	function loadSprites()
	{
		if (tiles != null)
		{
			remove(tiles);
		}
		if (belowDoodads != null)
		{
			remove(belowDoodads);
		}
		if (aboveDoodads != null)
		{
			remove(aboveDoodads);
		}
		if (indGroup != null)
		{
			remove(indGroup);
		}
		
		indicators = new Array<FlxSprite>();
		
		add(tiles = new FlxTypedGroup<FlxSprite>());
		add(belowDoodads = new FlxTypedGroup<ZSprite>());
		add(aboveDoodads = new FlxTypedGroup<ZSprite>());
		add(indGroup = new FlxTypedGroup<FlxSprite>());
		
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
		
		for (y in 0...level.yDim)
		{
			for (x in 0...level.xDim)
			{
				var s = new FlxSprite(x * 32, y * 32);
				s.loadGraphicFromSprite(baseTile);
				s.animation.play("hash");
				indicators.push(s);
				indGroup.add(s);
			}
		}
		
		updateIndicators();
	}
	
	function updateLevel(newLevel:LevelData)
	{
		// TODO - Set the correct mission and level
		level = newLevel;
		state.staticData.missions[0].levels[0] = level;
		
		loadSprites();
	}

	function doInput():Void
	{
		// Camera scroll
		if (!FlxG.keys.pressed.SHIFT && !FlxG.keys.pressed.CONTROL)
		{
			if (FlxG.keys.pressed.W)
			{
				FlxG.camera.y += state.currentData.scrollRate;
			}
			if (FlxG.keys.pressed.S)
			{
				FlxG.camera.y -= state.currentData.scrollRate;
			}
			if (FlxG.keys.pressed.A)
			{
				FlxG.camera.x += state.currentData.scrollRate;
			}
			if (FlxG.keys.pressed.D)
			{
				FlxG.camera.x -= state.currentData.scrollRate;
			}
		}
		else if (FlxG.keys.pressed.SHIFT)
		{
			var offX:Int = 0;
			var offY:Int = 0;
			
			if (FlxG.keys.justPressed.W)
			{
				offY = -1;
			}
			if (FlxG.keys.justPressed.S)
			{
				offY = 1;
			}
			if (FlxG.keys.justPressed.A)
			{
				offX = -1;
			}
			if (FlxG.keys.justPressed.D)
			{
				offX = 1;
			}
			
			if (offX != 0 || offY != 0)
			{
				var nLevel = new LevelData(level.minDays, level.xDim, level.yDim);
				
				for (y in 0...level.yDim)
				{
					for (x in 0...level.xDim)
					{
						var oldX = x - offX;
						var oldY = y - offY;
						
						var t:Tile = null;
						
						if (oldX > -1 && oldX < level.xDim && oldY > -1 && oldY < level.yDim)
						{
							t = level.getTile(oldX, oldY);
						}
						else
						{
							t = new Tile("pt0", false, false);
						}
						
						nLevel.tiles.push(t);
					}
				}
				
				for (d in level.doodads)
				{
					d.x += offX * 32;
					d.y += offY * 32;
					nLevel.doodads.push(d);
				}
				
				updateLevel(nLevel);
			}
		}
		
		if (FlxG.mouse.justPressed)
		{
			var mx = FlxG.mouse.x >> 5;
			var my = FlxG.mouse.y >> 5;
			
			if (FlxG.keys.pressed.SHIFT)
			{
				// Resize
				var xd = mx + 1;
				var yd = my + 1;
				
				var nLevel = new LevelData(level.minDays, xd, yd);
				
				for (y in 0...yd)
				{
					for (x in 0...xd)
					{
						var t:Tile = null;
						
						if (x < level.xDim && y < level.yDim)
						{
							t = level.getTile(x, y);
						}
						else
						{
							t = new Tile("pt0", false, false);
						}
						nLevel.tiles.push(t);
					}
				}
				
				for (d in level.doodads)
				{
					nLevel.doodads.push(d);
				}
				
				updateLevel(nLevel);
			}
			else if (mx > -1 && mx < level.xDim && my > -1 && my < level.yDim)
			{
				// Edit
				var tile = level.getTile(mx, my);
				if (FlxG.keys.pressed.ONE)
				{
					tile.block = !tile.block;
				}
				if (FlxG.keys.pressed.TWO)
				{
					tile.blockAir = !tile.blockAir;
				}
				
				updateIndicators();
			}
		}
		
		// Save
		if (FlxG.keys.pressed.CONTROL && FlxG.keys.justPressed.S)
		{
			File.saveContent("c:/git/chroma/assets/data/game.json", Json.stringify(state.staticData, "\t"));
		}
	}
	
	function updateIndicators():Void
	{
		for (x in 0...level.xDim)
		{
			for (y in 0...level.yDim)
			{
				var ind = indicators[x + y * level.xDim];
				var tile = level.getTile(x, y);
				
				var c = FlxColor.TRANSPARENT;
				if (tile.block && tile.blockAir)
				{
					c = FlxColor.YELLOW;
				}
				else if (tile.block)
				{
					c = FlxColor.RED;
				}
				else if (tile.blockAir)
				{
					c = FlxColor.BLUE;
				}
				
				if (c != FlxColor.TRANSPARENT)
				{
					ind.color = c;
					ind.visible = true;
				}
				else
				{
					ind.visible = false;
				}
			}
		}
	}
}
