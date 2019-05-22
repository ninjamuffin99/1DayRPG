package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;

class PlayState extends FlxState
{
	private var _player:Player;
	private var enemyTest:Enemy;
	
	override public function create():Void
	{
		var bg:FlxSprite = new FlxSprite().loadGraphic(AssetPaths.room__png);
		bg.setGraphicSize(FlxG.width, FlxG.height);
		bg.updateHitbox();
		add(bg);
		
		_player = new Player(20, 20);
		add(_player);
		
		enemyTest = new Enemy(500, 300);
		add(enemyTest);
		
		super.create();
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		
		FlxG.overlap(_player, enemyTest, function(p:Player, e:Enemy)
		{
			if (BattleState.outcome != BattleState.Outcome.NONE)
			{
				e.kill();
				BattleState.outcome = BattleState.Outcome.NONE;
			}
			else
			{
				openSubState(new BattleState());
			}
		});  
	}
}
