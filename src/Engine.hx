package ;

import component.Emitter;
import entity.Player;
import flash.display.*;
import flash.display.Bitmap;
import flash.display.BitmapData;
import flash.display.Sprite;
import flash.events.*;
import flash.ui.Keyboard;
import haxe.Timer;
import openfl.Assets;
import utils.CollisionUtil;
import utils.KeyboardUtil;
import utils.MouseUtil;
import flash.ui.Mouse;
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
	
	private var emitter:Emitter;
	private var emitter1:Emitter;
	private var emitter2:Emitter;
	
	public function new(mainStage:Main) 
	{
		stage = mainStage;
		
		//Setup Utils
		keyboardUtil = new KeyboardUtil();
		mouseUtil = new MouseUtil();
		collisionUtil = new CollisionUtil();
		emitter = new Emitter(250,250,0,30,50,5,20,30,0xDDDDDD,0xEEEEEE,true,false);
		
		setUp();
		
		//loop the game
		gameTimer = new Timer(Math.round(20));
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
		
		stage.addChild(emitter);
	
	}
	
	public function gameLoop()
	{
		
		emitter.update();
		emitter.x = stage.mouseX;
		emitter.y = stage.mouseY;
		
		managePlayerControl();
		
		draw();
		
		if (collisionUtil.isColliding(player, sprite))
		{
			emitter.setLowerColour(0x555555);
		}
		else {
			emitter.setLowerColour(0xDDDDDD);
		}
		
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

	
