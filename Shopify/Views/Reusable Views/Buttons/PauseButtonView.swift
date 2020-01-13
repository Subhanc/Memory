//
//  Button.swift
//  Shopify
//
//  Created by Subhan Chaudhry on 2019-12-26.
//  Copyright © 2019 Subhan Chaudhry. All rights reserved.
//

import SwiftUI

/// Returns a button that toggles the on/off state of the pause state of the game.
struct PauseButtonView: View {
    
    /// The model which holds all the game information.
    @EnvironmentObject var game: Game
    
    var body: some View {
        
        Button(action: {
            withAnimation(.easeIn(duration: 0.5)) {
                // Toggles the pause to on/off when the player presses the button.
                self.game.isPaused.toggle()
            }
        })  {
            Image(systemName: self.game.isPaused ? "pause" : "play.fill")
                .foregroundColor(.black)
                .frame(width: 60, height: 60)
                .background(Color.white)
                .cornerRadius(100)
                .shadow(color: Color("buttonShadow"), radius: 10, x: 8, y: 8)
        }
    }
}

