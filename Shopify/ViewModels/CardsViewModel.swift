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
    
    static let shared = CardsViewModel()
        
    let service = Service.shared
    var columnCount = 4
    var uniqueAmount = 10
    var totalCards = 0

    init() {
        loadCards(withColumns: columnCount, uniqueAmount: uniqueAmount)
    }
    
    func loadCards(withColumns columnCount: Int, uniqueAmount: Int) {
        self.columnCount = columnCount
        self.uniqueAmount = uniqueAmount
        self.service.getCardData { result in
            if let localCards = result.value {
                var subset = localCards[..<uniqueAmount]
                subset.append(contentsOf: subset.map { $0.copy() })
                self.totalCards = subset.count
                let chunkedCards = subset.shuffled().chunk(into: columnCount)
                self.cards = Array(chunkedCards[..<((uniqueAmount * 2) / columnCount)])
            }
        }
    }
}
