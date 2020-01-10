//
//  StopWatchView.swift
//  MemorySwiftUI
//
//  Created by Subhan Chaudhry on 2019-09-26.
//  Copyright © 2019 Subhan Chaudhry. All rights reserved.
//

import SwiftUI

struct ScoreLabelView: View {
    
    @EnvironmentObject var game: Game
    
    @State var stopWatch = StopWatch()
    
    var body: some View {
        
        ZStack {
            Text(game.gameMode == .lowestTime ? self.stopWatch.stopWatchTime : "Score: " + String(self.game.player.currentScore))
                .font(.custom("courier", size: 21))
        }
        .frame(width: 150, height: 44)
        .background(Color.white)
        .cornerRadius(30)
        .shadow(color: Color("buttonShadow"), radius: 5.0, y: 2.0)
    }
}

struct StopWatchView_Previews: PreviewProvider {
    static var previews: some View {
        ScoreLabelView()
    }
}
