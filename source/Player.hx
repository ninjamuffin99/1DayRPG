package;

import flixel.FlxSprite;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.system.FlxAssets.FlxGraphicAsset;

/**
 * ...
 * @author ninjamuffin99
 */
class Player extends FlxSprite 
{

	public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset) 
	{
		super(X, Y, SimpleGraphic);
		
		var tex = FlxAtlasFrames.fromSparrow(AssetPaths.all_moving_animation__png, AssetPaths.all_moving_animation__xml);
		frames = tex;
		
		animation.addByPrefix("walkL", "Symbol 1", 24);
		animation.play("walkL");
		
		setGraphicSize(Std.int(width * 0.2));
	}
	
}