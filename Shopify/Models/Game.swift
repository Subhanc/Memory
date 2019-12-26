//
//  Game.swift
//  Shopify
//
//  Created by Subhan Chaudhry on 2019-12-24.
//  Copyright © 2019 Subhan Chaudhry. All rights reserved.
//

import Foundation


class Game: ObservableObject {
    
    @Published var player: Player
    @Published var gameMode: GameMode
    @Published var gameDetails: GameDetails
    @Published var gameMananger: GameManager
    
    // Contains the different game modes available.
    enum GameMode {
        case lowestTime
        case accuracy
        case flash
    }
    // Initalizes a new game object.
    init(newPlayer player: Player, andGameMode gameMode: GameMode, andGameDetails gameDetails: GameDetails) {
        self.player = player
        self.gameMode = gameMode
        self.gameDetails = gameDetails
        self.gameMananger = GameManager(withGameDetails: gameDetails, andPlayer: player)
    }
}
