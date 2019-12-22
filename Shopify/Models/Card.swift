//
//  Card.swift
//  Shopify
//
//  Created by Subhan Chaudhry on 2019-11-30.
//  Copyright © 2019 Subhan Chaudhry. All rights reserved.
//

import UIKit
import SwiftyJSON

class Card: Identifiable, Equatable {
   
    var id: Int
    var data: CardData
    var isFlipped: Bool = false
    
    init(withId id: Int, data: CardData) {
        self.id = id
        self.data = data
    }
    
    static func == (lhs: Card, rhs: Card) -> Bool {
        return lhs.id == rhs.id
    }
    
    func copy() -> Card {
        return Card(withId: self.id, data: self.data)
    }
}

extension Card {
    class CardData {
        /// Image of the product card
        var productImage: UIImage
        
        init(productImage: UIImage) {
             self.productImage = productImage
         }
        
        convenience init(fromJSON json: JSON) {
            self.init(productImage: UIImage(fromUrl: json["image"]["src"].stringValue))
        }
    }
}
