//
//  GameButtons.swift
//  Shopify
//
//  Created by Subhan Chaudhry on 2019-12-25.
//  Copyright © 2019 Subhan Chaudhry. All rights reserved.
//

import SwiftUI
import Combine

struct GameButtons: View {
  
    @EnvironmentObject var game: Game
    
    var body: some View {
        ZStack {
            ZStack(alignment: .topLeading) {
                PauseButton()
                Spacer()
            }
            VStack() {
                ScoreLabelView()
                Spacer()
            }
        }
    }
}
