//
//  InputArea.swift
//  DARTSLIVE-Home
//
//  Created by 赤迫亮太 on 2020/06/07.
//  Copyright © 2020 赤迫亮太. All rights reserved.
//

import Foundation

enum InputArea: String, CaseIterable {
    
    case innerSingle_01, innerSingle_02, innerSingle_03, innerSingle_04, innerSingle_05
    case innerSingle_06, innerSingle_07, innerSingle_08, innerSingle_09, innerSingle_10
    case innerSingle_11, innerSingle_12, innerSingle_13, innerSingle_14, innerSingle_15
    case innerSingle_16, innerSingle_17, innerSingle_18, innerSingle_19, innerSingle_20
    
    case outerSingle_01, outerSingle_02, outerSingle_03, outerSingle_04, outerSingle_05
    case outerSingle_06, outerSingle_07, outerSingle_08, outerSingle_09, outerSingle_10
    case outerSingle_11, outerSingle_12, outerSingle_13, outerSingle_14, outerSingle_15
    case outerSingle_16, outerSingle_17, outerSingle_18, outerSingle_19, outerSingle_20
    
    case double_01, double_02, double_03, double_04, double_05
    case double_06, double_07, double_08, double_09, double_10
    case double_11, double_12, double_13, double_14, double_15
    case double_16, double_17, double_18, double_19, double_20
    
    case triple_01, triple_02, triple_03, triple_04, triple_05
    case triple_06, triple_07, triple_08, triple_09, triple_10
    case triple_11, triple_12, triple_13, triple_14, triple_15
    case triple_16, triple_17, triple_18, triple_19, triple_20
    
    case innerBull, outerBull
    
//
//    var num: Int {
//        switch self {
//
//        case .innerSingle_01, .outerSingle_01:
//            return 1
//        case .innerSingle_02, .outerSingle_02:
//            return 2
//        case .innerSingle_03, .outerSingle_03:
//            return 3
//        case .innerSingle_04, .outerSingle_04:
//            return 4
//        case .innerSingle_05, .outerSingle_05:
//            return 5
//        case .innerSingle_06, .outerSingle_06:
//            return 6
//        case .innerSingle_07, .outerSingle_07:
//            return 7
//        case .innerSingle_08, .outerSingle_08:
//            return 8
//        case .innerSingle_09, .outerSingle_09:
//            return 9
//        case .innerSingle_10, .outerSingle_10:
//            return 10
//        case .innerSingle_11, .outerSingle_11:
//            return 11
//        case .innerSingle_12, .outerSingle_12:
//            return 12
//        case .innerSingle_13, .outerSingle_13:
//            return 13
//        case .innerSingle_14, .outerSingle_14:
//            return 14
//        case .innerSingle_15, .outerSingle_15:
//            return 15
//        case .innerSingle_16, .outerSingle_16:
//            return 16
//        case .innerSingle_17, .outerSingle_17:
//            return 17
//        case .innerSingle_18, .outerSingle_18:
//            return 18
//        case .innerSingle_19, .outerSingle_19:
//            return 19
//        case .innerSingle_20, .outerSingle_20:
//            return 20
//
//
//        case .double_01:
//            return 1 * 2
//        case .double_02:
//            return 2 * 2
//        case .double_03:
//            return 3 * 2
//        case .double_04:
//            return 4 * 2
//        case .double_05:
//            return 5 * 2
//        case .double_06:
//            return 6 * 2
//        case .double_07:
//            return 7 * 2
//        case .double_08:
//            return 8 * 2
//        case .double_09:
//            return 9 * 2
//        case .double_10:
//            return 10 * 2
//        case .double_11:
//            return 11 * 2
//        case .double_12:
//            return 12 * 2
//        case .double_13:
//            return 13 * 2
//        case .double_14:
//            return 14 * 2
//        case .double_15:
//            return 15 * 2
//        case .double_16:
//            return 16 * 2
//        case .double_17:
//            return 17 * 2
//        case .double_18:
//            return 18 * 2
//        case .double_19:
//            return 19 * 2
//        case .double_20:
//            return 20 * 2
//
//
//        case .triple_01:
//            return 1 * 3
//        case .triple_02:
//            return 2 * 3
//        case .triple_03:
//            return 3 * 3
//        case .triple_04:
//            return 4 * 3
//        case .triple_05:
//            return 5 * 3
//        case .triple_06:
//            return 6 * 3
//        case .triple_07:
//            return 7 * 3
//        case .triple_08:
//            return 8 * 3
//        case .triple_09:
//            return 9 * 3
//        case .triple_10:
//            return 10 * 3
//        case .triple_11:
//            return 11 * 3
//        case .triple_12:
//            return 12 * 3
//        case .triple_13:
//            return 13 * 3
//        case .triple_14:
//            return 14 * 3
//        case .triple_15:
//            return 15 * 3
//        case .triple_16:
//            return 16 * 3
//        case .triple_17:
//            return 17 * 3
//        case .triple_18:
//            return 18 * 3
//        case .triple_19:
//            return 19 * 3
//        case .triple_20:
//            return 20 * 3
//
//        case .innerBull:
//            return 50
//        case .outerBull:
//            return 25
//        }
//    }
    
//    static var innerSingles: [InputArea] {
//        return [.innerSingle_01, .innerSingle_02, .innerSingle_03, .innerSingle_04, .innerSingle_05,
//                .innerSingle_06, .innerSingle_07, .innerSingle_08, .innerSingle_09, .innerSingle_10,
//                .innerSingle_11, .innerSingle_12, .innerSingle_13, .innerSingle_14, .innerSingle_15,
//                .innerSingle_16, .innerSingle_17, .innerSingle_18, .innerSingle_19, .innerSingle_20]
//    }
//
//    static var outerSingles: [InputArea] {
//        return [.outerSingle_01, .outerSingle_02, .outerSingle_03, .outerSingle_04, .outerSingle_05,
//                .outerSingle_06, .outerSingle_07, .outerSingle_08, .outerSingle_09, .outerSingle_10,
//                .outerSingle_11, .outerSingle_12, .outerSingle_13, .outerSingle_14, .outerSingle_15,
//                .outerSingle_16, .outerSingle_17, .outerSingle_18, .outerSingle_19, .outerSingle_20]
//    }
//
//    static var doubles: [InputArea] {
//        return [.double_01, .double_02, .double_03, .double_04, .double_05,
//                .double_06, .double_07, .double_08, .double_09, .double_10,
//                .double_11, .double_12, .double_13, .double_14, .double_15,
//                .double_16, .double_17, .double_18, .double_19, .double_20]
//    }
//
//    static var triples: [InputArea] {
//        return [.triple_01, .triple_02, .triple_03, .triple_04, .triple_05,
//                .triple_06, .triple_07, .triple_08, .triple_09, .triple_10,
//                .triple_11, .triple_12, .triple_13, .triple_14, .triple_15,
//                .triple_16, .triple_17, .triple_18, .triple_19, .triple_20]
//    }
//
//    static var bulls: [InputArea] {
//        return [.innerBull, .outerBull]
//    }
    static var innerSingles: [InputArea] {
        return [.innerSingle_20, .innerSingle_01, .innerSingle_18, .innerSingle_04, .innerSingle_13,
                .innerSingle_06, .innerSingle_10, .innerSingle_15, .innerSingle_02, .innerSingle_17,
                .innerSingle_03, .innerSingle_19, .innerSingle_07, .innerSingle_16, .innerSingle_08,
                .innerSingle_11, .innerSingle_14, .innerSingle_09, .innerSingle_12, .innerSingle_05]
    }
    
