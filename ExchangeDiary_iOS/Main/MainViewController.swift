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
    
    override func viewDidLoad() {
        setupTableView()
        super.viewDidLoad()
    }
    
    private func setupTableView() {
        mainTableView.delegate = self
        mainTableView.dataSource = self
        
        let titleCellNib = UINib(nibName: titleCellId, bundle: nil)
        mainTableView.register(titleCellNib, forCellReuseIdentifier: titleCellId)
    }
}

// MARK: - UITableViewDelegate, UITableViewDataSource
extension MainViewController: UITableViewDelegate {
    //
}

extension MainViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            guard let titleCell = mainTableView.dequeueReusableCell(withIdentifier: titleCellId, for: indexPath)
                    as? MainTableViewTitleCell
            else { return UITableViewCell() }
            titleCell.delegate = self
            return titleCell
        default:
            return UITableViewCell()
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
