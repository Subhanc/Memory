//
//  Template.swift
//  Shopify
//
//  Created by Subhan Chaudhry on 2019-12-31.
//  Copyright © 2019 Subhan Chaudhry. All rights reserved.
//

import SwiftUI

/// Returns a view of the Main Screen of the game, the first view that shows when the game is launched.
struct MainMenu: View {
   
    /// Creates a temporality game object that is overwritten with real values through player preferance selection.
    @State var game: Game = Game(newPlayer: Player(), andGameMode: .regular, andGameDetails: .init(gameDifficulty: .easy), andIsGameOver: false)
    
    init() {
        // Sets the back prompt labels to black.
        UINavigationBar.appearance().tintColor = .black
    }
    
    @State private var presentMe = false
    
    var body: some View {
    
        NavigationView {
            ZStack {
                ZStack {
                    // Sets background color to blue.
                    Color.init("ShopifyBlue")
                        .edgesIgnoringSafeArea(.all)
                    }
                    CardsFallingAnimationView()
                        .edgesIgnoringSafeArea(.all)
                
                VStack() {
                    
                    /// Displays branding logo.
                    LogoView(title: "Memory")
                    
                    VStack(spacing: 40) {
                        // Navigation Link to to the SelectGameMode screen when user presses the 'play' button.
                        NavigationLink(destination: SelectGameModeView(game: $game), isActive: $presentMe) { EmptyView() }
                        Button(action: {
                            self.presentMe.toggle()
                        }, label: {
                            LargeButtonView(title: "Play")
                        })
                        
                        // Sound and Music buttons.
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
