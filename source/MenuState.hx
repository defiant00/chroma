package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.math.FlxMath;
import flash.system.System;

class MenuState extends FlxState
{
	override public function create():Void
	{
		FlxG.mouse.useSystemCursor = true;
		FlxG.mouse.visible = true;
		
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

	private function clickNewGame():Void
	{
		FlxG.switchState(new PlayState());
	}
	
	private function clickLoadGame():Void
	{
		
	}
	
	private function clickSettings():Void
	{
		
	}
	
	private function clickQuit():Void
	{
		System.exit(0);
	}
}