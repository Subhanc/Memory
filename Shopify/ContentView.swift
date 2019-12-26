//
//  ContentView.swift
//  Shopify
//
//  Created by Subhan Chaudhry on 2019-11-30.
//  Copyright © 2019 Subhan Chaudhry. All rights reserved.
//

import SwiftUI

struct ContentView: View {
   
   @EnvironmentObject var cardsViewModel: CardsViewModel
   @EnvironmentObject var game: Game

   var body: some View {
        ZStack {
            CardsView()
        }
   }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