    static var outerSingles: [InputArea] {
        return [.outerSingle_20, .outerSingle_01, .outerSingle_18, .outerSingle_04, .outerSingle_13,
                .outerSingle_06, .outerSingle_10, .outerSingle_15, .outerSingle_02, .outerSingle_17,
                .outerSingle_03, .outerSingle_19, .outerSingle_07, .outerSingle_16, .outerSingle_08,
                .outerSingle_11, .outerSingle_14, .outerSingle_09, .outerSingle_12, .outerSingle_05]
    }
    
    static var doubles: [InputArea] {
        return [.double_20, .double_01, .double_18, .double_04, .double_13,
                .double_06, .double_10, .double_15, .double_02, .double_17,
                .double_03, .double_19, .double_07, .double_16, .double_08,
                .double_11, .double_14, .double_09, .double_12, .double_05]
    }
    
    static var triples: [InputArea] {
        return [.triple_20, .triple_01, .triple_18, .triple_04, .triple_13,
                .triple_06, .triple_10, .triple_15, .triple_02, .triple_17,
                .triple_03, .triple_19, .triple_07, .triple_16, .triple_08,
                .triple_11, .triple_14, .triple_09, .triple_12, .triple_05]
    }
    
    static var bulls: [InputArea] {
        return [.innerBull, .outerBull]
    }
    
