//
//  SelectDifficultyView.swift
//  Shopify
//
//  Created by Subhan Chaudhry on 2020-01-03.
//  Copyright © 2020 Subhan Chaudhry. All rights reserved.
//

import SwiftUI

struct SelectGameModeView: View {
    
    @Binding var game: Game
    @State private var presentMe = false
    
    var body: some View {
        
        ZStack {
            ZStack {
                Color.init("ShopifyGreen")
                    .edgesIgnoringSafeArea(.all)
            }
            VStack(spacing: 75) {
                LogoView(title: "Select Game Mode")
                
                VStack(spacing: 12) {
                    
                    NavigationLink(destination: self.goToDifficulty(), isActive: $presentMe) { EmptyView() }
                    Button(action: {
                        print("test")
                        self.game.gameMode = .lowestTime
                        self.presentMe.toggle()
                    }, label: {
                        LargeButton(text: "Lowest Time")
                    })
                    
                    NavigationLink(destination: self.goToDifficulty(), isActive: $presentMe) { EmptyView() }
                    Button(action: {
                        self.game.gameMode = .accuracy
                        self.presentMe.toggle()
                    }, label: {
                        LargeButton(text: "Accuracy")
                    })
                    
                    NavigationLink(destination: self.goToDifficulty(), isActive: $presentMe) { EmptyView() }
                    Button(action: {
                        self.game.gameMode = .flash
                        self.presentMe.toggle()
                    }, label: {
                        LargeButton(text: "One Shot")
                    })
                }
            }
        }
    }
    
    func goToDifficulty() -> some View {
        return SelectDifficultyView(game: $game)
    }
}
