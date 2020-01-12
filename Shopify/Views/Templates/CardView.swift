//
//  CardView.swift
//  Shopify
//
//  Created by Subhan Chaudhry on 2019-11-30.
//  Copyright © 2019 Subhan Chaudhry. All rights reserved.
//

import SwiftUI

struct CardView: View {
    
    /// A single playing card.
    @Binding var card: Card
    
    var body: some View {
        playingCard()
    }
    
    /**
     Calling this will return a constructed playing card composed of a 'cardBackground' and 'cardImage' view.
     
     - Returns: View of the card background.
     */
    private func playingCard() -> some View {
        ZStack {
            cardImage()
            cardBackground()
        }
            // Rotation effect to flip the playing card.
            .rotation3DEffect(.init(degrees: self.card.isFlipped ? 180 : 0), axis: (0, 1, 0))
    }
    
    /**
     Calling this will return a view of the image to be displayed on the playing card.
     
     - Returns: View of the card background.
     */
    private func cardBackground() -> some View {
        Rectangle()
            .frame()
            .aspectRatio(80/100, contentMode: .fit)
            .shadow(radius: 20)
            .foregroundColor(self.card.isFlipped ? .white : Color("ShopifyBlue"))
            .cornerRadius(10)
            .shadow(radius: 20)
            .zIndex(0)
    }
    
    /**
     Calling this will return a view of the card background.
     
     - Returns: View of the card background.
     */
    private func cardImage() -> some View {
        Image(uiImage: self.card.isFlipped ? card.data.productImage : UIImage(named: "ShopifyLogo")!)
            .resizable()
            .aspectRatio(1.0, contentMode: .fit)
            .scaleEffect(self.card.isFlipped ? 1.0 : 0.6)
            .zIndex(1)
            .rotation3DEffect(.init(degrees: self.card.isFlipped ? 180 : 0), axis: (0, 1, 0))
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(card: .constant(Card(withId: 35, data: Card.CardData(productImage: UIImage(named: "ShopifyLogo")!))))
    }
}
