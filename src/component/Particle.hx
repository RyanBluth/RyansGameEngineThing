package component;
import flash.display.Sprite;

/**
 * ...
 * @author Ryan
 */
class Particle extends Sprite
{
	private var _xInc:Int;
	private var _yInc:Int;
	public var canRemove:Bool;
	

	public function new(xInc:Int, yInc:Int) 
	{
		super();
		_xInc = xInc;
		_yInc = yInc;
		canRemove = false;
	
	}
	
	public function update()
	{
		x += _xInc;
		y += _yInc;
		alpha -= 0.03;
		
		if (alpha <= 0)
		{
			canRemove = true;
		}
	}
	
}