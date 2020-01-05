//
//  LogoView.swift
//  Shopify
//
//  Created by Subhan Chaudhry on 2020-01-03.
//  Copyright © 2020 Subhan Chaudhry. All rights reserved.
//

import SwiftUI

struct LogoView: View {
    var title: String
    var body: some View {
        VStack {
            HStack(spacing: -35) {
                
                CardForLogo(imageName: "GreenProduct")
                    .shadow(color: .black, radius: 4, x: -2, y: 4)
                    .rotationEffect(.init(degrees: -35))
                
                CardForLogo(imageName: "OrangeProduct")
                    .shadow(color: .black, radius: 4, x: -1, y: 2)
                    .offset(y: -25)
                    .rotationEffect(.init(degrees: -10))
                
                CardForLogo(imageName: "YellowProduct")
                    .shadow(color: .black, radius: 4, x: -2, y: 2)
                    .offset(y: -25)
                    .rotationEffect(.init(degrees: 10))
                
                CardForLogo(imageName: "RedProduct")
                    .shadow(color: .black, radius: 4, x: -2, y: 4)
                    .rotationEffect(.init(degrees: 35))
            }
            
            Text(title)
                .multilineTextAlignment(.center)
                .font(.system(size: 52, weight: .bold, design: .rounded))
                .foregroundColor(.white)
                .shadow(color: .black, radius: 10, x: 2, y: 2)
                .offset(y: -5)
        }
    }
}

struct CardForLogo: View {
    
    let imageName: String
    
    var body: some View {
        
        ZStack {
            Rectangle()
                .frame(width: 95, height: 140)
                .foregroundColor(Color.white)
                .cornerRadius(10)
                .shadow(radius: 10)
            
            Image(imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 80, height: 80)
        }
    }
}


struct LogoView_Previews: PreviewProvider {
    static var previews: some View {
        LogoView(title: "Memory")
    }
}
