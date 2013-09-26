package component;
import component.Particle;
import flash.display.Sprite;
import flash.display.BitmapData;
import openfl.Assets;
import flash.display.Bitmap;
import Std;
import flash.Lib;

/**
 * 
 * @author Ryan
 * 
 */
class Emitter extends Sprite
{
	
	var particles:Array<Particle>;
	var emissionDelay:Int;
	var emissionDelayCounter:Int;
	var generateCircles:Bool;
	var emitRectangles:Bool;
	var maxWidth:Int;
	var minWidth:Int;
	var minSpeed:Int;
	var maxSpeed:Int;
	var minParticlesPer:Int;
	var maxParticlesPer:Int;
	var lowerColorRange:UInt;
	var upperColorRange:UInt;
 
	public function new(x:Int, y:Int, delay:Int, minWidth:Int, maxWidth:Int, 
		maxSpeed:Int, minParticlesPer:Int, maxParticlesPer:Int,  
		lowerColorRange:UInt, upperColorRange:UInt, emitCircles:Bool, emitRectangles:Bool) 
	{
		super();
		particles = new Array();
		emissionDelay = delay;
		emissionDelayCounter = delay;
		this.x = x;
		this.y = y;
		this.generateCircles = emitCircles;
		this.emitRectangles = emitRectangles;
		this.maxWidth = maxWidth;
		this.minWidth = minWidth;
		this.maxSpeed = maxSpeed;
		this.minParticlesPer = minParticlesPer;
		this.maxParticlesPer = maxParticlesPer;
		this.lowerColorRange = lowerColorRange;
		this.upperColorRange = upperColorRange;
	}
	
	public function setLowerColour(lowerColorRange:UInt)
	{
		this.lowerColorRange = lowerColorRange;
	}
	
	public function update()
	{
		generatePatricles();
		
		for (i in particles)
		{
			i.update();
			if (i.canRemove)
			{
				stage.removeChild(i);
				particles.remove(i);
			}
		}
	}
	
	private function generatePatricles()
	{
		
		if (emissionDelayCounter >= emissionDelay)
		{
			var randTimes = Std.random(maxParticlesPer - minParticlesPer) + minParticlesPer;
				
			for (i in 0...randTimes)
			{
				
				var randX = Std.random(maxSpeed);
				var randY = Std.random(maxSpeed);
				var randWidth = Std.random(maxWidth - minWidth) + minWidth;
				var randXModfier = Std.random(2);
				var randYModifier = Std.random(2);
				var isCircle;
				if (generateCircles && emitRectangles)
				{
					isCircle = Std.random(2);
				}
				
				else if(generateCircles)
				{
					isCircle = 0;
				}
				
				else {
					isCircle = 1;
				}
				
				if (randXModfier == 0)
				{
					randX = randX * -1;
				}
				
				if (randYModifier == 0)
				{
					randY = randY * -1;
				}
				
				var randAlpha = Math.random();
				
				var particleToAdd:Particle = new Particle(randX,randY);
				
				particleToAdd.graphics.beginFill(Std.random(upperColorRange - lowerColorRange) + lowerColorRange);
				
				if (isCircle == 0)
				{
					particleToAdd.graphics.drawCircle(stage.mouseX,stage.mouseY,randWidth);
				}
				
				else
				{
					particleToAdd.graphics.drawRect(stage.mouseX, stage.mouseY, randWidth, randWidth);
				}
			
				particleToAdd.graphics.endFill();
				stage.addChild(particleToAdd);
				particles.push(particleToAdd);
			}
			
			emissionDelayCounter = 0;
		}
		
		else
		{
			emissionDelayCounter++;
		}
	}
	
}