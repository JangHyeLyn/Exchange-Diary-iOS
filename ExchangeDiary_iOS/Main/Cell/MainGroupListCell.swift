//
//  MainGroupListCell.swift
//  ExchangeDiary_iOS
//
//  Created by 임수현 on 2021/06/21.
//

import UIKit

class MainGroupListCell: UICollectionViewCell {
    // MARK: - UIComponents
    @IBOutlet private weak var groupListCollectionView: UICollectionView!

    // MARK: - Constants
    private let groupItemCellId = "MainGroupItemCell"
    
    // MARK: - Variables
    private var _groups = [DiaryGroup]()
    var groups: [DiaryGroup] {
        @available(*, unavailable)
        get { _groups }
        set(newValue) {
            _groups = newValue // 전달받은 데이터
            groupListCollectionView.reloadData() // collectionView 리로드
        }
    }
    private var didSelectItemAt: ((Int) -> Void) = { _ in }
    
    // MARK: - LifeCycle
    override func awakeFromNib() {
        super.awakeFromNib()
        setupCollectionView()
    }
    
    // MARK: - Functions
    func setup(data: [DiaryGroup], selectAction: @escaping (Int) -> Void) {
        self.groups = data
        self.didSelectItemAt = selectAction
    }
    
    private func setupCollectionView() {
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
}

extension MainGroupListCell: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        didSelectItemAt(indexPath.item)
    }
}

extension MainGroupListCell: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        _groups.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch collectionView {
        case groupListCollectionView:
            guard let groupItemCell = groupListCollectionView.dequeueReusableCell(withReuseIdentifier: groupItemCellId, for: indexPath)
                        as? MainGroupItemCell else { return MainGroupItemCell(frame: .zero) }
            groupItemCell.setNewData(_groups[indexPath.row])
            return groupItemCell
        default:
            return MainGroupItemCell(frame: .zero)
        }
    }
}
