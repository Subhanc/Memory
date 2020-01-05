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
            ZStack {
                Image(systemName: "music.note")
                    .font(.system(size: 19))
                    .foregroundColor(.black)
                    .frame(width: 60, height: 60)
                    .background(Color.white)
                    .cornerRadius(30)
                    .shadow(color: Color("buttonShadow"), radius: 6, x: 4, y: 4)
                
                if !soundManager.isMusicOn {
                    crossedOutLine()
                }
            }
        }
    }
    
    func crossedOutLine() -> some View {
        Rectangle()
            .frame(width: 60, height: 3)
            .rotationEffect(.degrees(45))
            .foregroundColor(Color("ShopifyGrey"))
    }
}

