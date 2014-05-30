package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.util.FlxRandom;

class Leaf extends Bit
{
	public var falling:Bool = false;
	
	/**
	 * A leaf, usually added as part of the PlayState's FlxTypedGroup Leaves.
	 * 
	 * @param	X
	 * @param	Y
	 * @param	Weight
	 */
	public function new( X:Int, Y:Int, Weight:Int )
	{
		super( X, Y, Weight, Reg.leafColor() );
	}
	
	override public function reset( X:Float, Y:Float ):Void
	{
		super.reset( X, Y );
		falling = true;
		revive();
	}
	
	override public function push( Force:Float ):Void
	{
		super.push( Force );
		
		if ( !falling )
		{
			acceleration.y = _weight * 15;
			
			if ( x > -50 && x < FlxG.width + 50 )
			{
				velocity.x *= FlxRandom.floatRanged( 0.65, 0.95 );
				
				if ( Math.abs( velocity.x ) > 2 && FlxRandom.chanceRoll( 1 ) )
				{
					velocity.y = -velocity.y * FlxRandom.floatRanged( 0.5, 0.75 );
					falling = true;
				}
			}
		}
		else
		{
			if ( FlxRandom.chanceRoll( 20 ) && velocity.x != 0 )
			{
				if ( Math.abs( velocity.x ) > 2 )
				{
					if ( FlxRandom.chanceRoll( 1 ) )
					{
						falling = true;
						solid = true;
					}
					else
					{
						x = _initialPoint.x + ( absVelocity.x * 2 );
					}
				}
				else
				{
					x = _initialPoint.x + ( direction * absVelocity.x );
				}
			}
			else
			{
				x = _initialPoint.x;
				y = _initialPoint.y;
			}
		}
		/*else
		{
			acceleration.y = _weight * 5;
			velocity.x = ( _direction * _movement * FlxRandom.floatRanged( 0.85, 1.15 ) ) + FlxRandom.intRanged( -2, 2 );
			velocity.y += _movement * 0.5 * FlxRandom.floatRanged( -0.15, 0.15 ) * FlxRandom.sign();
		}*/
		
		if ( x < -5 || x > FlxG.width + 5 )
		{
			kill();
		}
	}
}