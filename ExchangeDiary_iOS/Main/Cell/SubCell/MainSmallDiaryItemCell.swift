//
//  MainSmallDiaryItemCell.swift
//  ExchangeDiary_iOS
//
//  Created by 임수현 on 2021/06/21.
//

import UIKit

class MainSmallDiaryItemCell: UICollectionViewCell {
    // MARK: - UIComponents
    @IBOutlet private weak var coverImageView: UIImageView!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var groupNameLabel: UILabel!
    @IBOutlet private weak var userCountLabel: UILabel!
    @IBOutlet private weak var totalPageLabel: UILabel!
    
    // MARK: - Variables
    private var coverId: Int = 0 {
        didSet { /* 커버 이미지 변경 */ }
    }
    private var title: String = "일기장 제목" {
        didSet { titleLabel.text = title }
    }
    private var groupName: String = "" {
        didSet { groupNameLabel.text = groupName }
    }
    private var userCount: Int = 30 {
        didSet { userCountLabel.text = "\(userCount). " }
    }
    private var page: Int = 30 {
        didSet { totalPageLabel.text = "\(page)p" }
    }
    
    // MARK: - LifeCycle
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    // MARK: - Method
    func setNewData(_ data: Diary) {
        title = data.title
        userCount = data.userCount
        page = data.totalPage
        if let groupId = data.groupId {
            groupName = "그룹 \(groupId)"
        }
    }
}
