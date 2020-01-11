//
//  InfoButton.swift
//  Shopify
//
//  Created by Subhan Chaudhry on 2020-01-10.
//  Copyright © 2020 Subhan Chaudhry. All rights reserved.
//

import SwiftUI

struct InfoButton: View {
    var body: some View {
        Button(action: {
        })  {
            Image(systemName: "questionmark")
                .foregroundColor(.black)
                .frame(width: 60, height: 60)
                .background(Color.white)
                .cornerRadius(100)
                .shadow(color: Color("buttonShadow"), radius: 10, x: 8, y: 8)
        }
    }
}

struct InfoButton_Previews: PreviewProvider {
    static var previews: some View {
        InfoButton()
    }
}
  
