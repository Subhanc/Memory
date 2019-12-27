//
//  MainMenus.swift
//  Shopify
//
//  Created by Subhan Chaudhry on 2019-12-26.
//  Copyright © 2019 Subhan Chaudhry. All rights reserved.
//

import SwiftUI

struct MainMenu: View {

    var body: some View {
       
        NavigationView {
            VStack {
               NavigationLink(destination: GameSelectionMenu(player: Player())) {
                    LargeButton(text: "Play")
                }
            }
        }
    }
}

struct GameSelectionMenu: View {
    
    var player: Player
    
    var body: some View {

        
       VStack(spacing: 12) {
            NavigationLink(destination: DifficultySelectionMenu(gameMode: .lowestTime, player: player)) {
                    LargeButton(text: "Lowest Time")
            }
                
            NavigationLink(destination: DifficultySelectionMenu(gameMode: .accuracy, player: player)) {
                    LargeButton(text: "Accuracy")
                }
                
            NavigationLink(destination: DifficultySelectionMenu(gameMode: .flash, player: player)) {
                    LargeButton(text: "One Shot")
            }
        }
    }
}


struct DifficultySelectionMenu: View {
    
    var gameMode: GameMode
    var player: Player
    
    
    var body: some View {
    
       VStack(spacing: 12) {
        
            NavigationLink(destination: LoadingGame(withPlayer: player, andGameMode: gameMode, andGameDifficulty: .veryEasy)){
                LargeButton(text: "Very Easy")
            }
            NavigationLink(destination: LoadingGame(withPlayer: player, andGameMode: gameMode, andGameDifficulty: .easy)) {
                LargeButton(text: "Easy")
            }
            
            NavigationLink(destination: LoadingGame(withPlayer: player, andGameMode: gameMode, andGameDifficulty: .medium)) {
                LargeButton(text: "Medium")
            }
            
            NavigationLink(destination: LoadingGame(withPlayer: player, andGameMode: gameMode, andGameDifficulty: .hard)) {
                LargeButton(text: "Hard")
            }
        }
    }
}


struct LoadingGame: View {
        
    var game: Game
    var cardsViewModel: CardsViewModel
    
    init(withPlayer player: Player, andGameMode gameMode: GameMode, andGameDifficulty difficulty: Difficulty) {
        self.game = Game(newPlayer: player, andGameMode: gameMode, andGameDetails: .init(gameDifficulty: difficulty))
        self.cardsViewModel = CardsViewModel(withGame: game)
    }
    
    var body: some View {
        VStack {
            NavigationLink(destination: CardsView().environmentObject(game).environmentObject(cardsViewModel)) {
                LargeButton(text: "Start Game")
            }
        }
    }
}



struct MainMenus_Previews: PreviewProvider {
    static var previews: some View {
        MainMenu()
    }
}



// Model View Controller
