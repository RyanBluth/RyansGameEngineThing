package utils;


import flash.display.BitmapData;
import flash.display.BlendMode;
import flash.display.Sprite;
import flash.geom.Rectangle;

/**
 * ...
 * @author Ryan
 * The point of this class is to check for pixel perfect collision.
 * We do this by fisr checking if there is an intersection between the two
 * sprites. If there is we check all of the pixels in that intersection to see if 
 * any of them are not transperant. If they arent then we have a collision
 */

 
class CollisionUtil
{
	public function new() 
	{
		
	}
	public function isColliding(spriteOne:Sprite, spriteTwo:Sprite):Bool
	{
		
		/*
		 * First we get the bitmap data from the sprites
		 */
		var bitmapOne = new BitmapData(Math.round(spriteOne.width), Math.round(spriteOne.height));
		var bitmapTwo = new BitmapData(Math.round(spriteTwo.width), Math.round(spriteTwo.height));
		bitmapOne.draw(spriteOne,null,null,BlendMode.ALPHA);
		bitmapTwo.draw(spriteTwo,null,null,BlendMode.ALPHA);
		
		/*
		 * Here we get rectangle data for each of the sprites so that we can get the 
		 * intersecton rectangle
		 */
		var rect:Rectangle;
		
		var spriteOneRect:Rectangle = new Rectangle(spriteOne.x, spriteOne.y, spriteOne.width, spriteOne.height);
		var spriteTwoRect:Rectangle = new Rectangle(spriteTwo.x, spriteTwo.y, spriteTwo.width, spriteTwo.height);
		
		rect = spriteOneRect.intersection(spriteTwoRect);
	
		
		/*
		 * Since rect and the sprites still have the x and y
		 * values from the actual stage we need to find where the 
		 * intersection rectangle's coordinates are in relation to the 
		 * sprites themselves. This is becasue when we put in the coordinates
		 * for our getPixel32 functions they need to be the coordinates in the
		 * bitmaps not in the stage
		 */
		var diffXOne = rect.x - spriteOne.x;
		var diffYOne = rect.y - spriteOne.y;
		var diffXTwo = rect.x - spriteTwo.x;
		var diffYTwo = rect.y - spriteTwo.y;
		
		/*
		 * We have to seperate methods becasue flash and 
		 * cpp compilations seem to handle the data differently.
		 * As far as I know flash is the only target that uses unsigned ints
		 * so it will get 0 and cpp will get -1. We cant check for -1 on an unsigned
		 * int so I've seperated the two
		 */
		
		#if flash
		
		for (j in 0...Math.round(rect.height))
		{
			for (i in 0...Math.round(rect.width))
			{
				
				if (
				(bitmapOne.getPixel32(Math.round(diffXOne) + i, Math.round(diffYOne) + j) != 0 ) 
				&& (bitmapTwo.getPixel32(Math.round(diffXTwo)+i, Math.round(diffYTwo)+j) != 0 ))
				{
					return true;
				}
				
			}
		}
		
		#else
		for (j in 0...Math.round(rect.height))
		{
			for (i in 0...Math.round(rect.width))
			{
				
				if (
				(bitmapOne.getPixel32(Math.round(diffXOne) + i, Math.round(diffYOne) + j) != -1 ) 
				&& (bitmapTwo.getPixel32(Math.round(diffXTwo)+i, Math.round(diffYTwo)+j) != -1 ))
				{
					return true;
				}
			}
		}
		
		
		#end
		
		return false;
		
	}
	
	
}
