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

        throwBallMethod1(frame: frame, pins: pins)
        throwBallMethod2(frame: frame, pins: pins)
    }


    private func throwBallMethod1(frame: Int, pins: Int){
        rolls.append(Roll(pins: pins))
    }

    private func calculateMethod1() -> Int {
        var totalScore = 0
        var rollIndex = 0

        for _ in 1...Game.TOTAL_FRAMES {
            if (isStrike(rollIndex)) {
                totalScore += 10 + strikeBonus(rollIndex)
                rollIndex += 1
            } else if isSpare(rollIndex) {
                totalScore += 10 + spareBonus(rollIndex)
                rollIndex += 2
            } else {
                totalScore += sumOfBallsInFrame(rollIndex)
                rollIndex += 2
            }
        }
        return totalScore
    }

    private func isSpare(_ rollIndex: Int) -> Bool {
        return getRollValue(rollIndex) + getRollValue(rollIndex + 1) == 10
    }
    
    private func isStrike(_ rollIndex: Int) -> Bool {
        return getRollValue(rollIndex) == 10
    }
    
    private func strikeBonus(_ rollIndex: Int) -> Int {
        return getRollValue(rollIndex + 1) + getRollValue(rollIndex + 2)
    }
    
    private func spareBonus(_ rollIndex: Int) -> Int {
        return getRollValue(rollIndex + 2)
    }
    
    private func sumOfBallsInFrame(_ rollIndex: Int) -> Int {
        return getRollValue(rollIndex) + getRollValue(rollIndex + 1)
    }
    
    private func getRollValue(_ rollIndex: Int) -> Int {
        if rolls.count > rollIndex {
            return rolls[rollIndex].pins
        }
        return 0
    }




    private func throwBallMethod2(frame: Int, pins: Int){
        var frameRolls = frames[frame] ?? []
        frameRolls.append(Roll(pins: pins))

        // assert stuff
        if Game.TOTAL_FRAMES > frames.count {
            assert(frameRolls.count <= Game.TOTAL_ROLLS_PER_FRAME)
        } else {
            assert(frameRolls.count <= Game.TOTAL_ROLLS_PER_FRAME + 2)
        }

        frames.updateValue(frameRolls, forKey: frame)
    }

    private func calculateMethod2() -> Int {
        var totalScore = 0

        for frame in 0...Game.TOTAL_FRAMES - 1 {
            let rolls = frames[frame] ?? []
        
            if isStrike(rolls) {
                totalScore += 10 + strikeBonusFrame(frame)
            } else if isSpare(rolls) {
                totalScore += 10 + spareBonusFrame(frame)
            } else {
                totalScore += sumOfBallsInFrame(rolls)
            }
        }
        return totalScore
    }

    private func strikeBonusFrame(_ frame: Int) -> Int {
        let rolls = frames[frame + 1] ?? []

        if(isStrike(rolls)){
            let secondRolls = frames[frame + 2] ?? []
            let totalPinsSecondTry = !secondRolls.isEmpty ? secondRolls[0].pins : 0
            return rolls[0].pins + totalPinsSecondTry
        } else if(rolls.count >= 2){
            return rolls[0].pins + rolls[1].pins
        } else {
            return 0
        }
    }

    private func spareBonusFrame(_ frame: Int) -> Int {
        let rolls = frames[frame + 1] ?? []
        if(rolls.count >= 1){
            return rolls[0].pins
        } else {
            return 0
        }
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
