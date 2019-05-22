package;

import flixel.FlxG;
import flixel.FlxObject;
import flixel.FlxSprite;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.system.FlxAssets.FlxGraphicAsset;

/**
 * ...
 * @author ninjamuffin99
 */
class Player extends FlxSprite 
{
	private var speed:Float = 200;

	public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset) 
	{
		super(X, Y, SimpleGraphic);
		
		var tex = FlxAtlasFrames.fromSparrow(AssetPaths.player__png, AssetPaths.player__xml);
		frames = tex;
		
		animation.addByPrefix("walkL", "walk left right", 24);
		animation.play("walkL");
		
		setGraphicSize(Std.int(width * 0.2));
		
		setFacingFlip(FlxObject.LEFT, false, false);
		setFdacingFlip(FlxObject.RIGHT, true, false);
	}
	
	override public function update(elapsed:Float):Void 
	{
		controls();
		
		super.update(elapsed);
	}
	
	private function controls():Void
	{
		if (FlxG.keys.pressed.A)
		{
			velocity.x = -speed;
			facing = FlxObject.RIGHT;
		}
		else if (FlxG.keys.pressed.D)
		{
			velocity.x = speed;
			facing = FlxObject.RIGHT;
		}
		else
			velocity.x = 0;
	}
	
}