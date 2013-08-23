package entity;

import animation.SpriteSheetHandler;
import flash.display.*;
import flash.display.Sprite;
import flash.events.*;
import utils.AnimationUtil;

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

        animationUtil.addAnimationState("neutralLeft",	spriteHandler.getSpriteArray(32*12, 32*8, 32, 32, 1, 1, 2, 1), 10);

        animationUtil.addAnimationState("neutralRight", spriteHandler.getSpriteArray(32*12, 32*8, 32, 32, 1, 2, 2, 2), 10);

        animationUtil.addAnimationState("neutralUp", spriteHandler.getSpriteArray(32 * 12, 32 * 8, 32, 32, 1, 3, 2, 3), 10);

        animationUtil.addAnimationState("neutralDown", spriteHandler.getSpriteArray(32*12, 32*8, 32, 32, 1, 0, 2, 0), 10);

		animationUtil.setAnimationSate("neutralRight");
		
	}
	
	public function setAnimationState(name:String):Void
	{
		animationUtil.setAnimationSate(name);
	
	}
	
}