//
//  PauseMenu.swift
//  Shopify
//
//  Created by Subhan Chaudhry on 2019-12-29.
//  Copyright © 2019 Subhan Chaudhry. All rights reserved.
//

import SwiftUI

struct PauseMenuView: View {
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    @EnvironmentObject var game: Game
    
    var body: some View {
        
        ZStack {
            ParrallaxFallingObjectsAnimation()
                .edgesIgnoringSafeArea(.all)
            background()
            VStack(spacing: 15)  {
                
                LogoView(title: "Paused")
                
                HStack(spacing: 50) {
                    MusicButton()
                    SoundButton()
                }
                Button(action: {
                    self.game.isPaused.toggle()
                }) {
                    LargeButton(text: "Resume")
                }
                
                Button(action: {
                    self.presentationMode.wrappedValue.dismiss()
                }) {
                    LargeButton(text: "Exit")
                }
            }
        }
    }
    
    func background() -> some View {
        Rectangle()
            .foregroundColor(.init("ShopifyBlue"))
            .frame(width: 350, height: 600)
            .background(Color.white)
            .cornerRadius(30)
            .shadow(color: Color("buttonShadow"), radius: 6, x: 4, y: 4)
    }
}

struct PauseMenu_Previews: PreviewProvider {
    static var previews: some View {
        PauseMenuView()
    }
}
