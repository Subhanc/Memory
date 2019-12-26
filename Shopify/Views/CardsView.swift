//
//  CardsView.swift
//  Shopify
//
//  Created by Subhan Chaudhry on 2019-12-16.
//  Copyright © 2019 Subhan Chaudhry. All rights reserved.
//

import SwiftUI

struct CardsView: View {
     
      // Updates the view if anyhting changes to the cardsVieModel.
      @EnvironmentObject var cardsViewModel: CardsViewModel
      @EnvironmentObject var game: Game
      
      var body: some View {
          VStack {
            ForEach(0..<self.cardsViewModel.cards.count, id:  \.self) { i in
                HStack {
                    ForEach(0..<self.cardsViewModel.cards[i].count, id: \.self) { j in
                        self.displayCard(at: (i, j))
                    }
                 }
             }
          }
      }
    
    func displayCard(at indexPath: (i: Int, j: Int)) -> some View {
        // What does this do?
        let (i, j) = indexPath
        return CardView(card: self.$cardsViewModel.cards[i][j])
        .onTapGesture {
            if !self.cardsViewModel.cards[i][j].isFlipped { // Checks if the card isn't already flipped.
                withAnimation(.easeOut(duration: 0.2)) {
                    self.cardsViewModel.cards[i][j].isFlipped.toggle() 
                    self.cardsViewModel.objectWillChange.send() // Update view.
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.7) {
                        withAnimation(.easeOut(duration: 0.2)) {
                            self.game.gameMananger.isValidMove(to: &self.cardsViewModel.cards[i][j])
                        }
                    }
                }
            }
        }
    }
}

//struct CardsView_Previews: PreviewProvider {
//    static var previews: some View {
////        CardsView(cardsViewModel: .constant(.shared))
//    }
//}
