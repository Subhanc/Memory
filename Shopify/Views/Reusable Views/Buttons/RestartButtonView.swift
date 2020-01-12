//
//  RestartButton.swift
//  Shopify
//
//  Created by Subhan Chaudhry on 2020-01-10.
//  Copyright © 2020 Subhan Chaudhry. All rights reserved.
//

import SwiftUI

struct RestartButtonView: View {
    
    /// The model which holds all information about the cards field.
    @ObservedObject var cardsViewModel: CardsViewModel
    
    var onRefreshCompletion: (() -> Void)
    
    var body: some View {
        Button(action: self.onRefreshCompletion) {
            Image(systemName: "arrow.counterclockwise")
                .foregroundColor(.black)
                .frame(width: 60, height: 60)
                .background(Color.white)
                .cornerRadius(100)
                .shadow(color: Color("buttonShadow"), radius: 10, x: 8, y: 8)
        }
    }
}
