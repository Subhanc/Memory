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
            Image(systemName: self.soundManager.isSoundEffectsOn ? "speaker.2.fill" : "speaker.slash.fill")
            .foregroundColor(.black)
            .frame(width: 44, height: 44)
            .background(Color.white)
            .cornerRadius(30)
            .shadow(color: Color("buttonShadow"), radius: 6, x: 4, y: 4)
        }
    }
}

struct SoundButton_Previews: PreviewProvider {
    static var previews: some View {
        SoundButton()
    }
}
