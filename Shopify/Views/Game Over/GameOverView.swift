//
//  GameOverView.swift
//  Shopify
//
//  Created by Subhan Chaudhry on 2020-01-08.
//  Copyright © 2020 Subhan Chaudhry. All rights reserved.
//

import SwiftUI


/// The view to be dispalyed when the game has ended. .
struct GameOverView: View {
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    /// The model that holds all information of the game.
    @EnvironmentObject var game: Game
    
    var onPlayAgainCompletion: () -> Void
    
    var body: some View {
        ZStack {
            // Sets the background colour to green.
            Color.init("ShopifyGreen")
                .edgesIgnoringSafeArea(.all)
            
            // Card falling animation.
            CardsFallingAnimationView()
                .edgesIgnoringSafeArea(.all)
            
            VStack(alignment: .center, spacing: 50) {
                VStack() {
                    Text(game.gameMode.toString())
                        .font(.system(size: 52))
                        .fontWeight(.heavy)
                        .foregroundColor(.white)
                    ZStack {
                        LottieView(fileName: "trophy")
                    }
                    .frame(width: 350, height: 200)
                    
                    Text("Game Over!")
                        .font(.largeTitle)
                        .fontWeight(.heavy)
                        .foregroundColor(.white)
                    
                    if game.gameMode == .oneShot {
                        Text(game.player.currentMatches == game.gameDetails.numberOfCardPairs ? "You Win!" : "You Lose!")
                            .font(.largeTitle)
                            .fontWeight(.heavy)
                            .foregroundColor(.white)
                    }
                }
                
                VStack(alignment: .leading) {
                    Text("Matches Made: \(game.player.currentMatches)")
                        .font(.title)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                    
                    Text("Difficulty: \(game.gameDetails.difficulty.toString())")
                        .font(.title)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                }
                
                VStack(spacing: 12) {
                    Button(action: self.onPlayAgainCompletion, label: {
                        LargeButtonView(title: "Play Again")
                    })
                    Button(action: {
                        self.presentationMode.wrappedValue.dismiss()
                    }, label: {
                        LargeButtonView(title: "Main Menu")
                    })
                }
            }
        }
    }
}
