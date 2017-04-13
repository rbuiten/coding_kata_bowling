//
//  main.swift
//  CodingKata Bowling
//
//  Created by Rick Buiten on 10/04/2017.
//  Copyright © 2017 Sitio IT. All rights reserved.
//

import Foundation

let game = Game()
let jairo = Player(name: "Jairo")
let meredith = Player(name: "Meredith")
let rick = Player(name: "Rick")

game.addPlayer(player: jairo)
game.addPlayer(player: meredith)
game.addPlayer(player: rick)
game.startGame()

// Frame 1
game.throwBall(pins: 2)
game.throwBall(pins: 8)
game.nextPlayer()
game.throwBall(pins: 4)
game.throwBall(pins: 4)
game.nextPlayer()
game.throwBall(pins: 0)
game.throwBall(pins: 8)
game.nextPlayer()

// Frame 2
game.throwBall(pins: 5)
game.throwBall(pins: 5)
game.nextPlayer()
game.throwBall(pins: 8)
game.throwBall(pins: 2)
game.nextPlayer()
game.throwBall(pins: 10)
game.nextPlayer()

let totalScoreJairo = jairo.getTotalScore()
print("totalScoreJairo: \(totalScoreJairo)")
assert(totalScoreJairo == 25)
let totalScoreMeredith = meredith.getTotalScore()
print("totalScoreMeredith: \(totalScoreMeredith)")
assert(totalScoreMeredith == 18)
let totalScoreRick = rick.getTotalScore()
print("totalScoreRick: \(totalScoreRick)")
assert(totalScoreRick == 18)




let gamePerfect = Game()
let playerPerfectGame = Player(name: "PERFECT")
gamePerfect.addPlayer(player: playerPerfectGame)
gamePerfect.throwBall(pins: 10)
gamePerfect.nextPlayer()
gamePerfect.throwBall(pins: 10)
gamePerfect.nextPlayer()
gamePerfect.throwBall(pins: 10)
gamePerfect.nextPlayer()
gamePerfect.throwBall(pins: 10)
gamePerfect.nextPlayer()
gamePerfect.throwBall(pins: 10)
gamePerfect.nextPlayer()
gamePerfect.throwBall(pins: 10)
gamePerfect.nextPlayer()
gamePerfect.throwBall(pins: 10)
gamePerfect.nextPlayer()
gamePerfect.throwBall(pins: 10)
gamePerfect.nextPlayer()
gamePerfect.throwBall(pins: 10)
gamePerfect.nextPlayer()
gamePerfect.throwBall(pins: 10)
gamePerfect.throwBall(pins: 10)
gamePerfect.throwBall(pins: 10)
let totalScorePerfectGame = playerPerfectGame.getTotalScore()
print("totalScorePerfectGame: \(totalScorePerfectGame)")
assert(totalScorePerfectGame == 300)




/*
STEPS:

 - Edit Game to loop through players
 - Throw ball by player 
 - Count pins for player
 - Validate max 2 throws
 - Check for bonus
 - Add extra values: 0 game - 300 points perfect game
 - Automatically to nextPlayer

*/
