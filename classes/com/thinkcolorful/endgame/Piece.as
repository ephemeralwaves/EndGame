package com.thinkcolorful.endgame
{
	import flash.display.MovieClip;
	
	/**
	 * ...
	 * @author ... Effy & Quackor
	 */
	public class Piece extends MovieClip
	{
		private var _name:String;
		private var _color:String;
		private var _inCheck:Boolean = false;
		
		// Constructor Function
		// Piece takes in 2 parameters, name and color
		public function Piece(name:String, color:String):void
		{
			_name = name;
			_color = color;
		}
		
		public function getValidMoves(pos:int, boardFields:Array):Object
		{
			return [];
		}
		
		public function get color():String
		{
			return _color;
		}
		
	}
	
}