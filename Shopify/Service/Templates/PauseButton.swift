//
//  Button.swift
//  Shopify
//
//  Created by Subhan Chaudhry on 2019-12-26.
//  Copyright © 2019 Subhan Chaudhry. All rights reserved.
//

import SwiftUI

struct PauseButton: View {
   
    @EnvironmentObject var game: Game

    var body: some View {
        
        Button(action: {
            withAnimation(.easeIn(duration: 0.5)) {
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
//
//struct CircleButton_Previews: PreviewProvider {
//    @State var action: Bool = false
//    static var previews: some View {
//        CircleButton(icon: "pause", action: $action)
//    }
//}

