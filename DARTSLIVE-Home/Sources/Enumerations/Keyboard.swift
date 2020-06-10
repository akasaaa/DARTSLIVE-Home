//
//  Keyboard.swift
//  DARTSLIVE-Home
//
//  Created by 赤迫亮太 on 2020/06/07.
//  Copyright © 2020 赤迫亮太. All rights reserved.
//

import UIKit

enum Keyboard: String, CaseIterable {
    case lower_a = "a"
    case lower_b = "b"
    case lower_c = "c"
    case lower_d = "d"
    case lower_e = "e"
    case lower_f = "f"
    case lower_g = "g"
    case lower_h = "h"
    case lower_i = "i"
    case lower_j = "j"
    case lower_k = "k"
    case lower_l = "l"
    case lower_m = "m"
    case lower_n = "n"
    case lower_o = "o"
    case lower_p = "p"
    case lower_q = "q"
    case lower_r = "r"
    case lower_s = "s"
    case lower_t = "t"

    case upper_a = "A"
    case upper_b = "B"
    case upper_c = "C"
    case upper_d = "D"
    case upper_e = "E"
    case upper_f = "F"
    case upper_g = "G"
    case upper_h = "H"
    case upper_i = "I"
    case upper_j = "J"
    case upper_k = "K"
    case upper_l = "L"
    case upper_m = "M"
    case upper_n = "N"
    case upper_o = "O"
    case upper_p = "P"
    case upper_q = "Q"
    case upper_r = "R"
    case upper_s = "S"
    case upper_t = "T"
    case upper_u = "U"
    case upper_v = "V"
    case upper_w = "W"
    case upper_x = "X"
    case upper_y = "Y"
    case upper_z = "Z"

    case num_1 = "1"
    case num_2 = "2"
    case num_3 = "3"
    case num_4 = "4"
    case num_5 = "5"
    case num_6 = "6"
    case num_7 = "7"
    case num_8 = "8"
    case num_9 = "9"
    case num_0 = "0"

    case sign_hyphen = "-"
    case sign_equal = "="
    case sign_leftBracket = "["
    case sign_rightBracket = "]"
    case sign_backslash = "\\"
    case sign_semiColon = ";"
    case sign_singleQuote = "'"
    case sign_comma = ","
    case sign_period = "."
    case sign_slash = "/"
    case sign_exclamation = "!"
    case sign_at = "@"
    case sign_hash = "#"
    case sign_dollar = "$"
    case sign_percent = "%"
    case sign_caret = "^"
    case sign_and = "&"
    case sign_asterisk = "*"
    case sign_leftParen = "("
    case sign_underscore = "_"
    case sign_plus = "+"
    case sign_colon = ":"
    case sign_doubleQuote = "\""
    case sign_lessThan = "<"
    case sign_greaterThan = ">"
    case sign_question = "?"

    /// 改行文字(changeボタン固定)
    case `return` = "\r"
    /// タブ(startボタン固定)
    case `tab` = "\t"
    
    var modifierFlag: UIKeyModifierFlags {
        switch self {
        case.lower_a, .lower_b, .lower_c, .lower_d, .lower_e,
            .lower_f, .lower_g, .lower_h, .lower_i, .lower_j,
            .lower_k, .lower_l, .lower_m, .lower_n, .lower_o,
            .lower_p, .lower_q, .lower_r, .lower_s, .lower_t,
            
            .num_1, .num_2, .num_3, .num_4, .num_5,
            .num_6, .num_7, .num_8, .num_9, .num_0,
            
            .sign_hyphen,       .sign_equal,       .sign_leftBracket,
            .sign_rightBracket, .sign_backslash,   .sign_semiColon,
            .sign_singleQuote,  .sign_comma,       .sign_period,
            .sign_slash,        .sign_exclamation, .sign_at,
            .sign_hash,         .sign_dollar,      .sign_percent,
            .sign_caret,        .sign_and,         .sign_asterisk,
            .sign_leftParen,    .sign_underscore,  .sign_plus,
            .sign_colon,        .sign_doubleQuote, .sign_lessThan,
            .sign_greaterThan,  .sign_question,
            
            .`return`, .`tab`:
            return []
        case .upper_a, .upper_b, .upper_c, .upper_d, .upper_e,
             .upper_f, .upper_g, .upper_h, .upper_i, .upper_j,
             .upper_k, .upper_l, .upper_m, .upper_n, .upper_o,
             .upper_p, .upper_q, .upper_r, .upper_s, .upper_t,
             .upper_u, .upper_v, .upper_w, .upper_x, .upper_y, .upper_z:
            return .shift
        }
    }
}
