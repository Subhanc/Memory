//
//  GameMode.swift
//  Shopify
//
//  Created by Subhan Chaudhry on 2019-12-23.
//  Copyright © 2019 Subhan Chaudhry. All rights reserved.
//

import Foundation

class GameDetails {
    
    // Difficulty selected by user
    var difficulty: Difficulty
    var gridSize: (x: Int, y: Int)
    var totalCards: Int
    var cardsPerMatch: Int
    var numberOfCardPairs: Int
    
    
    init(gameDifficulty difficulty: Difficulty, andCustomGridSize gridSize: (x: Int, y: Int) = (0, 0), andCardsPerMatch cardsPerMatch: Int = 0) {
        self.difficulty = difficulty

        switch difficulty {
        case .veryEasy:
            self.cardsPerMatch = 2
            self.gridSize = (4, 4)
            self.numberOfCardPairs = self.gridSize.x*self.gridSize.y/self.cardsPerMatch
        case .easy:
            self.cardsPerMatch = 2
            self.gridSize = (5, 4)

            self.numberOfCardPairs = self.gridSize.x*self.gridSize.y/self.cardsPerMatch
        case .medium:
            self.cardsPerMatch = 3
            self.gridSize = (7, 6)
            self.numberOfCardPairs = self.gridSize.x*self.gridSize.y/self.cardsPerMatch
        case .hard:
            self.cardsPerMatch = 4
            self.gridSize = (10, 10)
            self.numberOfCardPairs = self.gridSize.x*self.gridSize.y/self.cardsPerMatch
        case .custom:
            self.cardsPerMatch = cardsPerMatch
            self.gridSize = gridSize
            self.numberOfCardPairs = self.gridSize.x*self.gridSize.y/self.cardsPerMatch
        }
        
        self.totalCards = self.gridSize.x*self.gridSize.y
    }
}

// Game difficulty levels
enum Difficulty {
      case veryEasy
      case easy
      case medium
      case hard
      case custom
  }
