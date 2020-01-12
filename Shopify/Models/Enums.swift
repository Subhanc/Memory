//
//  Enums.swift
//  Shopify
//
//  Created by Subhan Chaudhry on 2019-12-27.
//  Copyright © 2019 Subhan Chaudhry. All rights reserved.
//

/// Difficulty modes which the user can select from.
enum Difficulty {
    case easy
    case medium
    case hard
    case custom
    
    func toString() -> String {
        switch self {
        case .easy:
            return "Easy"
        case .medium:
            return "Medium"
        case .hard:
            return "Hard"
        case .custom:
            return "Custom"
        }
    }
}

/// Game Modes the user can select from.
enum GameMode {
    case lowestTime
    case accuracy
    case flash
    
    func toString() -> String {
        switch self {
        case .lowestTime:
            return "Lowest Time"
        case .accuracy:
            return "Accuracy"
        case .flash:
            return "Flash"
        }
    }
}
