//
//  MainViewController.swift
//  DARTSLIVE-Home
//
//  Created by 赤迫亮太 on 2020/06/07.
//  Copyright © 2020 赤迫亮太. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func didTapStart(_ sender: UIButton) {
        let vc = R.storyboard.gameSelect.gameSelect()!
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func didTapSetting(_ sender: UIButton) {
        let vc = R.storyboard.setting.setting()!
        vc.delegate = self
        let navigation = UINavigationController(rootViewController: vc)
        navigation.modalPresentationStyle = .fullScreen
        present(navigation, animated: true)
    }
}

extension MainViewController: SettingViewControllerDelegate {
    func shouldDismiss() {
        navigationController?.dismiss(animated: true)
    }
}
