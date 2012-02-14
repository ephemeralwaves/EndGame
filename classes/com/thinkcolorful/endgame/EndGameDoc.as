package com.thinkcolorful.endgame
{
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.net.navigateToURL;
	import flash.net.URLRequest;
	
	/**
	 * ...
	 * @author ... Effy & Quackor
	 */
	public class EndGameDoc extends MovieClip
	{
		private var _welcomeScreen:MovieClip;
		private var _dataScreen:MovieClip;
		private var _myBoard:Board;
		private var _aboutScreen:MovieClip;
		private var _gameContent:MovieClip;
		// Win Popup mc, for when the win condtion is met (this still has to be worked on)
		// private var _winPopup:MovieClip;
		
		// Constructor Function 
		public function EndGameDoc():void
		{
			// grab references to things on stage
			_gameContent = getChildByName("gameContent") as MovieClip;
			_welcomeScreen = _gameContent.getChildByName("welcomeScreen") as MovieClip;
			_dataScreen = _gameContent.getChildByName("dataScreen") as MovieClip;
			_aboutScreen = _gameContent.getChildByName("aboutScreen") as MovieClip;
		
			// Hide the About and Data sections
			_gameContent.removeChild(_aboutScreen);
			_gameContent.removeChild(_dataScreen);
			
			// Win Popup Setup if WinEvent.as works
			// _winPopup = getChildByName("winPopup") as MovieClip;
			// removeChild(_winPopup);
			// _winPopup.addEventListener(MouseEvent.CLICK, onWinPopupClicked);
			
			// New game button functionality
			_welcomeScreen.newGameBtn.addEventListener(MouseEvent.CLICK, onNewGameClicked);
			// About game button
			_welcomeScreen.aboutGameBtn.addEventListener(MouseEvent.CLICK, onAboutGameClicked);
		}
		
		private function onNewGameClicked(e:MouseEvent):void
		{
			_gameContent.removeChild(_welcomeScreen);
			_gameContent.addChild(_dataScreen)
			// Instantiates Board and Puts it onto main stage
			_myBoard = new Board();
			
			// WinCondition Event listener setup
			// _myBoard.addEventListener(WinEvent.WIN, onWinConditionMet);
			
			_gameContent.addChild(_myBoard);
			
			_dataScreen.totalTerritoryBtn.addEventListener(MouseEvent.CLICK, onTotalTerritoryClicked);
			_dataScreen.totalInCheckBtn.addEventListener(MouseEvent.CLICK, onTotalInCheckClicked);
			// See fla's 'totalTerritoryDiffBtn' button if you want to add this to the game
			// The data that this button provides is to show which board spaces the selected player is in sole control of
			// _dataScreen.totalTerritoryDiffBtn.addEventListener(MouseEvent.CLICK, onTotalTerritoryDiffClicked);
		}
		
		
		private function onAboutGameClicked(e:MouseEvent):void
		{
			// About Game Screen Content
			_gameContent.removeChild(_welcomeScreen);
			_gameContent.addChild(_aboutScreen)
			_aboutScreen.copeBtn.addEventListener(MouseEvent.CLICK, onCopeBtnClicked);
			_aboutScreen.closeBtn.addEventListener(MouseEvent.CLICK, onCloseBtnClicked);
		}
		
		
		private function onCopeBtnClicked(e:MouseEvent):void
		{
			// link to Mr. Cope's site
			navigateToURL(new URLRequest("http://artsites.ucsc.edu/faculty/cope/new.html"));
		}
		
		private function onCloseBtnClicked(e:MouseEvent):void
		{
			_gameContent.addChild(_welcomeScreen);
			_gameContent.removeChild(_aboutScreen);
		}
		
		
			
		private function onTotalTerritoryClicked(e:MouseEvent):void
		{
			_myBoard.showSelectedSideMoves();
		}
		
		private function onTotalInCheckClicked(e:MouseEvent):void
		{
			if (_myBoard.selectedPiece != null)
			{
				_myBoard.clearBoard();
				_myBoard.getAllInCheck(true);
			}
		}
		/******************Win Conditions *********************************************************************
		// needs work ;)
		private function onWinConditionMet(e:WinEvent):void
		{
			
			// populate text field on win screen depending on who won
			_winPopup.winTxtField.text = upperCase(e.winningSet) + " Kingdom Wins";
			
			//stop more items from beling clicked
			
			// show win screen
			addChild(_winPopup);
		
		}
		
		// Function to get the color of the winning side and display text
		private function upperCase(colorstr:String):String 
		{
		
			var firstChar:String = colorstr.substr(0, 1);
			
			var restOfString:String = colorstr.substr(1, colorstr.length);
			
			return firstChar.toUpperCase()+restOfString.toLowerCase();
			
		}
		private function onWinPopupClicked(e:MouseEvent):void
		{
			removeChild(_winPopup);
		}
		*/
		
		
	
		/*  A function to find the difference between player 1's set of moves and player 2's
		private function onTotalTerritoryDiffClicked(e:MouseEvent):void
		{
			if (_myBoard.selectedPiece != null)
			{
				_myBoard.clearBoard();
				// getSafeMoves function is in the Board.as file
				_myBoard.getSafeMoves(true);
			}
		}
		*/
	}
}