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
	public static var hp:Int = 10;

	public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset) 
	{
		super(X, Y, SimpleGraphic);
		
		var tex = FlxAtlasFrames.fromSparrow(AssetPaths.all_animations_player__png, AssetPaths.all_animations_player__xml);
		frames = tex;
		
		animation.addByPrefix("walkL", "walk_left_right", 24);
		animation.addByPrefix("walkUp", "walking_up ", 24);
		animation.addByPrefix("walkDown", "walk_down", 24);
		
		animation.addByPrefix("idleUp", "backward_idle");
		animation.addByPrefix("idleDown", "idle_forward ");
		animation.addByPrefix("idleL", "left_right_idle");
		animation.play("walkL");
		
		setGraphicSize(Std.int(width * 0.4));
		
		setFacingFlip(FlxObject.LEFT, false, false);
		setFacingFlip(FlxObject.RIGHT, true, false);
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
			facing = FlxObject.LEFT;
		}
		else if (FlxG.keys.pressed.D)
		{
			velocity.x = speed;
			facing = FlxObject.RIGHT;
		}
		else
			velocity.x = 0;
		
		if (FlxG.keys.pressed.W)
		{
			facing = FlxObject.UP;
			velocity.y = -speed;
		}
		else if (FlxG.keys.pressed.S)
		{
			facing = FlxObject.DOWN;
			velocity.y = speed;
		}
		else
			velocity.y = 0;
		
		switch(facing)
		{
			case FlxObject.LEFT:
				animation.play("walkL");
			case FlxObject.RIGHT:
				animation.play("walkL");
			case FlxObject.DOWN:
				animation.play("walkDown");
			case FlxObject.UP:
				animation.play("walkUp");
		}
		
		if (velocity.x == 0 && velocity.y == 0)
		{
			switch(facing)
			{
				case FlxObject.LEFT:
					animation.play("idleL");
				case FlxObject.RIGHT:
					animation.play("idleL");
				case FlxObject.DOWN:
					animation.play("idleDown");
				case FlxObject.UP:
					animation.play("idleUp");
			}
		}
	}
	
}