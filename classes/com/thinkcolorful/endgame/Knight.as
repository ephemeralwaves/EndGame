package com.thinkcolorful.endgame
{
	import flash.display.MovieClip;
	
	/**
	 * ...
	 * @author ... Effy
	 */
	public class Knight extends Piece
	{
		// Constructor Function (gets called when class is instantiated)
		public function Knight(color:String):void
		{
			super("knight", color);
			gotoAndStop(color);
		}
		
		override public function getValidMoves(pos:int, boardFields:Array):Object
		{
			
			// Array to store valid moves(number value of BoardField on Board)
			var validMoves:Array = new Array();
			var inCheck:Array = new Array();
				
			////////////////////////////////////////////
			// Hightlight valid fields to the NORTH
			////////////////////////////////////////////
			/////////      Left     ////////////////////
			var fieldIndex:int = pos - 11;
			if (fieldIndex >= 0 && fieldIndex % 5 != 4)
			{
				// if the field is not empty
				if (boardFields[fieldIndex].piece != null)
				{
					if (boardFields[fieldIndex].piece.color != boardFields[pos].piece.color) //enemy spotted!
						inCheck.push(fieldIndex);
				}
				else
					validMoves.push(fieldIndex);
			}
			
			/////////      Right     //////////////////
			fieldIndex = pos - 9;
			if (fieldIndex >= 0 && fieldIndex % 5 != 0 )
			{
				// if the field is not empty
				if (boardFields[fieldIndex].piece != null)
				{
					if (boardFields[fieldIndex].piece.color != boardFields[pos].piece.color) //enemy spotted!
						inCheck.push(fieldIndex);
				}
				else
					validMoves.push(fieldIndex);
			}
			
			////////////////////////////////////////////
			// Hightlight valid fields to the SOUTH
			////////////////////////////////////////////
			/////////      Left     ////////////////////
			fieldIndex = pos + 9;
			if (fieldIndex <= 24 && fieldIndex % 5 != 4)
			{
				// if the field is not empty
				if (boardFields[fieldIndex].piece != null)
				{
					if (boardFields[fieldIndex].piece.color != boardFields[pos].piece.color) //enemy spotted!
						inCheck.push(fieldIndex);
				}
				else
					validMoves.push(fieldIndex);
			}
			
			/////////      Right     //////////////////
			fieldIndex = pos + 11;
			if (fieldIndex <= 24 && fieldIndex % 5 != 0)
			{
				// if the field is not empty
				if (boardFields[fieldIndex].piece != null)
				{
					if (boardFields[fieldIndex].piece.color != boardFields[pos].piece.color) //enemy spotted!
						inCheck.push(fieldIndex);
				}
				else
					validMoves.push(fieldIndex);
			}
			
			////////////////////////////////////////////
			// Hightlight valid fields to the EAST
			////////////////////////////////////////////
			/////////     Top    //////////////////////
			fieldIndex = pos - 3;
			if (fieldIndex >= 0 && fieldIndex % 5 != 0 && fieldIndex % 5 != 1)
			{
				// if the field is not empty
				if (boardFields[fieldIndex].piece != null)
				{
					if (boardFields[fieldIndex].piece.color != boardFields[pos].piece.color) //enemy spotted!
						inCheck.push(fieldIndex);
				}
				else
					validMoves.push(fieldIndex);
			}
			
			/////////      Bottom     //////////////////
			fieldIndex = pos + 7;
			if (fieldIndex <= 24 && fieldIndex % 5 != 0 && fieldIndex % 5 != 1)
			{
				// if the field is not empty
				if (boardFields[fieldIndex].piece != null)
				{
					if (boardFields[fieldIndex].piece.color != boardFields[pos].piece.color) //enemy spotted!
						inCheck.push(fieldIndex);
				}
				else
					validMoves.push(fieldIndex);
			}
			
			////////////////////////////////////////////
			// Hightlight valid fields to the WEST
			////////////////////////////////////////////
			/////////     Top    //////////////////////
			fieldIndex = pos - 7;
			if (fieldIndex >= 0 && fieldIndex % 5 != 4 && fieldIndex % 5 != 3)
			{
				// if the field is not empty
				if (boardFields[fieldIndex].piece != null)
				{
					if (boardFields[fieldIndex].piece.color != boardFields[pos].piece.color) //enemy spotted!
						inCheck.push(fieldIndex);
				}
				else
					validMoves.push(fieldIndex);
			}
			
			/////////      Bottom     //////////////////
			fieldIndex = pos + 3;
			if (fieldIndex <= 24 && fieldIndex % 5 != 4 && fieldIndex % 5 != 3)
			{
				// if the field is not empty
				if (boardFields[fieldIndex].piece != null)
				{
					if (boardFields[fieldIndex].piece.color != boardFields[pos].piece.color) //enemy spotted!
						inCheck.push(fieldIndex);
				}
				else
					validMoves.push(fieldIndex);
			}
			
			///Return//
			///////////
			var moveArrays:Object = new Object();
			moveArrays.validMoves = validMoves;
			moveArrays.inCheck = inCheck;
			
			return moveArrays;
			
			
		}
	}
	
}