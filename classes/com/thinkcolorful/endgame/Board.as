package com.thinkcolorful.endgame
{
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.events.MouseEvent;
	
	/**
	 * ... Board Class
	 * @author ... Effy & Quackor
	 */
	public class Board extends MovieClip
	{		
		// Board will have:
		private var _boardFields:Array;
		private var _pieces:Array;
		private var _selectedPiece:Piece = null;
		
		// Constructor Function (gets called when class is instantiated)
		// Board function takes in width and height, default is 5 x 5
		public function Board(width:int = 5, height:int = 5):void
		{
			_boardFields = new Array();
			_pieces = new Array();			
			
			var i:int = 0;
			var aBoardField;
			
			// variables to keep account of the position of BoardField
			var newX = 0;
			var newY = 0;
			
			// Creates Board Fields (25 in total by default)
			for (i; i < width * height; i++)
			{
				aBoardField = new BoardField();
				
				// mod fuction to tell if it is at the end of a row
				newX = (i % width) * aBoardField.width;
				
				if (i % width == 0 && i != 0)
				{
					newY +=  aBoardField.height;
					newX = 0;
				}
				
				// holds the value of x and y
				aBoardField.x = newX;
				aBoardField.y = newY;
				
				// hides the yellow isSelected box/grey Valid Move box/ and red Check box
				aBoardField.isSelected.visible = false;
				aBoardField.isValidMove.visible = false;
				aBoardField.inCheck.visible = false;
				
				// Makes board fields clickable
				// Adds event listener to _hitTargetMC that will handle MouseEvent.CLICK events (the user click)
				aBoardField.hitTarget.buttonMode = true;
				aBoardField.hitTarget.addEventListener(MouseEvent.CLICK, onFieldClick);
				
				// Pushes the boardfields onto stage;
				_boardFields.push(aBoardField);
				addChild(aBoardField);
			}
			
			// Set up board with Pieces 
			// Stores each piece in _pieces array
			_pieces.push(new Knight("red"));
			_boardFields[0].piece = _pieces[0];
			_pieces.push(new Bishop("red"));
			_boardFields[1].piece = _pieces[1];
			_pieces.push(new Rook("red"));
			_boardFields[2].piece = _pieces[2];
			_pieces.push(new Queen("red"));
			_boardFields[3].piece = _pieces[3];
			_pieces.push(new King("red"));
			_boardFields[4].piece = _pieces[4];
			
			_pieces.push(new King("white"));
			_boardFields[20].piece = _pieces[5];
			_pieces.push(new Queen("white"));
			_boardFields[21].piece = _pieces[6];
			_pieces.push(new Rook("white"));
			_boardFields[22].piece = _pieces[7];
			_pieces.push(new Bishop("white"));
			_boardFields[23].piece = _pieces[8];
			_pieces.push(new Knight("white"));
			_boardFields[24].piece = _pieces[9];
			
		}
		
		// Getter function to return currently selectedPiece
		public function get selectedPiece():Piece
		{
			return _selectedPiece;
		}
		
		// Handles user clicks;
		private function onFieldClick(myEvent:MouseEvent):void
		{
			// Handels moving the selectedPiece on the new board //
			// if the board field is empty
			if (myEvent.currentTarget.parent.piece == null)
			{
				// if some piece is already selected and it is moved to a boardfield that is valid
				if (_selectedPiece != null && myEvent.currentTarget.parent.isAValidMove())
				{
					// Moves the piece
					myEvent.currentTarget.parent.piece = (_selectedPiece.parent.parent as BoardField).removePiece();
					
					clearBoard();
					
					(myEvent.currentTarget.parent as BoardField).setIsSelectedBox(true); /////////////////////////////////////////////
					
					calculateBoardData();
					
					// Win Condition Check
					// checkWinCondition();
				}
				return;
			}
			// if the piece that was clicked is the same as the selected piece
			if (_selectedPiece == myEvent.currentTarget.parent.pieceHolder.getChildAt(0))
			{
				//deselect
				_selectedPiece = null;
				clearBoard();
			}
			else
			{
				// otherwise set the new selected piece, and redraw board
				_selectedPiece = myEvent.currentTarget.parent.piece;
				
				clearBoard();
				
				(_selectedPiece.parent.parent as BoardField).setIsSelectedBox(true);
				
				calculateBoardData();
			}
		}
		
		// visually clears all board fields states
		public function clearBoard():void
		{
			var i:int;
			for (i = 0; i < _boardFields.length; i++)
			{
				_boardFields[i].setIsSelectedBox(false);
				_boardFields[i].setIsValidMovekBox(false);
				_boardFields[i].setInCheckBox(false);
			}
		}
		
		// Function that show's the valid moves of the selected side
		public function showSelectedSideMoves():void
		{			
			if (_selectedPiece == null)
				return;
			
			clearBoard();
			
			var i:int = 0; 
			var j:int = 0; 
			var k:int = 0; 
			var side1:Array = new Array;
			var side2:Array = new Array;
			var allSide1Moves:Array = new Array;
			var allSide2Moves:Array = new Array;
			
			// gets valid moves per side
			for (i = 0; i < _pieces.length; i++)
			{
				if (i < 5)
					side1.push(_pieces[i].getValidMoves(_boardFields.indexOf(_pieces[i].parent.parent), _boardFields).validMoves);
				else
					side2.push(_pieces[i].getValidMoves(_boardFields.indexOf(_pieces[i].parent.parent), _boardFields).validMoves);
			}
			
			// putting all the valid move data together per side
			for (j = 0; j < side1.length; j++)
			{
				for (k = 0; k < side1[j].length; k++)
				{
					if (allSide1Moves.indexOf(side1[j][k]) == -1)
						allSide1Moves.push(side1[j][k]);
				}
				for (k = 0; k < side2[j].length; k++)
				{
					if (allSide2Moves.indexOf(side2[j][k]) == -1)
						allSide2Moves.push(side2[j][k]);
				}
			}
			
			// Sort sides
			allSide1Moves.sort(16);
			allSide2Moves.sort(16);
			
			// Checks which side is currently selected, and displays validMovekBox (grey box)
			if (_selectedPiece.color == _pieces[0].color)
			{
				for (k = 0; k < allSide1Moves.length; k++)
					_boardFields[allSide1Moves[k]].setIsValidMovekBox(true);
			}
			else
			{
				for (k = 0; k < allSide2Moves.length; k++)
					_boardFields[allSide2Moves[k]].setIsValidMovekBox(true);
			}
			
			_selectedPiece = null;
		}
		
		// Function that show's the number of pieces in check on the opposing team
		public function getAllInCheck(showOnStage:Boolean = false):Array
		{			
			var i:int = 0; 
			var j:int = 0; 
			var k:int = 0; 
			var side1:Array = new Array;
			var side2:Array = new Array;
			var allSide1Checks:Array = new Array;
			var allSide2Checks:Array = new Array;
			
			for (i = 0; i < _pieces.length; i++)
			{
				if (i < 5)
					side1.push(_pieces[i].getValidMoves(_boardFields.indexOf(_pieces[i].parent.parent), _boardFields).inCheck);
				else
					side2.push(_pieces[i].getValidMoves(_boardFields.indexOf(_pieces[i].parent.parent), _boardFields).inCheck);
			}
			
			for (j = 0; j < side1.length; j++)
			{
				for (k = 0; k < side1[j].length; k++)
				{
					if (allSide1Checks.indexOf(side1[j][k]) == -1)
						allSide1Checks.push(side1[j][k]);
				}
				for (k = 0; k < side2[j].length; k++)
				{
					if (allSide2Checks.indexOf(side2[j][k]) == -1)
						allSide2Checks.push(side2[j][k]);
				}
			}
			
			allSide1Checks.sort(16);
			allSide2Checks.sort(16);
			
			// Checks which side is currently selected, and displays Checks for that side (red box)
			if (showOnStage)
			{
				if (_selectedPiece.color == _pieces[0].color)
				{
					for (k = 0; k < allSide1Checks.length; k++)
						_boardFields[allSide1Checks[k]].setInCheckBox(true);
				}
				else
				{
					for (k = 0; k < allSide2Checks.length; k++)
						_boardFields[allSide2Checks[k]].setInCheckBox(true);
				}
				
				// clear selected piece
				_selectedPiece = null;
			}
			
			return new Array(allSide1Checks, allSide2Checks);
		}
		
		// Shows valid moves for the selected piece
		private function calculateBoardData():void
		{
			// show valid moves for the selected piece
			var pieceMoves:Object = _selectedPiece.getValidMoves(_boardFields.indexOf(_selectedPiece.parent.parent), _boardFields);
			
			var i:int = 0;
			for (i; i < (pieceMoves.validMoves as Array).length; i++)
				_boardFields[(pieceMoves.validMoves as Array)[i]].setIsValidMovekBox(true);
			for (i = 0; i < (pieceMoves.inCheck as Array).length; i++)
				_boardFields[(pieceMoves.inCheck as Array)[i]].setInCheckBox(true);
			
		    // Shows numerical board data for selected side in flash output console
			// trace("Selected Piece's Valid Moves: " + pieceMoves.validMoves);
			// trace("In Check: " + pieceMoves.inCheck);
			
		}
		
		/*  This is linked to the 'totalTerritoryDiffBtn' button functionality from EndGameDoc.as
		// Created to to show which board spaces the selected player is in sole control of 
		
		public function getSafeMoves(showOnStage:Boolean = false):Array
		{			
			var i:int = 0; 
			var j:int = 0; 
			var k:int = 0; 
			var side1:Array = new Array;
			var side2:Array = new Array;
			var allSide1Moves:Array = new Array;
			var allSide2Moves:Array = new Array;
			
			for (i = 0; i < _pieces.length; i++)
			{
				if (i < 5)
					side1.push(_pieces[i].getValidMoves(_boardFields.indexOf(_pieces[i].parent.parent), _boardFields).validMoves);
				else
					side2.push(_pieces[i].getValidMoves(_boardFields.indexOf(_pieces[i].parent.parent), _boardFields).validMoves);
			}
			
			for (j = 0; j < side1.length; j++)
			{
				for (k = 0; k < side1[j].length; k++)
				{
					if (allSide1Moves.indexOf(side1[j][k]) == -1)
						allSide1Moves.push(side1[j][k]);
				}
				for (k = 0; k < side2[j].length; k++)
				{
					if (allSide2Moves.indexOf(side2[j][k]) == -1)
						allSide2Moves.push(side2[j][k]);
				}
			}
			
			allSide1Moves.sort(16);
			allSide2Moves.sort(16);
			
			var side1SaveMoves:Array = new Array();
			var side2SaveMoves:Array = new Array();
			
			if (showOnStage)
			{
				if (_selectedPiece.color == _pieces[0].color)
				{
					for (k = 0; k < allSide1Moves.length; k++)
					{
						if (allSide2Moves.indexOf(allSide1Moves[k]) == -1)
							_boardFields[allSide1Moves[k]].setIsValidMovekBox(true);
					}
				}
				else
				{
					for (k = 0; k < allSide2Moves.length; k++)
					{
						if (allSide1Moves.indexOf(allSide2Moves[k]) == -1)
							_boardFields[allSide2Moves[k]].setIsValidMovekBox(true);
					}
				}
				
				//deselect
				_selectedPiece = null;
			}
			
			//side1SaveMoves.push(allSide1Moves[k]);
			//side2SaveMoves.push(allSide1Moves[k]);
			for (k = 0; k < allSide1Moves.length; k++)
			{
				if (allSide2Moves.indexOf(allSide1Moves[k]) == -1)
					side1SaveMoves.push(allSide1Moves[k]);
			}
			for (k = 0; k < allSide2Moves.length; k++)
			{
				if (allSide1Moves.indexOf(allSide2Moves[k]) == -1)
					side2SaveMoves.push(allSide2Moves[k]);
			}
			
			
			
			return new Array(side1SaveMoves, side2SaveMoves);
			
		}
		*/
		
	
		
		// *******************Win Conditions******************************
		//length of inCheck array is 5 and opposite color has no safe moves
		/*
		private function checkWinCondition():void
		{
			
			//trace("getAllInCheck()[0]: " + getAllInCheck()[0]);
			//trace("getSafeMoves()[1]: " + getSafeMoves()[1]);
			
			//trace("getAllInCheck()[1]: " + getAllInCheck()[1]);
			//trace("getSafeMoves()[0]: " + getSafeMoves()[0]);
			
			
			
			//player 0 checks all player 1 pieces?
			if (getAllInCheck()[0].length == 5)
			{
				//does player 1 have any safe moves?
				if (getSafeMoves()[1].length == 0)
					dispatchEvent(new WinEvent(WinEvent.WIN, _pieces[0].color));
			}
			
			if (getAllInCheck()[1].length == 5) //how ab player 1?
			{
				//does player 0 have any safe moves?
				if (getSafeMoves()[0].length == 0)
					dispatchEvent(new WinEvent(WinEvent.WIN, _pieces[5].color));
			}
			
			
			// Need to add another win condition
			// win condition if one side has no more valid moves && SafeMoves
		}
		*/
		
		
		
	}

}