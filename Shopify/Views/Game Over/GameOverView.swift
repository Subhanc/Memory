//
//  GameOverView.swift
//  Shopify
//
//  Created by Subhan Chaudhry on 2020-01-08.
//  Copyright © 2020 Subhan Chaudhry. All rights reserved.
//

import SwiftUI

struct GameOverView: View {
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    @EnvironmentObject var game: Game
    
    var onPlayAgainCompletion: () -> Void
    
    var body: some View {
        ZStack {
            Color.init("ShopifyGreen")
                .edgesIgnoringSafeArea(.all)
            
            ParrallaxFallingObjectsAnimation()
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
                    Text("Number of Matches: \(game.player.currentMatches)")
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
                        LargeButtonView(text: "Play Again")
                    })
                    Button(action: {
                        self.presentationMode.wrappedValue.dismiss()
                    }, label: {
                        LargeButtonView(text: "Main Menu")
                    })
                }
            }
        }
    }
}
