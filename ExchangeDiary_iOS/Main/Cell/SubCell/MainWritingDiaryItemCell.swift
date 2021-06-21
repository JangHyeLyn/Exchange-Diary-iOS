//
//  MainWritingDiaryItemCell.swift
//  ExchangeDiary_iOS
//
//  Created by 임수현 on 2021/06/20.
//

import UIKit

class MainWritingDiaryItemCell: UICollectionViewCell {
    @IBOutlet weak var backgroundImageView: UIImageView!
    @IBOutlet weak var tagsView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var groupNameLabel: UILabel!
    @IBOutlet weak var nextTurnLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}
