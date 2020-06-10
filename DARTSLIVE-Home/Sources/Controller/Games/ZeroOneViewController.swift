//
//  ZeroOneViewController.swift
//  DARTSLIVE-Home
//
//  Created by 赤迫亮太 on 2020/06/09.
//  Copyright © 2020 赤迫亮太. All rights reserved.
//

import UIKit

class ZeroOneViewController: UIViewController {
    
    private let inputManager = InputManager()
    
    @IBOutlet weak var label: UILabel!
    
    var gameNum = 301
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateLabel()
    }
    
    
    override var keyCommands: [UIKeyCommand]? {
        return Keyboard.allCases.map {
            UIKeyCommand(input: $0.rawValue,
                         modifierFlags: $0.modifierFlag,
                         action: #selector(input(_:)))
        }
    }
    
    @objc private func input(_ keyCommand: UIKeyCommand) {
        
        guard let input = keyCommand.input,
            let inputKey = Keyboard(rawValue: input),
            let inputArea = inputManager.getInputArea(for: inputKey) else {
            assertionFailure()
            return
        }
        let num = inputArea.numberForZeroOne
        
        if gameNum - num >= 0 {
            gameNum -= num
        } else {
            // ホントはバーストとかやるけど
        }
        updateLabel()
    }
    
    private func updateLabel() {
        label.text = "\(gameNum)"
    }
}
