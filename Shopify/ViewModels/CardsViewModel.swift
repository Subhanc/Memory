//
//  CardsViewModel.swift
//  Shopify
//
//  Created by Subhan Chaudhry on 2019-11-30.
//  Copyright © 2019 Subhan Chaudhry. All rights reserved.
//

import SwiftUI
import GameplayKit
import Combine

class CardsViewModel: ObservableObject {
   
    // Any view that uses this data will renvoke the body of that view if this data changes.
    @Published public var cards = [[Card]]()
    
    static let shared = CardsViewModel(withGameMode: .init(gameDifficulty: .hard))
    
    let service = Service.shared
    
    let gameDetails: GameDetails
    
    init(withGameMode gameDetails: GameDetails) {
        self.gameDetails = gameDetails
        loadCards(withGameMode: gameDetails)
    }

    func loadCards(withGameMode gameDetails: GameDetails) {
        
        self.service.getCardData { result in
           if let localCards = result.value {
                var subset = localCards[..<gameDetails.numberOfCardPairs]
                let cardPairs = subset
                
                for _ in 1...gameDetails.cardsPerMatch-1 {
                    subset.append(contentsOf: cardPairs.map { $0.copy() })
                }
        
                let chunkedCards = subset.shuffled().chunk(into: gameDetails.gridSize.x)
             
                self.cards = Array(chunkedCards[..<((gameDetails.numberOfCardPairs * gameDetails.cardsPerMatch) / gameDetails.gridSize.x)])
            }
        }
    }
}
