//
//  GameButtons.swift
//  Shopify
//
//  Created by Subhan Chaudhry on 2019-12-25.
//  Copyright © 2019 Subhan Chaudhry. All rights reserved.
//

import SwiftUI
import Combine

struct MenuBar: View {
    
    @ObservedObject var cardsViewModel: CardsViewModel
    
    @EnvironmentObject var game: Game
    
    var onRefreshCompletion: () -> Void
    
    var body: some View {
        ZStack {
            VStack {
                HStack {
                    PauseButton()
                    ScoreLabelView().offset(x: 20)
                    Spacer()
                }.offset(x: 10)
                Spacer()
            }
            
            VStack {
                HStack(spacing: 12) {
                    Spacer()
                    RestartButton(cardsViewModel: self.cardsViewModel, onRefreshCompletion: self.onRefreshCompletion)
                }.offset(x: -10)
                Spacer()
            }
            Spacer()
        }
    }
    
}
