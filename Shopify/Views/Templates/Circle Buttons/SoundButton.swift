//
//  SoundButton.swift
//  Shopify
//
//  Created by Subhan Chaudhry on 2019-12-31.
//  Copyright © 2019 Subhan Chaudhry. All rights reserved.
//

import SwiftUI

struct SoundButton: View {
    
    @EnvironmentObject var soundManager: SoundManager
    
    var body: some View {
        
        Button(action: {
            self.soundManager.isSoundEffectsOn.toggle()
        }) {
            ZStack {
                Image(systemName: "speaker.2.fill")
                    .font(.system(size: 19))
                    .foregroundColor(.black)
                    .frame(width: 60, height: 60)
                    .background(Color.white)
                    .cornerRadius(30)
                    .shadow(color: Color("buttonShadow"), radius: 6, x: 4, y: 4)
                
                if !soundManager.isSoundEffectsOn {
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

struct SoundButton_Previews: PreviewProvider {
    static var previews: some View {
        SoundButton()
    }
}
