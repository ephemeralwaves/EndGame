package com.thinkcolorful.endgame
{
	import flash.events.Event;
	/**
	 * ...
	 * @author ... Effy & Quackor
	 */
	public class WinEvent extends Event
	{
		public static const WIN:String = "win";
		
		private var _winningSet:String;
		
		public function WinEvent(type:String, winningSet:String, bubbles:Boolean = false, cancelable:Boolean = false):void
		{
			super(type, bubbles, cancelable);
			
			_winningSet = winningSet;
		}
		
		public function get winningSet():String
		{
			return _winningSet;
		}
	}
	
}