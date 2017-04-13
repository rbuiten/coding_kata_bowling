//
//  Player.swift
//  CodingKata Bowling
//
//  Created by Rick Buiten on 10/04/2017.
//  Copyright © 2017 Sitio IT. All rights reserved.
//

import Foundation

public class Player {
    
    let name : String
    var rolls : [Roll] = []
    
    init(name: String){
        self.name = name
    }
    
    func getTotalScore() -> Int {
        var totalScore = 0
        var roll = 0
        
        for _ in 1...Game.TOTAL_FRAMES {
            if (isStrike(roll)) {
                totalScore += 10 + strikeBonus(roll)
                roll += 1
            } else if isSpare(roll) {
                totalScore += 10 + spareBonus(roll)
                roll += 2
            } else {
                totalScore += sumOfBallsInFrame(roll)
                roll += 2
            }
        }
        
        return totalScore
    }
    
    func throwBall(frame: Int, pins: Int) {
        rolls.append(Roll(pins: pins))
    }
    
    
    private func isSpare(_ roll: Int) -> Bool {
        return getRollValue(roll) + getRollValue(roll + 1) == 10
    }
    
    private func isStrike(_ roll: Int) -> Bool {
        return getRollValue(roll) == 10
    }
    
    private func strikeBonus(_ roll: Int) -> Int {
        return getRollValue(roll + 1) + getRollValue(roll + 2)
    }
    
    private func spareBonus(_ roll: Int) -> Int {
        return getRollValue(roll + 2)
    }
    
    private func sumOfBallsInFrame(_ roll: Int) -> Int {
        return getRollValue(roll) + getRollValue(roll + 1)
    }
    
    private func getRollValue(_ roll: Int) -> Int {
        if rolls.count > roll {
            return rolls[roll].pins
        }
        return 0
    }
}
