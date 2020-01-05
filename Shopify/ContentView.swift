//
//  ContentView.swift
//  Shopify
//
//  Created by Subhan Chaudhry on 2019-11-30.
//  Copyright © 2019 Subhan Chaudhry. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var game: Game

    var cardsViewModel: CardsViewModel {
      CardsViewModel(withGame: self.game)
    }

    var body: some View {
        ZStack {
            GameButtons()
            CardsView(cardsViewModel: cardsViewModel)
            
            if !self.game.isPaused {
                PauseMenuView()
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