    var numberForZeroOne: Int {
        switch self {
        case .innerSingle_01, .outerSingle_01:
            return 1
        case .innerSingle_02, .outerSingle_02:
            return 2
        case .innerSingle_03, .outerSingle_03:
            return 3
        case .innerSingle_04, .outerSingle_04:
            return 4
        case .innerSingle_05, .outerSingle_05:
            return 5
        case .innerSingle_06, .outerSingle_06:
            return 6
        case .innerSingle_07, .outerSingle_07:
            return 7
        case .innerSingle_08, .outerSingle_08:
            return 8
        case .innerSingle_09, .outerSingle_09:
            return 9
        case .innerSingle_10, .outerSingle_10:
            return 10
        case .innerSingle_11, .outerSingle_11:
            return 11
        case .innerSingle_12, .outerSingle_12:
            return 12
        case .innerSingle_13, .outerSingle_13:
            return 13
        case .innerSingle_14, .outerSingle_14:
            return 14
        case .innerSingle_15, .outerSingle_15:
            return 15
        case .innerSingle_16, .outerSingle_16:
            return 16
        case .innerSingle_17, .outerSingle_17:
            return 17
        case .innerSingle_18, .outerSingle_18:
            return 18
        case .innerSingle_19, .outerSingle_19:
            return 19
        case .innerSingle_20, .outerSingle_20:
            return 20
            
            
        case .double_01:
            return 1 * 2
        case .double_02:
            return 2 * 2
        case .double_03:
            return 3 * 2
        case .double_04:
            return 4 * 2
        case .double_05:
            return 5 * 2
        case .double_06:
            return 6 * 2
        case .double_07:
            return 7 * 2
        case .double_08:
            return 8 * 2
        case .double_09:
            return 9 * 2
        case .double_10:
            return 10 * 2
        case .double_11:
            return 11 * 2
        case .double_12:
            return 12 * 2
        case .double_13:
            return 13 * 2
        case .double_14:
            return 14 * 2
        case .double_15:
            return 15 * 2
        case .double_16:
            return 16 * 2
        case .double_17:
            return 17 * 2
        case .double_18:
            return 18 * 2
        case .double_19:
            return 19 * 2
        case .double_20:
            return 20 * 2
            
            
        case .triple_01:
            return 1 * 3
        case .triple_02:
            return 2 * 3
        case .triple_03:
            return 3 * 3
        case .triple_04:
            return 4 * 3
        case .triple_05:
            return 5 * 3
        case .triple_06:
            return 6 * 3
        case .triple_07:
            return 7 * 3
        case .triple_08:
            return 8 * 3
        case .triple_09:
            return 9 * 3
        case .triple_10:
            return 10 * 3
        case .triple_11:
            return 11 * 3
        case .triple_12:
            return 12 * 3
        case .triple_13:
            return 13 * 3
        case .triple_14:
            return 14 * 3
        case .triple_15:
            return 15 * 3
        case .triple_16:
            return 16 * 3
        case .triple_17:
            return 17 * 3
        case .triple_18:
            return 18 * 3
        case .triple_19:
            return 19 * 3
        case .triple_20:
            return 20 * 3
            
        case .innerBull, .outerBull:
            return 50
        }
    }
    
}

/*
 
 num ascending
 double_01, outerSingle_01, triple_01, innerSingle_01,
 double_02, outerSingle_02, triple_02, innerSingle_02,
 
 num position
 double_20, outerSingle_20, triple_20, innerSingle_20,
 double_01, outerSingle_01, triple_01, innerSingle_01,
 
 area ascending
 double_01, double_02, double_03, double_04 ...
 outerSingle_01, outerSingle_02, outerSingle_03, ....
 
 area position
 double_20, double_01, double_18, double_04 ...
 outerSingle_20, outerSingle_01, outerSingle_18, ....
 
 
 case innerSingle_01, innerSingle_02, innerSingle_03, innerSingle_04, innerSingle_05
 case innerSingle_06, innerSingle_07, innerSingle_08, innerSingle_09, innerSingle_10
 case innerSingle_11, innerSingle_12, innerSingle_13, innerSingle_14, innerSingle_15
 case innerSingle_16, innerSingle_17, innerSingle_18, innerSingle_19, innerSingle_20
 
 case outerSingle_01, outerSingle_02, outerSingle_03, outerSingle_04, outerSingle_05
 case outerSingle_06, outerSingle_07, outerSingle_08, outerSingle_09, outerSingle_10
 case outerSingle_11, outerSingle_12, outerSingle_13, outerSingle_14, outerSingle_15
 case outerSingle_16, outerSingle_17, outerSingle_18, outerSingle_19, outerSingle_20
 
 case double_01, double_02, double_03, double_04, double_05
 case double_06, double_07, double_08, double_09, double_10
 case double_11, double_12, double_13, double_14, double_15
 case double_16, double_17, double_18, double_19, double_20
 
 case triple_01, triple_02, triple_03, triple_04, triple_05
 case triple_06, triple_07, triple_08, triple_09, triple_10
 case triple_11, triple_12, triple_13, triple_14, triple_15
 case triple_16, triple_17, triple_18, triple_19, triple_20
 
 case innerBull, outerBull
 */
