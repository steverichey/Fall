package;

import flixel.FlxSprite;
import flixel.util.FlxPoint;
import flixel.util.FlxRandom;

class Bit extends FlxSprite
{
	private var _initialPoint:FlxPoint;
	private var _weight:Int = 0;
	private var _absVel:FlxPoint;
	
	/**
	 * This is a generic sprite class extended by Branch, Leaf, and Wisp, since they share so many functions in common.
	 * Always 1px by 1px.
	 * 
	 * @param	X
	 * @param	Y
	 * @param	Weight
	 * @param	Color
	 */
	public function new( X:Int, Y:Int, Weight:Int, Color:Int )
	{
		super( X, Y );
		makeGraphic( 1, 1, Color );
		_weight = Weight;
		_absVel = new FlxPoint();
		reset( X, Y );
	}
	
	/**
	 * Resets this bit, and updates the initial point. Used for recycling.
	 * 
	 * @param	X
	 * @param	Y
	 */
	override public function reset( X:Float, Y:Float )
	{
		super.reset( X, Y );
		_initialPoint = new FlxPoint( X, Y );
	}
	
	/**
	 * Overridden.
	 * Attempts to move this bit. Branches can move a little, leaves can move and fall, and wisps move a lot.
	 * 
	 * @param	Force
	 */
	public function push( Force:Float )
	{
		
	}
	
	/**
	 * How much this bit "weighs".
	 */
	public var weight(get, null):Int;
	
	private function get_weight():Int
	{
		return _weight;
	}
	
	/**
	 * The absolute value of this bit's velocity.
	 */
	public var absVelocity(get, null):FlxPoint;
	
	private function get_absVelocity():FlxPoint
	{
		_absVel.x = ( velocity.x < 0 ) ? velocity.x * -1 : velocity.x;
		_absVel.y = ( velocity.y < 0 ) ? velocity.y * -1 : velocity.y;
		
		return _absVel;
	}
	
	/**
	 * The direction of this bit, -1 if left, 1 if right.
	 */
	public var direction(get, null):Int;
	
	private function get_direction():Int
	{
		return ( velocity.x < 0 ) ? -1 : 1;
	}
}