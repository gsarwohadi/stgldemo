package com.abagames.util;
import flash.events.KeyboardEvent;
import flash.Lib;
class Key {
	public static var s:Array<Bool>;
	public static var isWPressed(get_isWPressed, null):Bool;
	public static var isAPressed(get_isAPressed, null):Bool;
	public static var isSPressed(get_isSPressed, null):Bool;
	public static var isDPressed(get_isDPressed, null):Bool;
	public static var isButtonPressed(get_isButtonPressed, null):Bool;
	public static var isButton1Pressed(get_isButton1Pressed, null):Bool;
	public static var isButton2Pressed(get_isButton2Pressed, null):Bool;
	public static var stick(get_stick, null):Xy;

	static var stickXy:Xy;
	public static function initialize():Void {
		s = new Array<Bool>();
		for (i in 0...256) s.push(false);
		stickXy = new Xy();
		Lib.current.stage.addEventListener(KeyboardEvent.KEY_DOWN, onPressed);
		Lib.current.stage.addEventListener(KeyboardEvent.KEY_UP, onReleased);
	}
	public static function reset() {
		for (i in 0...256) s[i] = false;
	}
	static function onPressed(e:KeyboardEvent) {
		s[e.keyCode] = true;
	}
	static function onReleased(e:KeyboardEvent) {
		s[e.keyCode] = false;
	}
	static function get_isWPressed():Bool {
		return s[0x26] || s[0x57];
	}
	static function get_isAPressed():Bool {
		return s[0x25] || s[0x41];
	}
	static function get_isSPressed():Bool {
		return s[0x28] || s[0x53];
	}
	static function get_isDPressed():Bool {
		return s[0x27] || s[0x44];
	}
	static function get_isButtonPressed():Bool {
		return isButton1Pressed || isButton2Pressed;
	}
	static function get_isButton1Pressed():Bool {
		return s[0x5a] || s[0xbe] || s[0x20];
	}
	static function get_isButton2Pressed():Bool {
		return s[0x58] || s[0xbf];
	}	
	static function get_stick():Xy {
		stickXy.v = 0;
		if (isWPressed) stickXy.y -= 1;
		if (isAPressed) stickXy.x -= 1;
		if (isSPressed) stickXy.y += 1;
		if (isDPressed) stickXy.x += 1;
		if (stickXy.x != 0 && stickXy.y != 0) stickXy.scaleBy(0.7);
		return stickXy;
	}
}