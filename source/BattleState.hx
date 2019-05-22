package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxSubState;
import flixel.effects.FlxFlicker;
import flixel.text.FlxText;
import flixel.util.FlxColor;
import flixel.util.FlxTimer;

/**
 * ...
 * @author ninjamuffin99
 */
class BattleState extends FlxSubState 
{
	public static var outcome:Outcome = NONE;
	private var enemyHP:Int = 10;
	private var playerHP:Int = 10;
	
	private var hud:FlxText;
	private var playerTurn:Bool = true;
	private var enemy:FlxSprite;

	public function new(BGColor:FlxColor=FlxColor.TRANSPARENT) 
	{
		super(BGColor);
		
		outcome = NONE;
	}
	
	override public function create():Void 
	{
		var bg:FlxSprite = new FlxSprite().makeGraphic(FlxG.width, FlxG.height, FlxColor.BLACK);
		bg.alpha = 0.7;
		add(bg);
		
		enemy = new FlxSprite().makeGraphic(100, 100, FlxColor.RED);
		add(enemy);
		enemy.screenCenter();
		
		hud = new FlxText(10, 10, 0, "", 32);
		add(hud);
		
		super.create();
	}
	
	override public function update(elapsed:Float):Void 
	{
		hud.text = "HP: " + playerHP + "\nEnemy HP: " + enemyHP + "Your turn: " + playerTurn;
		
		super.update(elapsed);
		
		if (playerTurn)
		{
			if (FlxG.keys.justPressed.SPACE)
			{
				enemyHP -= FlxG.random.int(1, 3);
				playerTurn = false;
				FlxFlicker.flicker(enemy, 1, 0.04, true, true, function(flk:FlxFlicker)
				{
					new FlxTimer().start(FlxG.random.float(1, 3), function(tmr:FlxTimer)
					{
						playerHP -= FlxG.random.int(0, 2);
						playerTurn = true;
					});
				});
			}
		}
		
		if (enemyHP <= 0 && outcome != VICTORY)
		{
			outcome = VICTORY;
			close();
		}
		if (playerHP <= 0 && outcome != VICTORY)
		{
			outcome = DEFEAT;
			close();
		}
	}
	
}

enum Outcome
{
	NONE;
	ESCAPE;
	VICTORY;//COMPLETION
	DEFEAT;//SUBMISSION
}