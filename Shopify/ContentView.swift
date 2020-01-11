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
    
    @State var isGameLoading: Bool = true


    var body: some View {
        ZStack {
            
            ActivityIndicator(isAnimating: $isGameLoading, style: .large)
          
            if cardsViewModel != nil {
                MenuBar(cardsViewModel: cardsViewModel!)
            }
           
            if !isGameLoading {
                CardsView(cardsViewModel: self.cardsViewModel!)
                    .transition(.scale(scale: 0.0, anchor: .bottomTrailing))
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
        if let cardsViewModel = self.cardsViewModel {
            cardsViewModel.loadCards {
                withAnimation {
                    self.isGameLoading = false
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


struct ActivityIndicator: UIViewRepresentable {

    @Binding var isAnimating: Bool
    let style: UIActivityIndicatorView.Style

    func makeUIView(context: UIViewRepresentableContext<ActivityIndicator>) -> UIActivityIndicatorView {
        return UIActivityIndicatorView(style: style)
    }

    func updateUIView(_ uiView: UIActivityIndicatorView, context: UIViewRepresentableContext<ActivityIndicator>) {
        isAnimating ? uiView.startAnimating() : uiView.stopAnimating()
    }
}
