//
//  ZeroOneManager.swift
//  DARTSLIVE-Home
//
//  Created by 赤迫亮太 on 2020/06/10.
//  Copyright © 2020 赤迫亮太. All rights reserved.
//

import Foundation

class ZeroOneManager {
    
    class Round {
        var point = [Int]()
        
        let throwableNum: Int
        
        init(throwableNum: Int) {
            self.throwableNum = throwableNum
        }
        
        var status: RoundStatus {
            let total = point.reduce(0, +)
            
            guard total != throwableNum else {
                return .zero
            }
            
            guard total < throwableNum else {
                return .burst
            }
            
            guard point.count < 3 else {
                return .end
            }
            
            return .throwable
        }
    }
    
    enum RoundStatus {
        case throwable
        case end
        case zero
        case burst
    }
    
    private var num: Int
    
    private(set) var rounds = [Round]()
    
    var displayNum: Int {
        guard let last = rounds.last else {
            return num
        }
        return num - last.point.reduce(0, +)
    }
    
    
    init(num: Int = 301) {
        self.num = num
        self.rounds = [Round(throwableNum: num)]
    }
    
    func input(_ area: InputArea) {
        guard let last = rounds.last, last.status == .throwable else {
            // なにもしない
            return
        }
        let point = area.numberForZeroOne
        last.point.append(point)
    }
    
    func changeRound() {
        guard let last = rounds.last else {
            assertionFailure()
            return
        }
        
        switch last.status {
        case .throwable, .end:
            num -= last.point.reduce(0, +)
            rounds.append(Round(throwableNum: num))
        case .zero:
            num = 0
        case .burst:
            rounds.append(Round(throwableNum: num))
        }
        
    }
    
}
