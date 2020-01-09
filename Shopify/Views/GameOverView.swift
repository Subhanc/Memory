//
//  GameOverView.swift
//  Shopify
//
//  Created by Subhan Chaudhry on 2020-01-08.
//  Copyright © 2020 Subhan Chaudhry. All rights reserved.
//

import SwiftUI

struct GameOverView: View {
    
    @EnvironmentObject var game: Game
    
    var body: some View {
        
        ZStack {
            Color.init("ShopifyBlue")
                .edgesIgnoringSafeArea(.all)
            
            AnimationView()
        
            VStack(spacing: 50) {
                
                VStack(spacing: -10) {
                    VStack {
                        LottieView(fileName: "Trophy")
                    }
                    .frame(width: 350, height: 200)
                    
                    Text("Game Over!")
                       .font(.largeTitle)
                       .fontWeight(.heavy)
                       .foregroundColor(.white)
                }
                
                VStack(alignment: .leading) {
                    Text("Your Score: \(game.player.currentScore)")
                        .font(.title)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                    
                    Text("High Score: ---")
                        .font(.title)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                    
                    Text("Mode: \(game.gameMode.toString())")
                        .font(.title)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                    
                    Text("Difficulty: \(game.gameDetails.difficulty.toString())")
                        .font(.title)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                }
                
                VStack(spacing: 12) {
                    LargeButton(text: "Play Again")
                    LargeButton(text: "Main Menu")
                }
            }
        }
    }
}






//            VStack(spacing: 12) {
//                      LargeButton(text: "Play Again")
//                      LargeButton(text: "Main Menu")
//                  }






//VStack {
//

//
//}






struct GameOverView_Previews: PreviewProvider {
    static var previews: some View {
        GameOverView()
    }
}
