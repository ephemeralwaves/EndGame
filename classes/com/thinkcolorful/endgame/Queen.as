package com.thinkcolorful.endgame
{
	import flash.display.MovieClip;
	
	/**
	 * ...
	 * @author ... Effy
	 */
	public class Queen extends Piece
	{
		// Constructor Function (gets called when class is instantiated)
		public function Queen(color:String):void
		{
			super("queen", color);
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
			
			while (fieldIndex >= 0)
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
				{
					validMoves.push(fieldIndex);
					fieldIndex -=  5;
				}
			}
			
			/////////      Right Diagonal  ////////////////////
			fieldIndex = pos - 4;
			
			while (fieldIndex >= 0 && pos % 5 != 4) //while (fieldIndex >= 0 && pos % width != (width - 1))
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
				
				if (fieldIndex % 5 == 4)
					break;
				
				fieldIndex -= 4;
			}
			
			
			/////////  Left Diagonal     //////////////////////
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
				
				// stop loop if queen is on left edge
				if (fieldIndex % 5 == 0)
					break;
				
				fieldIndex -= 6;
			}
			
			////////////////////////////////////////////
			// Hightlight valid fields to the SOUTH
			////////////////////////////////////////////
			
			fieldIndex = pos + 5;
			while (fieldIndex <= 24)  //while (fieldIndex <= (width x height)-1)  --> Board
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
				{
					validMoves.push(fieldIndex);
					fieldIndex +=  5;
				}
			}
			
			/////////      Right Diagonal  ////////////////////
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
				
				// stop loop if queen is on right edge
				if (fieldIndex % 5 == 4)
					break;
				
				fieldIndex += 6;
				
			}
			
			/////////     Left Diagonal     ////////////////////
			fieldIndex = pos + 4;
			while (fieldIndex <= 24 && pos % 5 != 0)
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
				
				// stop loop if queen is on left edge
				if (fieldIndex % 5 == 0)
					break;
				
				// otherwise continue loop
				fieldIndex += 4;
			}
			
			////////////////////////////////////////////
			// Hightlight valid fields to the EAST
			////////////////////////////////////////////
			fieldIndex = pos + 1;
			
			while (fieldIndex % 5 != 0) //while (fieldIndex % width != 0) 
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
				{
					validMoves.push(fieldIndex);
					fieldIndex +=  1;
				}
			}
			
			
			
			////////////////////////////////////////////
			// Hightlight valid fields to the WEST
			////////////////////////////////////////////
			fieldIndex = pos - 1;
			
			while (fieldIndex % 5 != 4 && fieldIndex >= 0) // while (fieldIndex % (width) != (width-1) && fieldIndex >= 0)
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
				{
					validMoves.push(fieldIndex);
					fieldIndex -=  1;
				}
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