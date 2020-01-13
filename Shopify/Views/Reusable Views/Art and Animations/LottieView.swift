//
//  LottieView.swift
//  Shopify
//
//  Created by Subhan Chaudhry on 2020-01-08.
//  Copyright © 2020 Subhan Chaudhry. All rights reserved.
//

import SwiftUI
import Lottie


// Converted view to allow Lottie to be used in SwiftUI. Excecutes a .json Animation with the Lottie Framework.
struct LottieView: UIViewRepresentable {

    /// A Lottie Animation View.
    let animationView = AnimationView()
    
    /// Name of the animation.
    var fileName: String

    /// Creates a lottie animation in the form of a UIView
    func makeUIView(context: UIViewRepresentableContext<LottieView>) -> UIView {
        
        let view = UIView()
        
        let animation = Animation.named(fileName)
        animationView.animation = animation
        animationView.contentMode = .scaleAspectFit
        animationView.play()
        
        animationView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(animationView)
        
        NSLayoutConstraint.activate([
            animationView.heightAnchor.constraint(equalTo: view.heightAnchor),
            animationView.widthAnchor.constraint(equalTo: view.widthAnchor)
        ])
        
        return view
    }
    
    func updateUIView(_ uiView: UIView, context: UIViewRepresentableContext<LottieView>) {
        
    }
}
