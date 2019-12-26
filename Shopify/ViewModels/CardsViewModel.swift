//
//  CardsViewModel.swift
//  Shopify
//
//  Created by Subhan Chaudhry on 2019-11-30.
//  Copyright © 2019 Subhan Chaudhry. All rights reserved.
//

import SwiftUI
import Combine

class CardsViewModel: ObservableObject {
   
    // Any view that uses this data will renvoke the body of that view if this data changes.
    @Published public var cards = [[Card]]()
    var game: Game
    
    let service = Service.shared
    
    init(withGame game: Game) {
        self.game = game
        self.loadCards()
    }

    func loadCards() {
        self.service.getCardData { result in
           if let localCards = result.value {
                var subset = localCards[..<self.game.gameDetails.numberOfCardPairs]
                let cardPairs = subset
                
                for _ in 1...self.game.gameDetails.cardsPerMatch-1 {
                    subset.append(contentsOf: cardPairs.map { $0.copy() })
                }
        
                let chunkedCards = subset.shuffled().chunk(into: self.game.gameDetails.gridSize.x)
             
                self.cards = Array(chunkedCards[..<((self.game.gameDetails.numberOfCardPairs * self.game.gameDetails.cardsPerMatch) / self.game.gameDetails.gridSize.x)])
            }
        }
    }
}
