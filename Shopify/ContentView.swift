//
//  ContentView.swift
//  Shopify
//
//  Created by Subhan Chaudhry on 2019-11-30.
//  Copyright © 2019 Subhan Chaudhry. All rights reserved.
//

import SwiftUI

struct ContentView: View {
   
   @ObservedObject var cardsViewModel: CardsViewModel = CardsViewModel.shared

   var body: some View {
        ZStack {
            CardsView(cardsViewModel: cardsViewModel)
        }
   }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
