package entity;

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
import utils.AnimationUtil;
import animation.AnimationState;
import animation.SpriteSheetHandler;

/**
 * ...
 * @author Ryan
 */
class Player extends Sprite
{
	private var animCounter = 0;
	private var animationUtil:AnimationUtil;
	
	public function new() 
	{
		super();
		addAnimations();
		
	}
	
	public function draw()
	{
		animationUtil.draw();
	}
	
	function addAnimations()
	{	
		animationUtil = new AnimationUtil(this.graphics,"img/sprite.png");
		
		var spriteHandler:SpriteSheetHandler = new SpriteSheetHandler();
		
		animationUtil.addAnimationState("walkLeft",	spriteHandler.getSpriteArray(32*12, 32*8, 32, 32, 0, 1, 3, 1), 10);
		
		animationUtil.addAnimationState("walkRight", spriteHandler.getSpriteArray(32*12, 32*8, 32, 32, 0, 2, 3, 2), 10);

		animationUtil.addAnimationState("walkUp", spriteHandler.getSpriteArray(32 * 12, 32 * 8, 32, 32, 0, 3, 3, 3), 10);
		
		animationUtil.addAnimationState("walkDown", spriteHandler.getSpriteArray(32*12, 32*8, 32, 32, 0, 0, 3, 0), 10);

		animationUtil.setAnimationSate("walkRight");
		
	}
	
	public function setAnimationState(name:String):Void
	{
		animationUtil.setAnimationSate(name);
	
	}
	
}