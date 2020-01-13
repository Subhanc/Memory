//
//  SelectDifficultyView.swift
//  Shopify
//
//  Created by Subhan Chaudhry on 2020-01-03.
//  Copyright © 2020 Subhan Chaudhry. All rights reserved.
//

import SwiftUI
import UIKit

/// Returns a View of Select Game Mode screen that alllows a player to select the different game modes available.
struct SelectGameModeView: View {
    
    /// The model that holds all information of the game.
    @Binding var game: Game
    
    /// Handles which navigation was pressed to prevent navigation bugs.
    @State private var tag: Int? = nil
    
    var body: some View {
        
        ZStack {
            ZStack {
                // Sets background colour to green.
                Color.init("ShopifyGreen")
                    .edgesIgnoringSafeArea(.all)
                CardsFallingAnimationView()
                    .edgesIgnoringSafeArea(.all)
            }
            VStack(spacing: 40) {
                
                // Branding Logo
                LogoView(title: "Select Game")
                
                // Different Buttons that display the game mode available to the player.
                VStack(spacing: 8) {
                    
                    // Regular game mode button
                    NavigationLink(destination: self.goToDifficulty(), tag: 2, selection: $tag) { EmptyView() }
                    Button(action: {
                        self.game.gameMode = .regular
                        self.tag = 2
                    }, label: {
                        LargeButtonView(title: "Regular")
                    })
                    
                    // Lowest Time game mode button
                    NavigationLink(destination: self.goToDifficulty(), tag: 1, selection: $tag) { EmptyView() }
                    Button(action: {
                        print("test")
                        self.game.gameMode = .lowestTime
                        self.tag = 1
                    }, label: {
                        LargeButtonView(title: "Lowest Time")
                    })
                    
                    // One Shot game mode button.
                    NavigationLink(destination: self.goToDifficulty(), tag: 3, selection: $tag) { EmptyView() }
                    Button(action: {
                        self.game.gameMode = .oneShot
                        self.tag = 2
                    }, label: {
                        LargeButtonView(title: "One Shot")
                    })
                }
                Spacer()
            }
        }
    }
    
    /// Calling this will navigation to the Select Difficulty screen.
    func goToDifficulty() -> some View {
        return SelectDifficultyView(game: $game)
    }
}
