#include <iostream>
#include <cstdlib>
#include <string>
#include "game.h"
#include "/home/ztyree/SoarSuite/include/sml_Client.h"
//#include "player.h"
//#include "cards.h"
using namespace std;
using namespace sml;

int main(){
	Game mygame;
	// load the game settings
	mygame.LoadConfig();
	// try to load last saved game
	mygame.LoadGame();
	while(!mygame.MoneyOut()){
		if(mygame.PromptExit()) break;
		WHO possible_winner = mygame.StartGame();
		if(possible_winner==kNeither){
			// No blackjack found in  the Start Round
			mygame.GameLoop();
		}
		mygame.CloseGame();

	}
	return 0;
}
