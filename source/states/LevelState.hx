package states;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.math.FlxMath;
import flixel.util.FlxColor;

class LevelState extends FlxState
{
	private var _hilights: Array<Array<FlxSprite>>;

	override public function create():Void
	{
		_hilights = new Array();

		for (x in 0...16)
		{
			var xa = new Array();
			_hilights.push(xa);
			for (y in 0...16)
			{
				var s = new FlxSprite(x * 32, y * 32, "assets/images/placeholder_hilight.png");
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

	private function doMouse():Void
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
}