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
    
    private let zeroOneManager = ZeroOneManager(num: 301)
    
    @IBOutlet private weak var label: UILabel!
    @IBOutlet private weak var statusLabel: UILabel!
    
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
            let inputKey = Keyboard(rawValue: input) else {
            assertionFailure()
            return
        }
        
        switch inputKey {
        case .return:
            zeroOneManager.changeRound()
        case .tab:
            break
        default:
            if let area = inputManager.getInputArea(for: inputKey) {
                zeroOneManager.input(area)
            }
        }
        
        updateLabel()
    }
    
    private func updateLabel() {
        label.text = "\(zeroOneManager.displayNum)"
        
        if let last = zeroOneManager.rounds.last {
            var status = [String]()
            switch last.status {
            case .throwable:
                status.append("Throw !!")
            case .end:
                status.append("Push Change.")
            case .burst:
                status.append("Burst !!!")
            case .zero:
                status.append("Clear")
            }
            last.point.forEach { status.append("\($0)") }
            
            statusLabel.text = status.joined(separator: "\n")
        }
    }
}
