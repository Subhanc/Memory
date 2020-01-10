//
//  SoundManager.swift
//  Shopify
//
//  Created by Subhan Chaudhry on 2019-12-30.
//  Copyright © 2019 Subhan Chaudhry. All rights reserved.
//

import Foundation
import AVFoundation

class SoundManager: ObservableObject {
    
    var cardFlipSoundEffect: AVAudioPlayer?
    
    @Published var isMusicOn: Bool = true
    @Published var isSoundEffectsOn: Bool = true
    
    let url = URL(fileURLWithPath: (Bundle.main.path(forResource: "Card-flip-sound-effect.mp3", ofType:nil)!))
    
    func playCardFlipSoundEffect() {
        do {
            cardFlipSoundEffect = try AVAudioPlayer(contentsOf: url)
            cardFlipSoundEffect?.play()
        } catch {
            print("Error in playing Card-flip-sound-effect.mp3")
        }
    }
}
