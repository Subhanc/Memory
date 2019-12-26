////
////  Player.swift
////  Shopify
////
////  Created by Subhan Chaudhry on 2019-12-23.
////  Copyright © 2019 Subhan Chaudhry. All rights reserved.
////
//
import Foundation

class Player {
    // Current score a user has obtained in the current game
    var currentScore: Int = 0
    // Current card pair matches made in the current game
    var currentMatches: Int = 0

    // Key to access Shopify API
    public static let accessToken: String = "c32313df0d0ef512ca64d5b336a0d7c6"
}
