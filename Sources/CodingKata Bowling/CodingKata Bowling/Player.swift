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
    var frames : [Int: [Roll]] = [:]

    init(name: String){
        self.name = name
    }
    
    func getTotalScore() -> Int {

        let totalScoreMethod1 = calculateMethod1()
        let totalScoreMethod2 = calculateMethod2()

        assert(totalScoreMethod1 == totalScoreMethod2)

        return totalScoreMethod1
    }
    
    func throwBall(frame: Int, pins: Int) {
        var frameRolls = frames[frame] ?? []
        frameRolls.append(Roll(pins: pins))

        // assert stuff
        if Game.TOTAL_FRAMES > frames.count {
            assert(frameRolls.count <= Game.TOTAL_ROLLS_PER_FRAME)
        }
        
        frames.updateValue(frameRolls, forKey: frame)
        rolls.append(Roll(pins: pins))
    }
    

    private func calculateMethod1() -> Int {
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




    private func calculateMethod2() -> Int {
        var totalScore = 0

        for frame in 0...Game.TOTAL_FRAMES - 1 {
            let rolls = frames[frame] ?? []
        
            if isStrike(rolls) {
                totalScore += 10 + strikeBonus(frame)
            } else if isSpare(rolls) {
                totalScore += 10 + spareBonus(frame)
            } else {
                totalScore += sumOfBallsInFrame(rolls)
            }
        }
        return totalScore
    }

    private func isSpare(_ rolls: [Roll]) -> Bool {
        return rolls.count == 2 && rolls[0].pins + rolls[1].pins == 10
    }

    private func isStrike(_ rolls: [Roll]) -> Bool {
        return rolls.count == 1 && rolls[0].pins == 10
    }

    private func sumOfBallsInFrame(_ rolls: [Roll]) -> Int {
        var totalScore = 0
        for roll in rolls {
            totalScore += roll.pins
        }
        return totalScore
    }
}
