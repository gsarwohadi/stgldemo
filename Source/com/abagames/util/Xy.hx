package com.abagames.util;

import flash.geom.Vector3D;

class Xy extends Vector3D
{
	public static inline function ZERO()
	{
		return new Xy();
	}
	
	public function new(x:Float = 0, y:Float = 0)
	{
		super(x, y);
	}
	
	public function distanceTo(p:Vector3D):Float
	{
		var ox = p.x - x;
		var oy = p.y - y;
		return Math.sqrt(ox * ox + oy * oy);
	}
	
	public function wayTo(p:Vector3D):Float
	{
		return Math.atan2(p.x - x, p.y - y);
	}
	
	public function addAngle(a:Float, s:Float):Void
	{
		x += Math.sin(a) * s;
		y += Math.cos(a) * s;
	}
	
	public function rotate(a:Float):Void
	{
		var px = x;
		x = -x * Math.cos(a) + y * Math.sin(a);
		y = px * Math.sin(a) + y * Math.cos(a);
	}
	
	public var v(null, set_v):Float;
	public var xy(null, set_xy):Vector3D;
	public var angle(get_angle, null):Float;
	public var xi(get_xi, null):Int;
	public var yi(get_yi, null):Int;

	function set_v(v:Float):Float
	{
		return x = y = v;
	}
	
	function set_xy(v:Vector3D):Vector3D
	{
		x = v.x;
		y = v.y;
		return this;
	}
	
	function get_angle():Float
	{
		return Math.atan2(x, y);
	}
	
	function get_xi():Int
	{
		return Std.int(x);
	}
	
	function get_yi():Int
	{
		return Std.int(y);
	}
}