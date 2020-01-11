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
    
    var successfulMatchSoundEffect: AVAudioPlayer?
    
    @Published var isMusicOn: Bool = true
    @Published var isSoundEffectsOn: Bool = true
    
    let cardFlipSoundURL = URL(fileURLWithPath: (Bundle.main.path(forResource: "Card-flip-sound-effect.mp3", ofType:nil)!))
    let succesfulMatchSoundURL = URL(fileURLWithPath: (Bundle.main.path(forResource: "gem-collect-sparkle.mp3", ofType:nil)!))
    
    func playCardFlipSoundEffect() {
        do {
            self.cardFlipSoundEffect = try AVAudioPlayer(contentsOf: cardFlipSoundURL)
            self.cardFlipSoundEffect?.play()
        } catch {
            print("Error in playing Card-flip-sound-effect.mp3")
        }
    }
    
    func playSuccesfulMatchSoundEffect() {
        do {
            self.successfulMatchSoundEffect = try AVAudioPlayer(contentsOf: succesfulMatchSoundURL)
            self.successfulMatchSoundEffect?.play()
        } catch {
            print("Error in playing Succesful Match Sound Effect")
        }
    }
}
