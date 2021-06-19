//
//  MainViewController.swift
//  ExchangeDiary_iOS
//
//  Created by 임수현 on 2021/05/30.
//

import UIKit

class MainViewController: UIViewController {
    @IBOutlet weak var mainTableView: UITableView!
    
    let titleCellId = "MainTableViewTitleCell"
    let writingCellId = "MainWritingDiaryListCell"
    let fullCellId = "MainFullDiaryListCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }
    
    private func setupTableView() {
        mainTableView.delegate = self
        mainTableView.dataSource = self
        mainTableView.separatorColor = .clear
        
        let titleCellNib = UINib(nibName: titleCellId, bundle: nil)
        mainTableView.register(titleCellNib, forCellReuseIdentifier: titleCellId)
        
        let writingCellNib = UINib(nibName: writingCellId, bundle: nil)
        mainTableView.register(writingCellNib, forCellReuseIdentifier: writingCellId)
        
        let fullCellNib = UINib(nibName: fullCellId, bundle: nil)
        mainTableView.register(fullCellNib, forCellReuseIdentifier: fullCellId)
    }
}

// MARK: - UITableViewDelegate, UITableViewDataSource
extension MainViewController: UITableViewDelegate { }

extension MainViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            guard let titleCell = mainTableView.dequeueReusableCell(withIdentifier: titleCellId, for: indexPath)
                    as? MainTableViewTitleCell else { return .init() }
            titleCell.delegate = self
            return titleCell
            
        case 1:
            guard let writingCell = mainTableView.dequeueReusableCell(withIdentifier: writingCellId, for: indexPath)
                    as? MainWritingDiaryListCell else { return .init() }
            return writingCell
            
        case 2:
            guard let fullCell = mainTableView.dequeueReusableCell(withIdentifier: fullCellId, for: indexPath)
                    as? MainFullDiaryListCell else { return .init() }
            return fullCell
            
        default:
            return .init()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0:
            return 46
        case 1:
            return 458
        case 2:
            let line = 1 // 다이어리 개수 (3개단위)
            if line == 0 {
                return view.safeAreaLayoutGuide.layoutFrame.height - (46 + 458 + 8)
            }
            return CGFloat(90 + 16 + (line * 165) + 24)
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        switch section {
        case 0:
            return 0
        case 1:
            return 8
        case 2:
            return 0
        default:
            return 0
        }
    }
}

// MARK: - MainTableViewTitleDelegate
extension MainViewController: MainTableViewTitleDelegate {
    func addDiary() {
        print("Add Diary")
    }
    func showAlert() {
        print("Show Alert")
    }
    func showProfile() {
        print("Show Profile")
    }
}
