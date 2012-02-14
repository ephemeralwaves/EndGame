package com.thinkcolorful.endgame
{
	import flash.display.MovieClip;
	
	/**
	 * ...
	 * @author ... Effy
	 */
	public class King extends Piece
	{
		// Constructor Function 
		public function King(color:String):void
		{
			super("king", color);
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
			var fieldIndex:int = pos - 5;
			if (fieldIndex >= 0)
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
			
			////////////   Right Diagonal  ////////////
			fieldIndex = pos - 4;
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
			
			
			/////////  Left Diagonal     ////////////
			fieldIndex = pos - 6;
			if (fieldIndex >= 0 && fieldIndex % 5 != 4 )
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
			
			/////////////////////////////////////////////
			// Hightlight valid fields to the SOUTH
			////////////////////////////////////////////
			fieldIndex = pos + 5;
			if (fieldIndex <= 24)
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
			
			/////////////    Right Diagonal  ////////////
			fieldIndex = pos + 6;
			if (fieldIndex <= 24 && pos % 5 != 4)
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
			
			
			/////////  Left Diagonal  /////////////////
			fieldIndex = pos + 4;
			
			if (fieldIndex <= 24 && pos % 5 != 0)
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
			
			
			/////////////////////////////////////////////
			// Hightlight valid fields to the EAST
			////////////////////////////////////////////
			fieldIndex = pos + 1;
			if (fieldIndex % 5 != 0)
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
			
			/////////////////////////////////////////////
			// Hightlight valid fields to the WEST
			////////////////////////////////////////////
			fieldIndex = pos - 1;
			if (fieldIndex % 5 != 4 && fieldIndex >= 0)
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