//
//  MainWritingDiaryItemCell.swift
//  ExchangeDiary_iOS
//
//  Created by 임수현 on 2021/06/20.
//

import UIKit

class MainWritingDiaryItemCell: UICollectionViewCell {
    @IBOutlet weak var coverImageView: UIImageView!
    @IBOutlet weak var tagsView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var groupNameLabel: UILabel!
    @IBOutlet weak var writerLabel: UILabel!
    
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
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
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
