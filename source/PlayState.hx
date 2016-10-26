package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.math.FlxMath;

class PlayState extends FlxState
{
	private var _hilights: Array<Array<FlxSprite>>;

	override public function create():Void
	{
		//FlxG.mouse.visible = false;

		_hilights = new Array();

		for (x in 0...16)
		{
			var xa = new Array();
			_hilights.push(xa);
			for (y in 0...16)
			{
				var s = new FlxSprite(x * 64, y * 64, "assets/images/hilight.png");
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
			var x = Std.int(FlxG.mouse.screenX / 64);
			var y = Std.int(FlxG.mouse.screenY / 64);

			trace(x + ", " + y);

			if (x > -1 && x < 16 && y > -1 && y < 16)
			{
				_hilights[x][y].visible = !_hilights[x][y].visible;
			}
		}
	}
}