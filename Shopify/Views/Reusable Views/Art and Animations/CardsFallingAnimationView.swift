//
//  Animation.swift
//  Shopify
//
//  Created by Subhan Chaudhry on 2020-01-07.
//  Copyright © 2020 Subhan Chaudhry. All rights reserved.
//

import SwiftUI

/// This returns a convereted CAEmitterLayer to SwiftUI View of a parrallax animation of falling card objects.
struct CardsFallingAnimationView: View {
    
    /// The images that will be used in the animation.
    var images:[UIImage] = [Images.orangeAlien, Images.greenAlien, Images.yellowAlien, Images.redAlien]
    
    /// The velocties in which the images will move.
    var velocities:[Int] = [100, 90, 75, 80]
    
    var body: some View {
        ParticlesEmitter {
            return self.getCells()
        }
        .emitterShape(.line)
        .emitterSize(CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height))
        .emitterPosition(CGPoint(x: UIScreen.main.bounds.width/2, y: 0))
        .opacity(0.5)
    }
    
    /// Returns a random velocity from 'velocities'
    private func getRandomVelocity() -> Int {
        return velocities[getRandomNumber()]
    }
    
    /// Returns a random number from  0-3
    private func getRandomNumber() -> Int {
        return Int(arc4random_uniform(4))
    }
       
    /// Returns the next image in Images.
    private func getNextImage(i:Int) -> UIImage {
           return images[i % 4]
    }
    
    /// Returns an array of EmitterCells that will be used for the animation.
    func getCells() -> [EmitterCell] {
        var cells = [EmitterCell]()
        for i in 0...5 {
            let cell = EmitterCell()
                        .lifetime(20)
                        .birthRate(1.5)
                        .spin(2)
                        .velocity(CGFloat(getRandomVelocity()))
                        .velocityRange(0)
                        .emissionLongitude(CGFloat(Double.pi))
                        .spinRange(0)
                        .content(.image(self.getNextImage(i: i)))
                        .scaleRange(0.15)
                        .scale(0.1)
            cells.append(cell)
        }
        return cells
    }
}

/// The images that will be used in the animations.
enum Images {
    static let orangeAlien = UIImage(named: "OrangeAlien")!
    static let greenAlien = UIImage(named: "GreenAlien")!
    static let yellowAlien = UIImage(named: "YellowAlien")!
    static let redAlien = UIImage(named: "RedAlien")!
}


struct Animation_Previews: PreviewProvider {
    static var previews: some View {
        CardsFallingAnimationView()
    }
}
