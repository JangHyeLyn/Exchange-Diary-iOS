//
//  MainWritingDiaryItemCell.swift
//  ExchangeDiary_iOS
//
//  Created by 임수현 on 2021/06/20.
//

import UIKit

class MainWritingDiaryItemCell: UICollectionViewCell {
    // MARK: - UIComponents
    @IBOutlet private weak var coverImageView: UIImageView!
    @IBOutlet private weak var tagsView: UIView!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var groupNameLabel: UILabel!
    @IBOutlet private weak var writerLabel: UILabel!
    
    // MARK: - Variables
    private var coverId: Int = 0 {
        didSet { /* 커버 이미지 변경 */ }
    }
    private var title: String = "" {
        didSet { titleLabel.text = title }
    }
    private var groupName: String = "" {
        didSet { groupNameLabel.text = groupName }
    }
    private var writer: Int = 0 {
        didSet { writerLabel.text = "\(writer)번 사용자" }
    }
    
    // MARK: - LifeCycle
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    // MARK: - Function
    func setNewData(_ data: Diary) {
        self.coverId = data.coverId
        self.title = data.title
        if let groupId = data.groupId {
            groupName = "그룹\(groupId)"
        } else {
            groupName = ""
        }
        self.writer = data.nowWriterId
    }
}
