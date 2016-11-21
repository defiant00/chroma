package states;

import flixel.FlxState;
import flixel.FlxG;
import flixel.input.keyboard.FlxKey;
import flixel.text.FlxText;

class SplashState extends FlxState
{
	var _totalTime: Float;
	
	override public function create():Void
	{
		FlxG.mouse.useSystemCursor = true;

		var t = new FlxText("Deffie Games Presents...");
		t.size = 32;
		t.screenCenter();
		add(t);
		
		_totalTime = 0;

		super.create();
	}

	override public function update(elapsed:Float):Void
	{
		_totalTime += elapsed;
		
		if (_totalTime > 3 || FlxG.mouse.justPressed || FlxG.keys.anyJustPressed([ESCAPE, SPACE, ENTER]))
		{
			FlxG.switchState(new MenuState());
		}

		super.update(elapsed);
	}
}