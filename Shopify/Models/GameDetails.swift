//
//  GameMode.swift
//  Shopify
//
//  Created by Subhan Chaudhry on 2019-12-23.
//  Copyright © 2019 Subhan Chaudhry. All rights reserved.
//

import Foundation

/// Model that holds the game    of a created game.
class GameDetails {
    
    /// The difficulty mode selected by the user.
    var difficulty: Difficulty
    
    ///  The (x,y)  grid lengths of the cards field. Initalized dependant on game difficulty.
    var gridSize: (x: Int, y: Int)
    
    /// The total amount of cards on card field.
    var totalCards: Int

    /// The number of identical cards that make a card match pair.
    var cardsPerMatch: Int
    
    /// The total amount of card match pairs that exist in the current game.
    var numberOfCardPairs: Int
    
    /**
        Initializes the game details provided the game difficulty selected by the user.

        - Parameters:
           - difficulty: The difficulty mode selectd by the user.
           - gridSize: Optional: Sets custom grid size given by the user. Only applicable if game difficulty is custom.
           - cardsPerMatch: Optional: Sets the number of cards that complete one set.  Only applicable if game difficulty is custom.

        - Returns: Object that contains all information needeed to initalize a game.
    */
    init(gameDifficulty difficulty: Difficulty, andCustomGridSize gridSize: (x: Int, y: Int) = (0, 0), andCardsPerMatch cardsPerMatch: Int = 0) {
        self.difficulty = difficulty
        
        switch difficulty {
        case .easy:
            self.cardsPerMatch = 2
            self.gridSize = (4, 4)

            self.numberOfCardPairs = self.gridSize.x*self.gridSize.y/self.cardsPerMatch
        case .medium:
            self.cardsPerMatch = 3
            self.gridSize = (6, 5)
            self.numberOfCardPairs = self.gridSize.x*self.gridSize.y/self.cardsPerMatch
        case .hard:
            self.cardsPerMatch = 4
            self.gridSize = (6, 6)
            self.numberOfCardPairs = self.gridSize.x*self.gridSize.y/self.cardsPerMatch
        case .custom:
            self.cardsPerMatch = cardsPerMatch
            self.gridSize = gridSize
            self.numberOfCardPairs = self.gridSize.x*self.gridSize.y/self.cardsPerMatch
        }
        self.totalCards = self.gridSize.x*self.gridSize.y
    }
}
