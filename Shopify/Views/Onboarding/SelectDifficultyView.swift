//
//  SelectDifficultyModeView.swift
//  Shopify
//
//  Created by Subhan Chaudhry on 2020-01-03.
//  Copyright © 2020 Subhan Chaudhry. All rights reserved.
//

import SwiftUI

/// Returns a View of Select Game Difficulty screen that alllows a player to select the different difficulty  modes available.
struct SelectDifficultyView: View {
    
    /// The model that holds all information of the game.
    @Binding var game: Game
    
    /// Handles which navigation was pressed to prevent navigation bugs.
    @State private var tag: Int? = nil
    
    var body: some View {
        
        ZStack {
            ZStack {
                // Sets background to pink
                Color.init("ShopifyPink")
                    .edgesIgnoringSafeArea(.all)
                // Animation of cards falling
                CardsFallingAnimationView()
                    .edgesIgnoringSafeArea(.all)
            }
            Spacer()
            VStack(spacing: 40) {
                
                // Branding Logo.
                LogoView(title: "Select Difficulty")
                
                VStack(spacing: 8) {
                    
                    // Easy difficulty button
                    NavigationLink(destination: self.goToGame(), tag: 2, selection: $tag) { EmptyView() }
                    Button(action: {
                        self.game.gameDetails = GameDetails(gameDifficulty: .easy)
                        self.tag = 2
                    }, label: {
                        LargeButtonView(title: "Easy")
                    })
                    
                    // Medium difficulty button
                    NavigationLink(destination: self.goToGame(), tag: 3, selection: $tag) { EmptyView() }
                    Button(action: {
                        self.game.gameDetails = GameDetails(gameDifficulty: .medium)
                        self.tag = 3
                    }, label: {
                        LargeButtonView(title: "Medium")
                    })
                    
                    
                    // Hard difficulty button
                    NavigationLink(destination: self.goToGame(), tag: 4, selection: $tag) { EmptyView() }
                    Button(action: {
                        self.game.gameDetails = GameDetails(gameDifficulty: .hard)
                        self.tag = 4
                    }, label: {
                        LargeButtonView(title: "Hard")
                    })
                }
                Spacer()
            }
        }
    }
    
    /// Calling this navigation to the Content View which display the game.
    func goToGame() -> some View {
        return ContentView().environmentObject(game)
    }
}

