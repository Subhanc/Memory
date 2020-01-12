//
//  SelectDifficultyModeView.swift
//  Shopify
//
//  Created by Subhan Chaudhry on 2020-01-03.
//  Copyright © 2020 Subhan Chaudhry. All rights reserved.
//

import SwiftUI

struct SelectDifficultyView: View {
    
    @Binding var game: Game
    
    @State private var tag: Int? = nil
    
    var body: some View {
        
        ZStack {
            ZStack {
                Color.init("ShopifyPink")
                    .edgesIgnoringSafeArea(.all)
                ParrallaxFallingObjectsAnimation()
                .edgesIgnoringSafeArea(.all)
            }
            Spacer()
            VStack(spacing: 40) {
                
                LogoView(title: "Select Difficulty")
                    .font(.body)
                VStack(spacing: 8) {
                    
                    NavigationLink(destination: self.goToGame(), tag: 2, selection: $tag) { EmptyView() }
                    Button(action: {
                        self.game.gameDetails = GameDetails(gameDifficulty: .easy)
                        self.tag = 2
                    }, label: {
                        LargeButton(text: "Easy")
                    })
                    
                    NavigationLink(destination: self.goToGame(), tag: 3, selection: $tag) { EmptyView() }
                    Button(action: {
                        self.game.gameDetails = GameDetails(gameDifficulty: .medium)
                        self.tag = 3
                    }, label: {
                        LargeButton(text: "Medium")
                    })
                    
                    NavigationLink(destination: self.goToGame(), tag: 4, selection: $tag) { EmptyView() }
                    Button(action: {
                        self.game.gameDetails = GameDetails(gameDifficulty: .hard)
                        self.tag = 4
                    }, label: {
                        LargeButton(text: "Hard")
                    })
                }
                Spacer()
            }
        }
    }
    
    func goToGame() -> some View {
        return ContentView().environmentObject(game)
    }
}

