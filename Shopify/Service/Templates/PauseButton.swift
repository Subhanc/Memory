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
            self.game.isPaused.toggle()
        })  {
            Image(systemName: self.game.isPaused ? "play.fill" : "pause")
                .foregroundColor(.black)
            .frame(width: 44, height: 44)
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

