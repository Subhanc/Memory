//
//  MusicButton.swift
//  Shopify
//
//  Created by Subhan Chaudhry on 2019-12-30.
//  Copyright © 2019 Subhan Chaudhry. All rights reserved.
//

import SwiftUI

struct MusicButton: View {
   
    @EnvironmentObject var soundManager: SoundManager
    
    var body: some View {
        
        Button(action: {
            self.soundManager.isMusicOn.toggle()
        }) {
            Image(systemName: self.soundManager.isMusicOn ? "music.note" : "pause")
            .foregroundColor(.black)
            .frame(width: 44, height: 44)
            .background(Color.white)
            .cornerRadius(30)
            .shadow(color: Color("buttonShadow"), radius: 6, x: 4, y: 4)
        }
    }
}
