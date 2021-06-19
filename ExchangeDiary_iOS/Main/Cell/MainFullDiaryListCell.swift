//
//  MainFullDiaryListCell.swift
//  ExchangeDiary_iOS
//
//  Created by 임수현 on 2021/06/20.
//

import UIKit

class MainFullDiaryListCell: UITableViewCell {
    @IBOutlet weak var groupListCollectionView: UICollectionView!
    @IBOutlet weak var diaryListCollectionView: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    @IBAction func touchGroupManageButton(_ sender: Any) {
        print("그룹관리")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
