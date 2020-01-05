//
//  SoundManager.swift
//  Shopify
//
//  Created by Subhan Chaudhry on 2019-12-30.
//  Copyright © 2019 Subhan Chaudhry. All rights reserved.
//

import Foundation

class SoundManager: ObservableObject {
    @Published var isMusicOn: Bool = true
    @Published var isSoundEffectsOn: Bool = true
}
