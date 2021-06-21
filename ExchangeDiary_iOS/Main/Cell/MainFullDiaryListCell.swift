//
//  MainFullDiaryListCell.swift
//  ExchangeDiary_iOS
//
//  Created by 임수현 on 2021/06/20.
//

import UIKit

class MainFullDiaryListCell: UITableViewCell {
    let groupItemCellId = "MainGroupItemCell"
//    let diaryItemCellId = ""
    
    @IBOutlet weak var groupListCollectionView: UICollectionView!
    @IBOutlet weak var diaryListCollectionView: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        groupListCollectionView.delegate = self
        groupListCollectionView.dataSource = self
        
        groupListCollectionView.collectionViewLayout = {
            let flowLayout = UICollectionViewFlowLayout()
            flowLayout.scrollDirection = .horizontal
            flowLayout.estimatedItemSize = CGSize(width: 20, height: 30)
            flowLayout.sectionInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
            flowLayout.minimumLineSpacing = 22
            return flowLayout
        }()
        
        let groupItemCellNib = UINib(nibName: groupItemCellId, bundle: nil)
        groupListCollectionView.register(groupItemCellNib, forCellWithReuseIdentifier: groupItemCellId)
    }

    @IBAction func touchGroupManageButton(_ sender: Any) {
        print("그룹관리")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
extension MainFullDiaryListCell: UICollectionViewDelegate {
}

extension MainFullDiaryListCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch collectionView {
        case groupListCollectionView:
            guard let groupItemCell = groupListCollectionView.dequeueReusableCell(withReuseIdentifier: groupItemCellId, for: indexPath)
                        as? MainGroupItemCell else { return MainGroupItemCell(frame: .zero) }
            return groupItemCell
        default:
            return MainGroupItemCell(frame: .zero)
        }
    }
}

