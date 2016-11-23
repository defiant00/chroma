package states;

import data.*;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.math.FlxMath;
import flash.system.System;

import haxe.Timer;

class MenuState extends FlxState
{
	public var game:GameData;
	
	override public function create():Void
	{
		add(new FlxSprite("assets/images/placeholder_menu_bg.png"));
		
		add(new FlxButton(120, 200, "New Game", clickNewGame));
		add(new FlxButton(120, 240, "Load Game", clickLoadGame));
		add(new FlxButton(120, 280, "Settings", clickSettings));
		add(new FlxButton(120, 320, "Quit", clickQuit));
		
		add(new FlxButton(240, 200, "Recursive", clickRecursive));
		add(new FlxButton(240, 240, "ItShift", clickItShift));
		add(new FlxButton(240, 280, "ItUnshift", clickItUnshift));
		add(new FlxButton(240, 320, "ItList", clickItList));
		
		super.create();
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
	}

	function clickNewGame():Void
	{
		// TODO - substate to get player settings
		
		game.status = new StatusData();
		
		var m = new MapState();
		m.game = game;
		FlxG.switchState(m);
	}
	
	function clickLoadGame():Void
	{
		
	}
	
	function clickSettings():Void
	{
		
	}
	
	function clickQuit():Void
	{
		System.exit(0);
	}
	
	var xDim = 100;
	var yDim = 100;
	var xLoc = 4;
	var yLoc = 4;
	var val = 20;
	var times = 1000;
	
	function clickRecursive():Void
	{
		Timer.measure(recursive);
	}
	
	function recursive():Void
	{
		for (i in 0...times)
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
			
			recurse(status, xLoc, yLoc, val);
		}
	}
	
	function recurse(status:Array<Array<Int>>, x:Int, y:Int, val:Int):Void
	{
		if (x > -1 && y > -1 && x < xDim && y < yDim && status[x][y] < val)
		{
			status[x][y] = val;
			recurse(status, x - 1, y, val - 1);
			recurse(status, x + 1, y, val - 1);
			recurse(status, x, y - 1, val - 1);
			recurse(status, x, y + 1, val - 1);
		}
	}
	
	function clickItShift():Void
	{
		Timer.measure(itShift);
	}
	
	function itShift():Void
	{
		for (i in 0...times)
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
			
			var items = new Array<IterItem>();
			items.push(new IterItem(xLoc, yLoc, val));
			
			while (items.length > 0)
			{
				var item = items.shift();
				
				if (item.x > -1 && item.y > -1 && item.x < xDim && item.y < yDim && status[item.x][item.y] < item.val)
				{
					status[item.x][item.y] = item.val;
					items.push(new IterItem(item.x - 1, item.y, item.val - 1));
					items.push(new IterItem(item.x + 1, item.y, item.val - 1));
					items.push(new IterItem(item.x, item.y - 1, item.val - 1));
					items.push(new IterItem(item.x, item.y + 1, item.val - 1));
				}
			}
		}
	}
	
	function clickItUnshift():Void
	{
		Timer.measure(itUnshift);
	}
	
	function itUnshift():Void
	{
		for (i in 0...times)
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
			
			var items = new Array<IterItem>();
			items.push(new IterItem(xLoc, yLoc, val));
			
			while (items.length > 0)
			{
				var item = items.pop();
				
				if (item.x > -1 && item.y > -1 && item.x < xDim && item.y < yDim && status[item.x][item.y] < item.val)
				{
					status[item.x][item.y] = item.val;
					items.unshift(new IterItem(item.x - 1, item.y, item.val - 1));
					items.unshift(new IterItem(item.x + 1, item.y, item.val - 1));
					items.unshift(new IterItem(item.x, item.y - 1, item.val - 1));
					items.unshift(new IterItem(item.x, item.y + 1, item.val - 1));
				}
			}
		}
	}
	
	function clickItList():Void
	{
		Timer.measure(itList);
	}
	
	function itList():Void
	{
		for (i in 0...times)
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
			
			var items = new List<IterItem>();
			items.add(new IterItem(xLoc, yLoc, val));
			
			while (items.length > 0)
			{
				var item = items.pop();
				
				if (item.x > -1 && item.y > -1 && item.x < xDim && item.y < yDim && status[item.x][item.y] < item.val)
				{
					status[item.x][item.y] = item.val;
					items.add(new IterItem(item.x - 1, item.y, item.val - 1));
					items.add(new IterItem(item.x + 1, item.y, item.val - 1));
					items.add(new IterItem(item.x, item.y - 1, item.val - 1));
					items.add(new IterItem(item.x, item.y + 1, item.val - 1));
				}
			}
		}
	}
}

class IterItem
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