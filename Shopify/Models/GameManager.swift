//
//  GameManager.swift
//  Shopify
//
//  Created by Subhan Chaudhry on 2019-12-22.
//  Copyright © 2019 Subhan Chaudhry. All rights reserved.
//

import Foundation


class GameManager: ObservableObject {
   
//    var cardsViewModel: CardsViewModel = .shared
    
//    static let shared: GameManager = GameManager(withGame: )
    
    var currentMatchingCards = [Card]()
  
    var gameDetails: GameDetails
    var player: Player
    
    init(withGameDetails gameDetails: GameDetails, andPlayer player: Player) {
        self.gameDetails = gameDetails
        self.player = player
    }
 
    func isValidMove(to card: inout Card) {

        // First card flip move.
        if currentMatchingCards.isEmpty {
            currentMatchingCards.append(card)
        } else { // Second or more move
            
            // Checks if next picked card is a valid move
            let isValidMove = self.isValid(card: &card)
            
            // Add selected card
            self.currentMatchingCards.append(card)
            
            if isValidMove {
                // Handle Win
                if currentMatchingCards.count == gameDetails.cardsPerMatch {
                    handleWinMove()
                }
                // Continue on to the next card.
            } else {
                hideCards() // Handle failed selection of cards
            }
        }
    }
    
    private func handleWinMove() {
        resetCurrentMatchingCards()
        player.currentScore += 1
        if didWinGame() {
            endGame()
        }
    }
    
    private func didWinGame() -> Bool {
        return player.currentScore == gameDetails.numberOfCardPairs
    }
    
    private func endGame() {
        print("You've won the game!")
    }

    private func isValid(card: inout Card) -> Bool {
          return card == currentMatchingCards.last
    }
    
    private func hideCards() {
        for card in currentMatchingCards {
            card.isFlipped = false
        }
        // Empty current matching cards
        resetCurrentMatchingCards()
    }
    
    private func resetCurrentMatchingCards() {
        self.currentMatchingCards = [] // Reset Cards
    }
}
