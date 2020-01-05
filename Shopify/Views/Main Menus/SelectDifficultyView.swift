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
    
    
    @State private var presentMe = false
    
    var body: some View {
        
        ZStack {
            ZStack {
                Color.init("ShopifyPink")
                    .edgesIgnoringSafeArea(.all)
            }
            VStack(spacing: 75) {
                
                LogoView(title: "Select Difficulty")
                VStack(spacing: 12) {
                    
                    NavigationLink(destination: self.goToGame(), isActive: $presentMe) { EmptyView() }
                    Button(action: {
                        self.game.gameDetails.difficulty = .veryEasy
                        self.presentMe.toggle()
                    }, label: {
                        LargeButton(text: "Very Easy")
                    })
                    
                    NavigationLink(destination: self.goToGame(), isActive: $presentMe) { EmptyView() }
                    Button(action: {
                        self.game.gameDetails.difficulty = .easy
                        self.presentMe.toggle()
                    }, label: {
                        LargeButton(text: "Easy")
                    })
                    
                    NavigationLink(destination: self.goToGame(), isActive: $presentMe) { EmptyView() }
                    Button(action: {
                        self.game.gameDetails.difficulty = .medium
                        self.presentMe.toggle()
                    }, label: {
                        LargeButton(text: "Medium")
                    })
                    
                    NavigationLink(destination: self.goToGame(), isActive: $presentMe) { EmptyView() }
                    Button(action: {
                        self.game.gameDetails.difficulty = .hard
                        self.presentMe.toggle()
                    }, label: {
                        LargeButton(text: "Hard")
                    })
                }
            }
        }
    }
    
    func goToGame() -> some View {
        return ContentView().environmentObject(game)
    }
}

