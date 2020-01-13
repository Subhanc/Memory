//
//  StopWatchView.swift
//  MemorySwiftUI
//
//  Created by Subhan Chaudhry on 2019-09-26.
//  Copyright © 2019 Subhan Chaudhry. All rights reserved.
//

import SwiftUI

/// Label that displays the live  scores associated with the current game. Changes display based on game mode.
struct ScoreLabelView: View {
    
    /// The model which holds all the game information.
    @EnvironmentObject var game: Game
    
    @State var stopWatch = StopWatch()

    var body: some View {
        
        ZStack {
            Text(game.gameMode == .lowestTime ? self.$stopWatch.wrappedValue.stopWatchTime : "Matches: \(String(self.game.player.currentScore)) / \(self.game.gameDetails.numberOfCardPairs)")
                .font(.system(size: 21))
        }
        .frame(width: 168, height: 60)
        .background(Color.white)
        .cornerRadius(30)
        .shadow(color: Color("buttonShadow"), radius: 5.0, y: 2.0)
        .onAppear(perform: {
            if self.game.gameMode == .lowestTime {
                self.stopWatch.start()
            }
        })
    }
}

struct StopWatchView_Previews: PreviewProvider {
    static var previews: some View {
        ScoreLabelView()
    }
}
