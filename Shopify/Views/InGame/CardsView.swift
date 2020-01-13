//
//  CardsView.swift
//  Shopify
//
//  Created by Subhan Chaudhry on 2019-12-16.
//  Copyright © 2019 Subhan Chaudhry. All rights reserved.
//

import SwiftUI

/// View that displays the field of cards.
struct CardsView: View {
    
    /// Model of the cardsView that holds information of the playing cards.
    @ObservedObject var cardsViewModel: CardsViewModel
    
    /// Model of the game that holds all information of the game.
    @EnvironmentObject var game: Game
    
    var body: some View {
        displayCards()
            .padding([.leading, .trailing], 12)
    }
    
    /**
     Calling this will return a view of the cards playing field.
     
     - Returns: View of the cards playing field.
     */
    private func displayCards() -> some View {
        VStack {
            ForEach(0..<self.cardsViewModel.cards.count, id:  \.self) { i in
                HStack {
                    ForEach(0..<self.cardsViewModel.cards[i].count, id: \.self) { j in
                        self.displayCard(at: (i, j))
                            .transition(.move(edge: .trailing))
                    }
                }
            }
        }
    }
    
    /**
     Calling this will return a view of of a single playing card given the x, y index locations.
     
     - Parameters:
     - indexPath: i, j index of the card location in the 2D card array.
     - Returns: View of a single playing card of the given location.
     */
    private func displayCard(at indexPath: (i: Int, j: Int)) -> some View {
        let (i, j) = indexPath
        // Returns a view of a single card.
        return CardView(card: self.$cardsViewModel.cards[i][j])
            // Handles game state when a user taps on a card.
            .onTapGesture {
                // Checks if the card isn't already flipped.
                if !self.cardsViewModel.cards[i][j].isFlipped {
                    withAnimation(.easeOut(duration: 0.2)) {
                        // Flips the card
                        self.cardsViewModel.cards[i][j].isFlipped.toggle()
                        // Sender which will update the view.
                        self.cardsViewModel.objectWillChange.send() // Update view.
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.7) {
                            withAnimation(.easeOut(duration: 0.2)) {
                                // Handles the game state when the user selects the card.
                                let isValidMove = self.game.handleSelectedCard(withCard: &self.cardsViewModel.cards[i][j])
                            }
                        }
                    }
                }
        }
    }
}

