package utils;

/**
 * ...
 * @author Ryan
 */

 
import animation.AnimationState;
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


class AnimationUtil
{
	
	private var bitmap:Bitmap;
	private var tileSheet:Tilesheet;
	private var animationStates:Map<String, AnimationState>;
	private var graphics:Graphics;
	private var addedTiles:Int;
	private var currentSate:AnimationState;

	public function new(graphic:Graphics, bitmapPath:String) 
	{
		graphics = graphic;
		tileSheet = new Tilesheet(Assets.getBitmapData(bitmapPath));
		animationStates = new Map();
	}
	
	public function addAnimationState(name:String, frames:Array<Rectangle>, frameRate:Int):Void
	{
		for(i in frames)
		{
			tileSheet.addTileRect(i);
		}
		
		var tileIds:Array<Int> = new Array();
		
		for(i in addedTiles...addedTiles+frames.length)
		{
			tileIds.push(addedTiles);
			addedTiles++;
		}
		
		animationStates.set(name, new AnimationState(tileIds, frameRate));
	}
	
	public function setAnimationSate(name:String)
	{
		currentSate = animationStates.get(name); 
		
		trace(name);
	}
	
	public function draw()
	{
		var data=[0.0, 0.0, currentSate.getCurrentFrame()];
		graphics.clear();
		tileSheet.drawTiles(graphics,data, true);
	}
}