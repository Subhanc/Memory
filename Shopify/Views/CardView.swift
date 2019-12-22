//
//  CardView.swift
//  Shopify
//
//  Created by Subhan Chaudhry on 2019-11-30.
//  Copyright © 2019 Subhan Chaudhry. All rights reserved.
//

import SwiftUI

struct CardView: View {
    
    @Binding var card: Card
    
    var body: some View {
    
        ZStack {
            Image(uiImage: self.card.isFlipped ? card.data.productImage : UIImage(named: "ShopifyLogo")!)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: self.card.isFlipped ? 80 : 50, height: self.card.isFlipped ? 80 : 50)
                .zIndex(1)
                .rotation3DEffect(.init(degrees: self.card.isFlipped ? 180 : 0), axis: (0, 1, 0))
            Rectangle()
                .frame(width: 80, height: 100)
                .shadow(radius: 20)
                .foregroundColor(self.card.isFlipped ? .white : Color("ShopifyBlue"))
                .cornerRadius(10)
                .shadow(radius: 20)
                .zIndex(0)
        }
        .rotation3DEffect(.init(degrees: self.card.isFlipped ? 180 : 0), axis: (0, 1, 0))
    }
    
//    func cardBackgroundRectange() -> some View {
//          Rectangle()
//          .frame(width: 80, height: 100)
//          .shadow(radius: 20)
//          .foregroundColor(Color("ShopifyBlue"))
//          .cornerRadius(10)
//          .shadow(radius: 20)
//      }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(card: .constant(Card(withId: 35, data: Card.CardData(productImage: UIImage(named: "ShopifyLogo")!))))
    }
}
