//
//  MainFullDiaryListCell.swift
//  ExchangeDiary_iOS
//
//  Created by 임수현 on 2021/06/20.
//

import UIKit

class MainFullDiaryListCell: UITableViewCell {
    let groupItemCellId = "MainGroupItemCell"
    let diaryItemCellId = "MainSmallDiaryItemCell"
    
    @IBOutlet weak var groupListCollectionView: UICollectionView!
    @IBOutlet weak var diaryListCollectionView: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupCollectionView()
    }

    @IBAction func touchGroupManageButton(_ sender: Any) {
        print("그룹관리")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    private func setupCollectionView() {
        setupGroupListCollectionView()
        setupDiaryListCollectionView()
    }
    
    private func setupGroupListCollectionView() {
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
    
    private func setupDiaryListCollectionView() {
        diaryListCollectionView.delegate = self
        diaryListCollectionView.dataSource = self
        
        diaryListCollectionView.collectionViewLayout = {
            let flowLayout = UICollectionViewFlowLayout()
            flowLayout.scrollDirection = .vertical
            flowLayout.itemSize = CGSize(width: 109, height: 157)
            flowLayout.sectionInset = UIEdgeInsets(top: 16, left: 20, bottom: 16, right: 20)
            flowLayout.minimumLineSpacing = 2
            return flowLayout
        }()
        
        let diaryItemCellNib = UINib(nibName: diaryItemCellId, bundle: nil)
        diaryListCollectionView.register(diaryItemCellNib, forCellWithReuseIdentifier: diaryItemCellId)
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
            guard let diaryItemCell = diaryListCollectionView.dequeueReusableCell(withReuseIdentifier: diaryItemCellId, for: indexPath)
                        as? MainSmallDiaryItemCell else { return MainSmallDiaryItemCell(frame: .zero) }
            return diaryItemCell
        }
    }
}

