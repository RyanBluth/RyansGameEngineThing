package animation;

/**
 * ...
 * @author Ryan
 */

import flash.display.Sprite;
import flash.display.Sprite;
import flash.events.Event;
import flash.external.ExternalInterface;
import flash.geom.Rectangle;
import flash.Lib;
import haxe.macro.Type.BaseType;
import openfl.Assets;
import flash.display.*;
import flash.ui.Keyboard;
import flash.events.*;
import flash.Lib;
import flash.events.KeyboardEvent;
import openfl.display.Tilesheet;
import utils.KeyboardUtil;
import flash.display.Bitmap;
import haxe.Timer;

class AnimationState
{
	
	private var frames:Array<Int>;
	private var currentFrame:Int;
	private var frameRate:Int;
	private var frameCounter:Int;

	public function new(framePass:Array<Int>, frameRatePass:Int) 
	{
		frames = framePass;
		frameRate = frameRatePass;
		currentFrame = 0;
		frameCounter = 0;
	}
	
	public function getCurrentFrame()
	{
		frameCounter++;
		
		if (frameCounter >= frameRate)
		{
			frameCounter = 0;
			currentFrame++;
			if (currentFrame >= frames.length )
			{
				currentFrame = 0;
			}
		}
		
		return frames[currentFrame];
	}
	
	
}