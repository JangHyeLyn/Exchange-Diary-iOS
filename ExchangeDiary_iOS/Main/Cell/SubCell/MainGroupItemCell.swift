//
//  MainGroupItemCell.swift
//  ExchangeDiary_iOS
//
//  Created by 임수현 on 2021/06/21.
//

import UIKit

class MainGroupItemCell: UICollectionViewCell {
    // MARK: - UIComponents
    @IBOutlet private weak var groupNameLabel: UILabel!
    @IBOutlet private weak var indicatorView: UIView!
    
    // MARK: - Variables
    private var groupName: String = "그룹명" {
        didSet { groupNameLabel.text = groupName }
    }

    // MARK: - LifeCycle
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    // MARK: - Functions
    func setGroupName(_ name: String) {
        self.groupName = name
    }
}
