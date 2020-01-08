//
//  Template.swift
//  Shopify
//
//  Created by Subhan Chaudhry on 2019-12-31.
//  Copyright © 2019 Subhan Chaudhry. All rights reserved.
//

import SwiftUI
// Lets do the play screen!!

struct MainMenu: View {
   
    @State var game: Game = Game(newPlayer: Player(), andGameMode: .accuracy, andGameDetails: .init(gameDifficulty: .veryEasy))
    
    init() {
        UINavigationBar.appearance().tintColor = .black
    }
    
    @State private var presentMe = false
    
    var body: some View {
    
        NavigationView {
            ZStack {
                // Background
                ZStack {
                        Color.init("ShopifyBlue")
                            .edgesIgnoringSafeArea(.all)
                    }
                    AnimationView()
                        .edgesIgnoringSafeArea(.all)
                
                VStack() {
                    // LOGO
                    LogoView(title: "Memory")
                    
                    VStack(spacing: 40) {
                        
                        NavigationLink(destination: SelectGameModeView(game: $game), isActive: $presentMe) { EmptyView() }
                        Button(action: {
                            print("hi")
                            self.presentMe.toggle()
                        }, label: {
                            LargeButton(text: "Play")
                        })
                        
                        HStack(alignment: .center, spacing: 35) {
                            SoundButton()
                            MusicButton()
                        }
                        
                        VStack {
                            Text("Made by Subhan Chaudhry.")
                                .foregroundColor(.white)
                                .opacity(0.5)
                        }
                    }
                    
                    Spacer()
                }
            }
        }
    }
}
