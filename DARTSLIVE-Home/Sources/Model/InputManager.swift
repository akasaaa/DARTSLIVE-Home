//
//  InputManager.swift
//  DARTSLIVE-Home
//
//  Created by 赤迫亮太 on 2020/06/07.
//  Copyright © 2020 赤迫亮太. All rights reserved.
//

import Foundation

class InputManager {
    
    private let userDefault = UserDefaults.standard
    
    init() {}
    
    /*
     ゲーム中
     keyboard -> InputArea
     
     登録時
     keyboard : InputArea両方ある
     
     登録画面
     InputArea -> Keyboard
     
     
     
     */
    
    func register(_ keyboard: Keyboard, for area: InputArea) {
        guard keyboard != .return && keyboard != .tab else {
            assertionFailure("想定外のkey")
            return
        }
        // TODO: Realmに保存してKeyboardをPKとする
        userDefault.set(area.rawValue, forKey: keyboard.rawValue)
    }
    
    func getInputArea(for key: Keyboard) -> InputArea? {
        guard let value = userDefault.string(forKey: key.rawValue) else {
            return nil
        }
        
        return InputArea(rawValue: value)
    }
    
    func getAllInputs() -> [(area: InputArea, keyboard: Keyboard?)] {
        
        let dictionary = userDefault.dictionaryRepresentation()
        
        return InputArea.allCases.map { area in
            guard let row = dictionary.first(where: { ($0.value as? String) == area.rawValue }) else {
                return (area: area, keyboard: nil)
            }
            return (area: area, keyboard: Keyboard(rawValue: row.key))
        }
    }
}
