//
//  Button.swift
//  Shopify
//
//  Created by Subhan Chaudhry on 2019-12-26.
//  Copyright © 2019 Subhan Chaudhry. All rights reserved.
//

import SwiftUI

struct CircleButton: View {
   
    var icon: String
    @Binding var action: Bool
    
    var body: some View {
        
        Button(action: {
            self.action.toggle()
            print("hello world")
            
        })
        {
            Image(systemName: icon)
                .foregroundColor(.black)
        }
        .frame(width: 44, height: 44)
        .background(Color.white)
        .cornerRadius(30)
        .shadow(color: Color("buttonShadow"), radius: 6, x: 4, y: 4)
    }
}
