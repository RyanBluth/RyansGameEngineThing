package utils;
import flash.Lib;
import flash.events.KeyboardEvent;
import flash.ui.Keyboard;
import Map;

/**
 * ...
 * @author Ryan
 */
class KeyboardUtil
{
	
	private var pressedKeys:Map<Int,Int>;

	public function new() 
	{
		Lib.current.stage.addEventListener(KeyboardEvent.KEY_DOWN, this.key_Down);
		Lib.current.stage.addEventListener(KeyboardEvent.KEY_UP, this.key_Up);
		
		pressedKeys = new Map<Int,Int>();
		
	}
	
	private function key_Down(evt:KeyboardEvent){
		
		pressedKeys.set(evt.keyCode, evt.keyCode);
		
	}
	
	private function key_Up(evt:KeyboardEvent){
		
		pressedKeys.remove(evt.keyCode);
		
	}
	
	public function getPressedKeys():Map<Int,Int> 
	{
		return pressedKeys;
	}
	
	
}