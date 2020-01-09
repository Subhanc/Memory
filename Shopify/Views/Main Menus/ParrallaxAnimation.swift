//
//  Animation.swift
//  Shopify
//
//  Created by Subhan Chaudhry on 2020-01-07.
//  Copyright © 2020 Subhan Chaudhry. All rights reserved.
//

import SwiftUI

struct AnimationView: View {
    
    var images:[UIImage] = [Images.orangeAlien, Images.greenAlien, Images.yellowAlien, Images.redAlien]
    
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
    
    private func getRandomVelocity() -> Int {
        return velocities[getRandomNumber()]
    }
    
    private func getRandomNumber() -> Int {
        return Int(arc4random_uniform(4))
    }
       
    private func getNextImage(i:Int) -> UIImage {
           return images[i % 4]
    }
    
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

enum Images {
    static let orangeAlien = UIImage(named: "OrangeAlien")!
    static let greenAlien = UIImage(named: "GreenAlien")!
    static let yellowAlien = UIImage(named: "YellowAlien")!
    static let redAlien = UIImage(named: "RedAlien")!
}


struct Animation_Previews: PreviewProvider {
    static var previews: some View {
        AnimationView()
    }
}
