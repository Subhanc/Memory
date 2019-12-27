//
//  GameManager.swift
//  Shopify
//
//  Created by Subhan Chaudhry on 2019-12-22.
//  Copyright © 2019 Subhan Chaudhry. All rights reserved.
//

import Foundation


class GameManager: ObservableObject {
   
    var currentFlippedCards = [Card]()
  
    var gameDetails: GameDetails
    var player: Player
    
    init(withGameDetails gameDetails: GameDetails, andPlayer player: Player) {
        self.gameDetails = gameDetails
        self.player = player
    }
 
    func isValidMove(to card: inout Card) {

        // First card flip move.
        if currentFlippedCards.isEmpty {
            currentFlippedCards.append(card)
        } else { // Second or more move
            
            // Checks if next picked card is a valid move
            let isValidMove = self.isValid(card: &card)
            
            // Add selected card
            self.currentFlippedCards.append(card)
            
            if isValidMove {
        
                // Handle Win
                if currentFlippedCards.count == gameDetails.cardsPerMatch {
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
        player.currentMatches += 1
        
        print("Score: \(player.currentScore)")
        print("Matches: \(player.currentMatches)")
        
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
          return card == currentFlippedCards.last
    }
    
    private func hideCards() {
        for card in currentFlippedCards {
            card.isFlipped = false
        }
        // Empty current matching cards
        resetCurrentMatchingCards()
    }
    
    private func resetCurrentMatchingCards() {
        self.currentFlippedCards = [] // Reset Cards
    }
}
