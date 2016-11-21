package states;

import data.*;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.math.FlxMath;
import flash.system.System;

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
}