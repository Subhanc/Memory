//
//  UIImage+UIImageDownloader.swift
//  Shopify
//
//  Created by Subhan Chaudhry on 2019-11-30.
//  Copyright © 2019 Subhan Chaudhry. All rights reserved.
//


import UIKit

extension UIImage {
    /** Creates a UIImage from a given URL String. Downloads from web and sets its image. */
    convenience init(fromUrl url: String) {
        // Creates URL using url String
        let imageURL = URL(string: url)
        // Attempts to download image
        
        if let imageData = try? Data(contentsOf: imageURL!) {
            self.init(data: imageData)!
        } else {
            print("Failed to download image from: \(url)")
            self.init()
        }
    }
}
    
