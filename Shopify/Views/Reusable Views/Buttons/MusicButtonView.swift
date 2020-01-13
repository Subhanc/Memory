//
//  MusicButton.swift
//  Shopify
//
//  Created by Subhan Chaudhry on 2019-12-30.
//  Copyright © 2019 Subhan Chaudhry. All rights reserved.
//

import SwiftUI


/// Returns a button that toggles the on/off state of music audio.
struct MusicButtonView: View {
    
    /// The sound manager which includes all information about the audio..
    @EnvironmentObject var soundManager: SoundManager
    
    var body: some View {
        
        Button(action: {
            // Toggles on/off state when player presses button.
            self.soundManager.isMusicOn.toggle()
        }) {
            ZStack {
                Image(systemName: "music.note")
                    .font(.system(size: 19))
                    .foregroundColor(.black)
                    .frame(width: 60, height: 60)
                    .background(Color.white)
                    .cornerRadius(30)
                    .shadow(color: Color("buttonShadow"), radius: 6, x: 4, y: 4)
                
                 // Adds a crossed out line view if the music audio is turned off.
                if !soundManager.isMusicOn {
                    self.crossedOutLine()
                }
            }
        }
    }
    
    /// Adds a 45 degreest  line to the view which represents an 'off' state.
    func crossedOutLine() -> some View {
        Rectangle()
            .frame(width: 60, height: 3)
            .rotationEffect(.degrees(45))
            .foregroundColor(Color("ShopifyGrey"))
    }
}

