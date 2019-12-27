//
//  LargeButton.swift
//  Shopify
//
//  Created by Subhan Chaudhry on 2019-12-26.
//  Copyright © 2019 Subhan Chaudhry. All rights reserved.
//

import SwiftUI

struct LargeButton: View {
    
    var text: String
    var body: some View {
        
        Text(text)
            .foregroundColor(.black)
            .font(.title)
            .fontWeight(.bold)
            .frame(width: 270, height: 80)
            .background(Color.white)
            .cornerRadius(60)
            .shadow(color: Color("buttonShadow"), radius: 4, x: 4, y: 4)
    }
}

struct LargeButton_Previews: PreviewProvider {
    static var previews: some View {
        LargeButton(text: "Button")
    }
}
