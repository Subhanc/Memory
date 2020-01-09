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
    
    @State var cardsViewModel: CardsViewModel?


    var body: some View {
        ZStack {
            GameButtons()
            if self.cardsViewModel != nil {
                CardsView(cardsViewModel: self.cardsViewModel!)
            }
            
            if game.isGameOver {
                GameOverView()
            }
            
            if !self.game.isPaused {
                PauseMenuView()
            }
        }
        .navigationBarBackButtonHidden(true)
        .onAppear(perform: {
            self.fetchCards()
        })
    }
    
    func fetchCards() {
        self.cardsViewModel = CardsViewModel(withGame: self.game)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
