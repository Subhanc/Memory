//
//  Game.swift
//  Shopify
//
//  Created by Subhan Chaudhry on 2019-12-24.
//  Copyright © 2019 Subhan Chaudhry. All rights reserved.
//

import Foundation

/// Model of the game that holds all information of the game.
class Game: ObservableObject {
    
    /// The current player
    @Published var player: Player
    /// The game mode selected by the player.
    @Published var gameMode: GameMode
    /// The game details selected by the player.
    @Published var gameDetails: GameDetails
    /// The game manager that contains the  functions that interact with the game.
    @Published var gameMananger: GameManager
    
    @Published var isPaused: Bool = true
    
    /**
    Initializes game information provided the player, game mode and game details.

    - Parameters:
       - player: The current player
       - gameMode: The game mode selected by the player.
       - gameDetails: The game details selected by the player.

    - Returns: Game model that holds all information of the game.
    */
    init(newPlayer player: Player, andGameMode gameMode: GameMode, andGameDetails gameDetails: GameDetails) {
        self.player = player
        self.gameMode = gameMode
        self.gameDetails = gameDetails
        self.gameMananger = GameManager(withGameDetails: gameDetails, andPlayer: player)
    }
}
