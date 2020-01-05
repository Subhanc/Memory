//
//  GameManager.swift
//  Shopify
//
//  Created by Subhan Chaudhry on 2019-12-22.
//  Copyright © 2019 Subhan Chaudhry. All rights reserved.
//

import Foundation
import SwiftUI
import Combine

/// Model that contains the functions that interact with the game.
class GameManager: ObservableObject {
   
    /// Holds the cards flipped by the player of the current move.
    var currentFlippedCards = [Card]()
    
    /// The game details selected by the player.
    var gameDetails: GameDetails
    
    /// The current player. 
    var player: Player
    
    /**
    Initializes a Game Manager model provided the player and game details.

    - Parameters:
       - difficulty: The difficulty mode selectd by the user.
       - gridSize: Optional: Sets custom grid size given by the user. Only applicable if game difficulty is custom.
       - cardsPerMatch: Optional: Sets the number of cards that complete one set.  Only applicable if game difficulty is custom.

    - Returns: Object that contains all information needeed to initalize a game.
    */
    init(withGameDetails gameDetails: GameDetails, andPlayer player: Player) {
        self.gameDetails = gameDetails
        self.player = player
    }
 
    /**
     Calling this will handle the card selected and update all state of the game accordingly. Examples being the  score, validity of the move, and win state.

     - Parameters:
        - card: The card seleceted by the player. Passed by reference.
     */
    func handleSelectedCard(withCard card: inout Card) {

        // The first card flipped by the user in the current move.
        if currentFlippedCards.isEmpty {
            
            // Adds card to the currently flipped cards array
            currentFlippedCards.append(card)
            
        } else { // The second or more card flipped by the user in the current move.
            
            // Checks if picked card is a valid move.
            let isValidMove = self.isValid(card: &card)
            
            // Add selected card to the currently flipped cards array
            self.currentFlippedCards.append(card)
            
            if isValidMove {
                // Checks if selected card creates a complete match pair set.
                if currentFlippedCards.count == gameDetails.cardsPerMatch {
                    
                    // Handles a successful match set.
                    handleSucessfulPairMatch()
                }
            } else {
                // Handle failed move by player of the cards selected.
                handleFailedMove() 
            }
        }
    }
    
    
    // MARK: Private functions
    
    /// Calling this function will handle a successful card pair match by increasing the users score and if the game has been won.
    private func handleSucessfulPairMatch() {
        
        // Resets the current flipped cards of the current move
        resetCurrentFlippedCards()
        // Adds to player's score.
        player.currentScore += 1
        // Adds to players 'currentMathes'
        player.currentMatches += 1
        
        print("Score: \(player.currentScore)")
        print("Matches: \(player.currentMatches)")
        
        // Checks if the last move caused the game state to win.
        if didWinGame() {
            // If so, end the game.
            endGame()
        }
    }
    
    /**
       Calling this will handle check the win state of the game.

       - Returns: Returns true if the player has won and false if the player has not yet won.
    */
    private func didWinGame() -> Bool {
        return player.currentMatches == gameDetails.numberOfCardPairs
    }
    
    /// Handles everything to be done once the game ends.
    private func endGame() {
        print("You've won the game!")
    }

    /**
    Calling this will perform if the current selected card was a valid move given the most recent card.

    - Parameters:
        - card: The card seleceted by the player. Passed by reference.

    - Returns: Returns true if the last selected card was a valid move and false if not.
    */
    private func isValid(card: inout Card) -> Bool {
          return card == currentFlippedCards.last
    }
    
    /// Handles a failed move by the player. Flips over the cards the player flipped in their most recent move.
    private func handleFailedMove() {
        
        // Flips over all cards that exist in 'currentFlippedCards'.
        for card in currentFlippedCards {
            // Sets flip state to flipped.
            card.isFlipped = false
        }
        // Empty current flipped cards array.
        resetCurrentFlippedCards()
    }
    
    /// Calling this  will reset  'currentFlippedCards' to an empty array.
    private func resetCurrentFlippedCards() {
        self.currentFlippedCards = [] // Reset Cards
    }
}
