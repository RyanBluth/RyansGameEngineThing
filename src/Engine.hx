package ;

import flash.display.Sprite;
import flash.events.Event;
import flash.external.ExternalInterface;
import flash.Lib;
import haxe.macro.Type.BaseType;
import openfl.Assets;
import flash.display.*;
import flash.ui.Keyboard;
import flash.events.*;
import flash.Lib;
import flash.events.KeyboardEvent;
import utils.KeyboardUtil;
import flash.display.Bitmap;
import haxe.Timer;
import entity.Player;
import utils.MouseUtil;
/**
 * ...
 * @author Ryan
 */
class Engine
{
	
	//Timer 
	private var gameTimer:Timer;
	
	//Utils
	private var keyboardUtil:KeyboardUtil; 
	private var mouseUtil:MouseUtil;
	
	//Main Reference
	private var stage:Main;
	
	//Assets
	private var player:Player;
	
	public function new(mainStage:Main) 
	{
		
		stage = mainStage;
		
		//Setup Utils
		keyboardUtil = new KeyboardUtil();
		mouseUtil = new MouseUtil();
		
		setUp();
		
		//loop the game
		gameTimer = new Timer(17);
		gameTimer.run = function() {gameLoop();};
		
	}
	
	public function setUp()
	{
		player = new Player();
		stage.addChild(player);
	}
	
	public function gameLoop()
	{
		managePlayerControl();
		draw();
	}
	
	private function managePlayerControl()
	{
		if  (keyboardUtil.getPressedKeys().exists(Keyboard.RIGHT))
		{
			player.x += 3;
			player.setAnimationState("walkRight");
		}
		
		if (keyboardUtil.getPressedKeys().exists(Keyboard.LEFT))
		{
			player.x -= 3;
			player.setAnimationState("walkLeft");
		}
		
		if (keyboardUtil.getPressedKeys().exists(Keyboard.UP))
		{
			player.y -= 3;
			player.setAnimationState("walkUp");
		}
		
		if  (keyboardUtil.getPressedKeys().exists(Keyboard.DOWN))
		{
			player.y += 3;
			player.setAnimationState("walkDown");
		}
		
	}
	
	public function draw()
	{
		player.draw();
	}
	
}

	