////
////  Player.swift
////  Shopify
////
////  Created by Subhan Chaudhry on 2019-12-23.
////  Copyright © 2019 Subhan Chaudhry. All rights reserved.
////
//
import Foundation

class Player: ObservableObject {
    @Published var currentScore: Int = 0
    @Published var highScore: Int = 0
    public static let accessToken: String = "c32313df0d0ef512ca64d5b336a0d7c6"
}
