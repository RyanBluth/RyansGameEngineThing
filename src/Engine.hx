package ;

import entity.Player;
import flash.display.*;
import flash.events.*;
import flash.ui.Keyboard;
import haxe.Timer;
import utils.CollisionUtil;
import utils.KeyboardUtil;
import utils.MouseUtil;
import flash.Lib;
import flash.display.BlendMode;
import flash.Lib;
import openfl.Assets;
import flash.display.Bitmap;
import flash.display.BitmapData;
import flash.display.Sprite;
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
	private var collisionUtil:CollisionUtil;
	
	//Main Reference
	private var stage:Main;
	
	//Assets
	private var player:Player;
	
	private var sprite:Sprite;
	
	public function new(mainStage:Main) 
	{
		
		stage = mainStage;
		
		//Setup Utils
		keyboardUtil = new KeyboardUtil();
		mouseUtil = new MouseUtil();
		collisionUtil = new CollisionUtil();
		
		setUp();
		
		//loop the game
		gameTimer = new Timer(20);
		gameTimer.run = function() { gameLoop(); };
		
		
	}
	
	public function setUp()
	{
		player = new Player();
		stage.addChild(player);
		
		sprite = new Sprite();
		var bit:BitmapData = Assets.getBitmapData("img/testtt.png");
		var titmap:Bitmap = new Bitmap(bit);
		titmap.width = 50;
		titmap.height = 50;
		titmap.x = 0;
		titmap.y = 0;
		sprite.x = 200;
		sprite.y = 200;
		
		sprite.addChild(titmap);
		stage.addChild(sprite);
	}
	
	public function gameLoop()
	{
		
		managePlayerControl();
		draw();
		trace(collisionUtil.isColliding(player, sprite));
		
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
		
		if (keyboardUtil.getPressedKeys().exists(Keyboard.DOWN))
		{
			player.y += 3;
			player.setAnimationState("walkDown");
		}

        if (!keyboardUtil.getPressedKeys().exists(Keyboard.DOWN) && !keyboardUtil.getPressedKeys().exists(Keyboard.UP) && !keyboardUtil.getPressedKeys().exists(Keyboard.LEFT) && !keyboardUtil.getPressedKeys().exists(Keyboard.RIGHT))
        {
            switch (keyboardUtil.getLastKeyUp())
            {
                case 37: player.setAnimationState("neutralLeft");
                case 38: player.setAnimationState("neutralUp");
                case 39: player.setAnimationState("neutralRight");
                case 40: player.setAnimationState("neutralDown");
            }
        }
		
	}
	
	public function draw()
	{
		player.draw();
	}
	
}

	
