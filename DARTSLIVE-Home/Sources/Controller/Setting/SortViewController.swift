//
//  SortViewController.swift
//  DARTSLIVE-Home
//
//  Created by 赤迫亮太 on 2020/06/10.
//  Copyright © 2020 赤迫亮太. All rights reserved.
//

import UIKit

protocol SortViewControllerDelegate: AnyObject {
    func didChange(groupingType: SettingViewController.AreaGroupingType, sortType: SettingViewController.AreaSortType)
}

class SortViewController: UIViewController {
    
    weak var delegate: SortViewControllerDelegate?
    
    var areaGroupingType = SettingViewController.AreaGroupingType.area
    
    var areaSortType = SettingViewController.AreaSortType.position
    
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
    }
    
}

extension SortViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let reuseIdentifier = "\(indexPath.section), \(indexPath.row)"
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier)
            ?? UITableViewCell(style: .default, reuseIdentifier: reuseIdentifier)
        switch (indexPath.section, indexPath.row) {
        case (0, 0):
            cell.textLabel?.text = "エリアごと (double_x, double_y...)"
            cell.accessoryType = areaGroupingType == .area ? .checkmark : .none
        case (0, 1):
            cell.textLabel?.text = "数字ごと (double_01, outerSingle_01...)"
            cell.accessoryType = areaGroupingType == .num ? .checkmark : .none
        case (1, 0):
            cell.textLabel?.text = "数字順 (1, 2, 3...)"
            cell.accessoryType = areaSortType == .ascending ? .checkmark : .none
        case (1, 1):
            cell.textLabel?.text = "配置順 (20, 1, 18...)"
            cell.accessoryType = areaSortType == .position ? .checkmark : .none
        default:
            break
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return "グルーピング"
        case 1:
            return "表示順"
        default:
            return nil
        }
    }
}

extension SortViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        switch (indexPath.section, indexPath.row) {
        case (0, 0):
            areaGroupingType = .area
        case (0, 1):
            areaGroupingType = .num
        case (1, 0):
            areaSortType = .ascending
        case (1, 1):
            areaSortType = .position
        default:
            break
        }
        delegate?.didChange(groupingType: areaGroupingType, sortType: areaSortType)
        tableView.reloadData()
    }
}
