//
//  SelectDifficultyView.swift
//  Shopify
//
//  Created by Subhan Chaudhry on 2020-01-03.
//  Copyright © 2020 Subhan Chaudhry. All rights reserved.
//

import SwiftUI
import UIKit

struct SelectGameModeView: View {
    
    @Binding var game: Game
    @State private var tag: Int? = nil
    
    var body: some View {
        
        ZStack {
            ZStack {
                Color.init("ShopifyGreen")
                    .edgesIgnoringSafeArea(.all)
                AnimationView()
                .edgesIgnoringSafeArea(.all)
            }
            VStack(spacing: 75) {
                LogoView(title: "Select Game Mode")
                
                VStack(spacing: 8) {
                    
                    NavigationLink(destination: self.goToDifficulty(), tag: 1, selection: $tag) { EmptyView()
                    }
                    
                    Button(action: {
                         print("test")
                         self.game.gameMode = .lowestTime
                        self.tag = 1
                     }, label: {
                         LargeButton(text: "Lowest Time")
                     })
                    
                    NavigationLink(destination: self.goToDifficulty(), tag: 2, selection: $tag) { EmptyView() }
                    Button(action: {
                        self.game.gameMode = .accuracy
                        self.tag = 2
                    }, label: {
                        LargeButton(text: "Accuracy")
                    })
                    
                    NavigationLink(destination: self.goToDifficulty(), tag: 3, selection: $tag) { EmptyView() }
                    Button(action: {
                        self.game.gameMode = .flash
                        self.tag = 2
                    }, label: {
                        LargeButton(text: "One Shot")
                    })
                }
                Spacer()
            }
        }
    }
    
    func goToDifficulty() -> some View {
        return SelectDifficultyView(game: $game)
    }
}
