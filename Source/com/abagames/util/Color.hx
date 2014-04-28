package com.abagames.util;
using com.abagames.util.IntUtil;
class Color {
	public static var transparent:Color = new Color(-1);
	public static var black:Color = new Color(0, 0, 0);
	public static var red:Color = new Color(MAX_VALUE, WHITENESS, WHITENESS);
	public static var green:Color = new Color(WHITENESS, MAX_VALUE, WHITENESS);
	public static var blue:Color = new Color(WHITENESS, WHITENESS, MAX_VALUE);
	public static var yellow:Color = new Color(MAX_VALUE, MAX_VALUE, WHITENESS);
	public static var magenta:Color = new Color(MAX_VALUE, WHITENESS, MAX_VALUE);
	public static var cyan:Color = new Color(WHITENESS, MAX_VALUE, MAX_VALUE);
	public static var white:Color = new Color(MAX_VALUE, MAX_VALUE, MAX_VALUE);
	public var r:Int;
	public var g:Int;
	public var b:Int;
	public function new(r:Int = 0, g:Int = 0, b:Int = 0) {
		this.r = r;
		this.g = g;
		this.b = b;
	}
	public var i(get_i, null):Int;
	public var rgb(null, set_rgb):Color;
	public var blink(get_blink, null):Color;
	public var wz(get_wz, null):Color;
	public var dz(get_dz, null):Color;
	public var rz(get_rz, null):Color;
	public var gz(get_gz, null):Color;
	public var bz(get_bz, null):Color;
	public function blend(c:Color, ratio:Float):Color {
		return changeValue(
			Std.int((c.r - r) * ratio),
			Std.int((c.g - g) * ratio),
			Std.int((c.b - b) * ratio));
	}

	static inline var LEVEL = 5;
	static inline var LEVEL_VALUE = 50;
	static inline var MAX_VALUE = LEVEL * LEVEL_VALUE;
	static inline var WHITENESS = 0;
	function get_i():Int {
		return 0xff000000 + r * 0x10000 + g * 0x100 + b;
	}
	function set_rgb(c:Color):Color {
		r = c.r;
		g = c.g;
		b = c.b;
		return this;
	}
	static var blinkColor:Color = new Color();
	function get_blink():Color {
		var random = Frame.i.random;
		changeValueColor(blinkColor, 
			random.i(128, -64), random.i(128, -64), random.i(128, -64));
		return blinkColor;
	}
	function get_wz():Color {
		return changeValue(LEVEL_VALUE, LEVEL_VALUE, LEVEL_VALUE);
	}
	function get_dz():Color {
		return changeValue(-LEVEL_VALUE, -LEVEL_VALUE, -LEVEL_VALUE);
	}
	function get_rz():Color {
		return changeValue(LEVEL_VALUE, Std.int(-LEVEL_VALUE / 2), Std.int(-LEVEL_VALUE / 2));
	}
	function get_gz():Color {
		return changeValue(Std.int(-LEVEL_VALUE / 2), LEVEL_VALUE, Std.int(-LEVEL_VALUE / 2));
	}
	function get_bz():Color {
		return changeValue(Std.int(-LEVEL_VALUE / 2), Std.int(-LEVEL_VALUE / 2), LEVEL_VALUE);
	}
	function changeValue(rv:Int, gv:Int, bv:Int):Color {
		var changedColor = new Color();
		changeValueColor(changedColor, rv, gv, bv);
		return changedColor;
	}
	function changeValueColor(color:Color, rv:Int, gv:Int, bv:Int):Void {
		color.rgb = this;
		color.r += rv; color.g += gv; color.b += bv;
		color.normalize();
	}
	function normalize():Void {
		r = r.clampi(0, MAX_VALUE);
		g = g.clampi(0, MAX_VALUE);
		b = b.clampi(0, MAX_VALUE);
	}
}