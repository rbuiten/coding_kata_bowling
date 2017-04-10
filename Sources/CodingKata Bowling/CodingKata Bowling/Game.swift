//
//  Game.swift
//  CodingKata Bowling
//
//  Created by Rick Buiten on 10/04/2017.
//  Copyright © 2017 Sitio IT. All rights reserved.
//

import Foundation

public class Game {
    
    var players : [Player] = []
    var activePlayer : Player?
    
    func addPlayer(player: Player){
        players.append(player)
    }
    
    func nextPlayer(){
        
    }
    
    func startGame(){
    
    }
    
    func throwBall(pins: Int) {
        guard let player = activePlayer else {
            print("OOPS, no user found!")
            return
        }
        
        print("throw ball for user \(player.name)")
    }

}
