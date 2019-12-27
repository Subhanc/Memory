//
//  Card.swift
//  Shopify
//
//  Created by Subhan Chaudhry on 2019-11-30.
//  Copyright © 2019 Subhan Chaudhry. All rights reserved.
//

import UIKit
import SwiftyJSON

/// Model of a single playing card
class Card: Identifiable, Equatable {
   
    var id: Int
    
    /// Holds the properties and information of a single playing card.
    var data: CardData
    
    /// The flipped state of the card.
    var isFlipped: Bool = false
    
    /**
    Initializes game details provided the game difficulty selected by the user.

    - Parameters:
       - id: The difficulty mode selectd by the user.
       - data: Optional: Sets custom grid size given by the user. Only applicable if game difficulty is of type 'custom'.

    - Returns: A playing card.
    */
    init(withId id: Int, data: CardData) {
        self.id = id
        self.data = data
    }
    
    static func == (lhs: Card, rhs: Card) -> Bool {
        return lhs.id == rhs.id
    }
    
     /**
      Calling this will duplicate the playing card.
     
       - Returns: Duplicated playing card.
     */
    func copy() -> Card {
        return Card(withId: self.id, data: self.data)
    }
}

extension Card {
    
    ///  Model which holds the properties and information of a single playing card.
    class CardData {
        
        /// The product image to be displayed on the face of a card.
        var productImage: UIImage
        
        /**
         Initalizes a model which holds the properties and information of a single playing card.

         - Parameters:
            - productImage:The product image to be displayed on the face of a card.

         - Returns: A CardData model that holds the properties and information of a single playing card.
         */
        init(productImage: UIImage) {
             self.productImage = productImage
         }
        
        /**
         Initalizes a model which holds the properties and information of a single playing card.

         - Parameters:
            - json:The data of a single product from the Shopify Product API in the format of  type JSON from SwiftyJSON library.

         - Returns: A CardData model that holds the propertise and information of a single playing card.
         */
        convenience init(fromJSON json: JSON) {
            self.init(productImage: UIImage(fromUrl: json["image"]["src"].stringValue))
        }
    }
}
