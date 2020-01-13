//
//  LargeButton.swift
//  Shopify
//
//  Created by Subhan Chaudhry on 2019-12-26.
//  Copyright © 2019 Subhan Chaudhry. All rights reserved.
//

import SwiftUI

/// Returns a Large Button given a title.
struct LargeButtonView: View {
    
    /// Title  to be displayed on the button.
    var title: String
    
    var body: some View {
        Text(title)
            .foregroundColor(.black)
            .font(.title)
            .fontWeight(.bold)
            .frame(width: 300, height: 75)
            .background(Color.white)
            .cornerRadius(37.5)
            .shadow(color: Color("buttonShadow"), radius: 10, x: 2, y: 10)
    }
}

struct LargeButton_Previews: PreviewProvider {
    static var previews: some View {
        LargeButtonView(title: "Button")
    }
}
