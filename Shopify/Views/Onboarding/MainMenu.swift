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
   
    @State var game: Game = Game(newPlayer: Player(), andGameMode: .regular, andGameDetails: .init(gameDifficulty: .easy), andIsGameOver: false)
    
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
                    ParrallaxFallingObjectsAnimation()
                        .edgesIgnoringSafeArea(.all)
                
                VStack() {
                    // LOGO
                    LogoView(title: "Memory")
                    
                    VStack(spacing: 40) {
                        
                        NavigationLink(destination: SelectGameModeView(game: $game), isActive: $presentMe) { EmptyView() }
                        Button(action: {
                            self.presentMe.toggle()
                        }, label: {
                            LargeButtonView(text: "Play")
                        })
                        
                        HStack(alignment: .center, spacing: 35) {
                            SoundButtonView()
                            MusicButtonView()
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
