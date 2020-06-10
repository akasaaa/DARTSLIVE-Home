//
//  SettingViewController.swift
//  DARTSLIVE-Home
//
//  Created by 赤迫亮太 on 2020/06/07.
//  Copyright © 2020 赤迫亮太. All rights reserved.
//

import UIKit

protocol SettingViewControllerDelegate: AnyObject {
    func shouldDismiss()
}

class SettingViewController: UIViewController {
    
    weak var delegate: SettingViewControllerDelegate?
    
    private let areas = ["double", "outerSingle", "triple", "innerSingle"]
    
    enum AreaGroupingType {
        case num
        case area
    }
    
    enum AreaSortType {
        /// 1, 2, 3, 4 ...
        case ascending
        
        /// 20, 1, 18, 4 ...
        case position
        
        var value: [String] {
            switch self {
            case .ascending:
                return ["01",  "02",  "03",  "04",  "05",
                        "06",  "07",  "08",  "09",  "10",
                        "11",  "12",  "13",  "14",  "15",
                        "16",  "17",  "18",  "19",  "20"]
            case .position:
                return ["20", "01", "18", "04", "13",
                        "06", "10", "15", "02", "17",
                        "03", "19", "07", "16", "08",
                        "11", "14", "09", "12", "05"]
            }
        }
    }
    
    private var areaGroupingType = AreaGroupingType.area
    
    private var areaSortType = AreaSortType.position
    
    private struct InputData {
        let area: InputArea
        private let initialKeyboard: Keyboard?
        var currentKeyboard: Keyboard?
        
        init(area: InputArea, keyboard: Keyboard?) {
            self.area = area
            self.initialKeyboard = keyboard
            self.currentKeyboard = keyboard
        }
        
        var isChanged: Bool {
            switch (initialKeyboard, currentKeyboard) {
            case let (.some(lhs), .some(rhs)):
                return lhs.rawValue != rhs.rawValue
                    || lhs.modifierFlag != rhs.modifierFlag // もしかしたら不要かも
            case (.none, .none):
                return false
            case (.none, .some), (.some, .none):
                return true
            }
        }
    }
    
    private let inputManager = InputManager()
    
    private var dataSource = [[InputData]]()
    
    @IBOutlet private weak var closeButton: UIBarButtonItem!
    
    @IBOutlet weak var sortButton: UIBarButtonItem!
    @IBOutlet private weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        reloadDataSource()
        setupViews()
    }
    
    @IBAction func didTapClose(_ sender: UIBarButtonItem) {
        
        if dataSource.flatMap({ $0 }).contains(where: { $0.isChanged }) {
            showChangedAlert {
                self.delegate?.shouldDismiss()
            }
        } else {
            delegate?.shouldDismiss()
        }
    }
    @IBAction func didTapSort(_ sender: UIBarButtonItem) {
        let vc = R.storyboard.sort.sort()!
        vc.areaGroupingType = areaGroupingType
        vc.areaSortType = areaSortType
        vc.delegate = self
        navigationController?.pushViewController(vc, animated: true)
    }
    
    override var canBecomeFirstResponder: Bool {
        return true
    }
    
    override var keyCommands: [UIKeyCommand]? {
        return Keyboard.allCases.map {
            UIKeyCommand(input: $0.rawValue,
                         modifierFlags: $0.modifierFlag,
                         action: #selector(updateInputKey(_:)))
        }
    }
    
    private func reloadDataSource() {
        let numAreas: [[InputArea]]
        switch areaGroupingType {
        case .num:
            numAreas = areaSortType.value.map { num in
                areas.compactMap { InputArea(rawValue: "\($0)_\(num)") }
            }
        case .area:
            numAreas = areas.map { area in
                areaSortType.value.compactMap { InputArea(rawValue: "\(area)_\($0)") }
            }
        }
        let inputAreas = numAreas + [[.outerBull, .innerBull]]
        
        let allInputs = inputManager.getAllInputs()
        
        self.dataSource = inputAreas.map { areas in
            areas.map { area in
                // 絶対ある
                let row = allInputs.first { $0.area == area }!
                return InputData(area: row.area, keyboard: row.keyboard)
            }
        }
    }
    
    private func setupViews() {
        tableView.dataSource = self
    }
    
    @objc private func updateInputKey(_ keyCommand: UIKeyCommand) {
        
        guard let input = keyCommand.input, let inputKey = Keyboard(rawValue: input) else {
            assertionFailure()
            return
        }
        let selected = tableView.indexPathForSelectedRow ?? [0, 0]
        dataSource[selected.section][selected.row].currentKeyboard = inputKey
        tableView.reloadRows(at: [selected], with: .none)
        
        if selected.row < dataSource[selected.section].count - 1 {
            let next = IndexPath(row: selected.row + 1, section: selected.section)
            tableView.selectRow(at: next, animated: true, scrollPosition: .bottom)
        } else if selected.section < dataSource.count - 1 {
            let next = IndexPath(row: 0, section: selected.section + 1)
            tableView.selectRow(at: next, animated: true, scrollPosition: .bottom)
        } else {
            tableView.selectRow(at: [0, 0], animated: true, scrollPosition: .top)
        }
    }
    
    private func showChangedAlert(handler: (() -> Void)?) {
        let save = UIAlertAction(title: "保存する", style: .default) { [weak self] _ in
            guard let `self` = self else {
                return
            }
            self.dataSource
                .flatMap { $0 }
                .filter { $0.isChanged }
                .forEach { self.inputManager.register($0.currentKeyboard!, for: $0.area) } // nilになるやつはいないはず
            self.reloadDataSource()
            handler?()
        }
        let discard = UIAlertAction(title: "破棄する", style: .destructive) { [weak self] _ in
            self?.reloadDataSource()
            handler?()
        }
        let keepEditing = UIAlertAction(title: "編集を続ける", style: .cancel, handler: nil)
        let controller = UIAlertController(title: "編集中です", message: nil, preferredStyle: .alert)
        controller.addAction(save)
        controller.addAction(discard)
        controller.addAction(keepEditing)
        present(controller, animated: true)
    }
}

extension SettingViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        dataSource.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        dataSource[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let data = dataSource[indexPath.section][indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: data.area.rawValue)
            ?? UITableViewCell(style: .value1, reuseIdentifier: data.area.rawValue)
        cell.textLabel?.text = data.area.rawValue
        cell.detailTextLabel?.text = data.currentKeyboard?.rawValue
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch areaGroupingType {
        case .num:
            return section < areaSortType.value.count
                ? areaSortType.value[section]
                :"Bull"
            
        case .area:
            return section < areas.count
                ? areas[section]
                : "Bull"
        }
    }
    
}

extension SettingViewController: SortViewControllerDelegate {
    func didChange(groupingType: SettingViewController.AreaGroupingType, sortType: SettingViewController.AreaSortType) {
        self.areaGroupingType = groupingType
        self.areaSortType = sortType
        reloadDataSource()
        tableView.reloadData()
    }
}
