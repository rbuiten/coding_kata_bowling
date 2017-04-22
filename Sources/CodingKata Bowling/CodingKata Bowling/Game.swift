//
//  Game.swift
//  CodingKata Bowling
//
//  Created by Rick Buiten on 10/04/2017.
//  Copyright © 2017 Sitio IT. All rights reserved.
//

import Foundation

public class Game {
    static let TOTAL_FRAMES = 10
    static let TOTAL_ROLLS_PER_FRAME = 2
    
    var players : [Player] = []
    var activePlayer = 0
    var frame = 0
    
    func addPlayer(player: Player){
        players.append(player)
    }
    
    func nextPlayer(){
        activePlayer += 1
        if activePlayer >= players.count {
            activePlayer = 0
            frame += 1
        }
    }
    
    func startGame(){
        activePlayer = 0
        frame = 0
    }
    
    func throwBall(pins: Int) {
        let player = players[activePlayer]
        print("throw ball for user \(player.name) ");
        
        player.throwBall(frame: frame, pins: pins)
    }
}
