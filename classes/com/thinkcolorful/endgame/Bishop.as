package com.thinkcolorful.endgame
{
	import flash.display.MovieClip;
	
	/**
	 * ...
	 * @author ... Effy
	 */
	public class Bishop extends Piece
	{
		// Constructor Function (gets called when class is instantiated)
		public function Bishop(color:String):void
		{
			super("bishop", color);
			gotoAndStop(color);
		}
		
		override public function getValidMoves(pos:int, boardFields:Array):Object
		{
			// Array to store valid moves(number value of BoardField on Board)
			var validMoves:Array = new Array();
			var inCheck:Array = new Array();
			
			////////////////////////////////////////////
			// Hightlight valid fields to the NORTH EAST
			////////////////////////////////////////////
			
			// Hightlight valid fields to the NE
			var fieldIndex:int = pos - 4;  // var fieldIndex:int = pos - (width - 1); 
			
			// While the position of the Bishop is greater than 0, and it's not in a corner to yop right
			while (fieldIndex >= 0 && pos % 5 != 4) // while (fieldIndex >= 0 && pos % width != (width - 1))
			{
				//if the field is not empty
				if (boardFields[fieldIndex].piece != null)
				{
					// and the piece on it is friendly
					if (boardFields[fieldIndex].piece.color == boardFields[pos].piece.color)
						break;
					else // enemy spotted!
					{
						inCheck.push(fieldIndex);
						break;
					}
				}
				else
					validMoves.push(fieldIndex);
				
				if (fieldIndex % 5 == 4)
					break;
				
				fieldIndex -= 4;
			}
			
			////////////////////////////////////////////
			// Hightlight valid fields to the NORTH WEST
			////////////////////////////////////////////
			fieldIndex = pos - 6;
			
			while (fieldIndex >= 0 && pos % 5 != 0)
			{
				// if the field is not empty
				if (boardFields[fieldIndex].piece != null)
				{
					// and the piece on it is friendly
					if (boardFields[fieldIndex].piece.color == boardFields[pos].piece.color)
						break;
					else // enemy spotted!
					{
						inCheck.push(fieldIndex);
						break;
					}
				}
				else
					validMoves.push(fieldIndex);
				
				// stop loop if bishop is on left edge
				if (fieldIndex % 5 == 0)
					break;
				
				fieldIndex -= 6;
			}
			
			
			////////////////////////////////////////////
			// Hightlight valid fields to the SOUTH EAST
			////////////////////////////////////////////
			
			fieldIndex = pos + 6;
			
			while (fieldIndex <= 24 && pos % 5 != 4) //while (fieldIndex >= 0 && pos % width != (width - 1))
			{
				// if the field is not empty
				if (boardFields[fieldIndex].piece != null)
				{
					// and the piece on it is friendly
					if (boardFields[fieldIndex].piece.color == boardFields[pos].piece.color)
						break;
					else // enemy spotted!
					{
						inCheck.push(fieldIndex);
						break;
					}
				}
				else
					validMoves.push(fieldIndex);
				
				// stop loop if bishop is on right edge
				if (fieldIndex % 5 == 4)
					break;
				
				fieldIndex += 6;
				
			}
			
			////////////////////////////////////////////
			// Hightlight valid fields to the SOUTH WEST
			////////////////////////////////////////////
			
			fieldIndex = pos + 4;
			// while still on board, not on left edge, and field we're checking 
			while (fieldIndex <= 24 && pos % 5 != 0)
			{				
				// if the field is not empty
				if (boardFields[fieldIndex].piece != null)
				{
					//and the piece on it is friendly
					if (boardFields[fieldIndex].piece.color == boardFields[pos].piece.color)
						break;
					else // enemy spotted!
					{
						inCheck.push(fieldIndex);
						break;
					}
				}
				else
					validMoves.push(fieldIndex);
				
				// stop loop if bishop is on left edge
				if (fieldIndex % 5 == 0)
					break;
				
				//otherwise continue loop
				fieldIndex += 4;
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