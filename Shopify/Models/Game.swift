//
//  Game.swift
//  Shopify
//
//  Created by Subhan Chaudhry on 2019-12-24.
//  Copyright © 2019 Subhan Chaudhry. All rights reserved.
//

import Foundation
import SwiftUI

/// Model that holds all information of the game.
class Game: ObservableObject {
    
    /// The current player
    @Published var player: Player
    /// The game mode selected by the player.
    var gameMode: GameMode
    /// The game details selected by the player.
    var gameDetails: GameDetails
    /// The property to check the paused state of the game
    @Published var isPaused: Bool = true
    
    @Published var isGameOver: Bool = false
    
    @EnvironmentObject var soundManager: SoundManager
    
    /// Holds the cards flipped by the player of the current move.
    var currentFlippedCards = [Card]()
    
    /**
     Initializes game information provided the player, game mode and game details.
     
     - Parameters:
     - player: The current player
     - gameMode: The game mode selected by the player.
     - gameDetails: The game details selected by the player.
     
     - Returns: Game model that holds all information of the game.
     */
    init(newPlayer player: Player, andGameMode gameMode: GameMode, andGameDetails gameDetails: GameDetails, andIsGameOver isGameOver: Bool) {
        self.player = player
        self.gameMode = gameMode
        self.gameDetails = gameDetails
        self.isGameOver = isGameOver
    }
    
    /**
     Calling this will handle the card selected and update all state of the game accordingly. Examples being the  score, validity of the move, and win state.
     
     - Parameters:
     - card: The card seleceted by the player. Passed by reference.
     */
    func handleSelectedCard(withCard card: inout Card) -> Bool {
        
        // The first card flipped by the user in the current move.
        if self.currentFlippedCards.isEmpty {
            
            // Adds card to the currently flipped cards array
            self.currentFlippedCards.append(card)
            return true
            
        } else { // The second or more card flipped by the user in the current move.
            
            // Checks if picked card is a valid move.
            let isValidMove = self.isValid(card: &card)
            
            // Add selected card to the currently flipped cards array
            self.currentFlippedCards.append(card)
            
            if isValidMove {
                // Checks if selected card creates a complete match pair set.
                if currentFlippedCards.count == gameDetails.cardsPerMatch {
                    
                    // Handles a successful match set.
                    self.handleSucessfulPairMatch()
                    return true
                }
            } else {
                // Handle failed move by player of the cards selected.
                handleFailedMove()
            }
            return false
        }
    }
    
    // MARK: Private functions
    
    /// Calling this function will handle a successful card pair match by increasing the users score and if the game has been won.
    private func handleSucessfulPairMatch() {
        
        // Resets the current flipped cards of the current move
        resetCurrentFlippedCards()
        // Adds to player's score.
        self.player.currentScore += 1
        // Adds to players 'currentMathes'
        self.player.currentMatches += 1
        
        self.objectWillChange.send()
        
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
        self.isGameOver = true
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
        
        
        if self.gameMode == .oneShot {
            self.endGame()
        }
        
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
    
    func resetGameStats() {
        self.player.currentScore = 0
        self.player.currentMatches = 0
        self.resetCurrentFlippedCards()
    }
}
