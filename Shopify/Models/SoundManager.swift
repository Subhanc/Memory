//
//  SoundManager.swift
//  Shopify
//
//  Created by Subhan Chaudhry on 2019-12-30.
//  Copyright © 2019 Subhan Chaudhry. All rights reserved.
//

import Foundation
import AVFoundation

/// Handles  all audio functionality of the game.
class SoundManager: ObservableObject {
    
    /// The audio player for the card flip sound effect.
    var cardFlipSoundEffect: AVAudioPlayer?
    
    /// The audio player foer ther card flip sound effect.
    var successfulMatchSoundEffect: AVAudioPlayer?
    
    /// Controls the state if music audio is enabled by the user.
    @Published var isMusicOn: Bool = true
    /// Controls the state if sound effects audio is enabled by the user.
    @Published var isSoundEffectsOn: Bool = true
    
    // The location URL of card-flip-sound-effect.mp3
    let cardFlipSoundURL = URL(fileURLWithPath: (Bundle.main.path(forResource: "card-flip-sound-effect.mp3", ofType:nil)!))
    // The location URL of success-sparkle-sound-effect.mp3
    let succesfulMatchSoundURL = URL(fileURLWithPath: (Bundle.main.path(forResource: "success-sparkle-sound-effect.mp3", ofType:nil)!))
    
    /// This plays the card-flip-sound-effect.mp3 once.
    func playCardFlipSoundEffect() {
        do {
            self.cardFlipSoundEffect = try AVAudioPlayer(contentsOf: cardFlipSoundURL)
            self.cardFlipSoundEffect?.play()
        } catch {
            print("Error in playing card-flip-sound-effect.mp3")
        }
    }
    
    /// This plays the success-sparkle-sound-effect.mp3 once.
    func playSuccessSparkSoundEffect() {
        do {
            self.successfulMatchSoundEffect = try AVAudioPlayer(contentsOf: succesfulMatchSoundURL)
            self.successfulMatchSoundEffect?.play()
        } catch {
            print("Error in playing success-sparkle-sound-effect")
        }
    }
}
