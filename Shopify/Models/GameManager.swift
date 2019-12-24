//
//  GameManager.swift
//  Shopify
//
//  Created by Subhan Chaudhry on 2019-12-22.
//  Copyright © 2019 Subhan Chaudhry. All rights reserved.
//

import Foundation


class GameManager {

    // Holds all current flipped cards.
    public static let shared = GameManager()
   
    var cardsViewModel: CardsViewModel = .shared
    
    var currentMatchingCards = [Card]()

    
    // Number of cards that a set contains.
    var gameMode = GameDetails(gameDifficulty: .hard)
    
    var totalMatches: Int = 0
 
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
                if currentMatchingCards.count == gameMode.cardsPerMatch {
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
        totalMatches += 1
        if didWinGame() {
            endGame()
        }
    }
    
    private func didWinGame() -> Bool {
        return totalMatches == gameMode.numberOfCardPairs
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
