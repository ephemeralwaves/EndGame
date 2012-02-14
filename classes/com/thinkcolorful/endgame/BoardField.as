package com.thinkcolorful.endgame
{
	import flash.display.MovieClip;
	
	/**
	 * ... BoardField Class handles elements on each field
	 * @author ... Effy & Quackor
	 */
	
	// A visual class to display selections/moves/ect.
	public class  BoardField extends MovieClip
	{   
		// _hitTarget is a blank field ontop of BoardField to designate area for user click
		private var _hitTargetMC:MovieClip;
		// _inCheck shows Pieces in check
		private var _inCheckMC:MovieClip;
		// _isValidMove shows Pieces valid moves
		private var _isValidMoveMC:MovieClip;
		// _isSelected shows selected Piece
		private var _isSelectedMC:MovieClip;
		// Needed to position the Piece and create an additional layer?
		private var _pieceHolderMC:MovieClip;
		
		
		// The piece that's on this BoardField
		private var _piece:Piece = null;
		
		// Constructor Function (gets called when class is instantiated)
		public function BoardField():void
		{
			// in order to link it with the fla 
			// we grab references to objects on stage
			_hitTargetMC = getChildByName("hitTarget") as MovieClip;
			_inCheckMC = getChildByName("inCheck") as MovieClip;
			_isValidMoveMC = getChildByName("isValidMove") as MovieClip;
			_isSelectedMC = getChildByName("isSelected") as MovieClip;
			_pieceHolderMC = getChildByName("pieceHolder") as MovieClip;
		}
		
		// Visually displays the BoardFields that is selected
		public function setIsSelectedBox(isSelected:Boolean):void
		{
			_isSelectedMC.visible = isSelected;
		}
		
		// Visually displays the BoardFields that are valid for the selected Piece
		public function setIsValidMovekBox(isValidMove:Boolean):void
		{
			_isValidMoveMC.visible = isValidMove;
		}
		
		// Visually displays the BoardField in a checked state
		public function setInCheckBox(inCheck:Boolean):void
		{
			_inCheckMC.visible = inCheck;
		}
		
		// Visually displays the BoardField in a checked state
		public function isAValidMove():Boolean
		{
			return _isValidMoveMC.visible;
		}
		
		// Gives a reference to _hitTargetMC, which is "hitTarget" in the fla
		public function get hitTargetMC():MovieClip
		{
			return _hitTargetMC;
		}
		
		// Gives a reference to _piece- Piece class : gives you piece!
		public function get piece():Piece
		{
			return _piece;
		}
		
		// Adds Piece to empty BoardField
		public function set piece(aPiece:Piece):void
		{
			_piece = aPiece;
			_pieceHolderMC.addChild(aPiece);
		}
		
		// Shows selected field (yellow box)
		public function isSelectedField():Boolean
		{
			return _isSelectedMC.visible;
		}
		
		// Make piece disappear and returns the piece
		public function removePiece():Piece
		{
			_pieceHolderMC.removeChild(_piece);
			var tempPiece:Piece = _piece;
			_piece = null;
			return tempPiece;
		}
		

	}
	
}