//
//  GameSelectViewController.swift
//  DARTSLIVE-Home
//
//  Created by 赤迫亮太 on 2020/06/09.
//  Copyright © 2020 赤迫亮太. All rights reserved.
//

import UIKit

class GameSelectViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    private func show301() {
        let vc = R.storyboard.zeroOne.zeroOne()!
        navigationController?.pushViewController(vc, animated: true)
    }
    
}

extension GameSelectViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
        cell.textLabel?.text = "301"
        return cell
    }
}

extension GameSelectViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        show301()
    }
}
