//
//  GameButtons.swift
//  Shopify
//
//  Created by Subhan Chaudhry on 2019-12-25.
//  Copyright © 2019 Subhan Chaudhry. All rights reserved.
//

import SwiftUI
import Combine

/// Menu bar that is dispalyed on top of the game view. Includes a Pause Button, Score Label, and a Restart Button
struct MenuBar: View {
    
    /// The model which holds all information about the cards field.
    @ObservedObject var cardsViewModel: CardsViewModel
    
    /// The mode lthat holds all information of the game.
    @EnvironmentObject var game: Game
    
    var onRefreshCompletion: () -> Void
    
    var body: some View {
        displayMenuBar()
    }
    /// Displays the menu bar that belongs the game field. This contains a Pause Button, Score Label and Restart Button.
    func displayMenuBar() -> some View {
        ZStack {
            VStack {
                HStack {
                    PauseButtonView()
                    ScoreLabelView().offset(x: 20)
                    Spacer()
                }.offset(x: 10)
                Spacer()
            }
            
            VStack {
                HStack(spacing: 12) {
                    Spacer()
                    RestartButtonView(cardsViewModel: self.cardsViewModel, onRefreshCompletion: self.onRefreshCompletion)
                }.offset(x: -10)
                Spacer()
            }
            Spacer()
        }
    }
}
