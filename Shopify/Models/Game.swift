//
//  Game.swift
//  Shopify
//
//  Created by Subhan Chaudhry on 2019-12-24.
//  Copyright © 2019 Subhan Chaudhry. All rights reserved.
//

import Foundation


class Game {
    
    var player: Player
    var gameMode: GameMode
    var gameDetails: GameDetails
    
    enum GameMode {
        case lowestTime
        case accuracy
        case flash
    }

    init(newPlayer player: Player, andGameMode gameMode: GameMode, andGameDetails gameDetails: GameDetails) {
        self.player = player
        self.gameMode = gameMode
        self.gameDetails = gameDetails
    }
}
