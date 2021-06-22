//
//  MainWritingDiaryListCell.swift
//  ExchangeDiary_iOS
//
//  Created by 임수현 on 2021/06/21.
//

import UIKit

class MainWritingDiaryListCell: UICollectionViewCell {
    // MARK: - Components
    @IBOutlet private weak var writingDiaryCollectionView: UICollectionView!
    
    // MARK: - Constants
    private let writingCellId = "MainWritingDiaryItemCell"
    
    // MARK: - Variables
    private var _diaries = [Diary]()
    var diaries: [Diary] {
        @available(*, unavailable)
        get { _diaries }
        
        set(newValue) {
            _diaries = newValue // 전달받은 데이터
            writingDiaryCollectionView.reloadData() // collectionView 리로드
        }
    }
        
    // MARK: - LifeCycle
    override func awakeFromNib() {
        super.awakeFromNib()
        writingDiaryCollectionView.delegate = self
        writingDiaryCollectionView.dataSource = self
        
        writingDiaryCollectionView.collectionViewLayout = {
            let flowLayout = UICollectionViewFlowLayout()
            flowLayout.scrollDirection = .horizontal
            flowLayout.itemSize = CGSize(width: 250, height: 370)
            flowLayout.sectionInset = UIEdgeInsets(top: 0, left: 20, bottom: 32, right: 20)
            flowLayout.minimumLineSpacing = 12
            return flowLayout
        }()
        
        let writingCellNib = UINib(nibName: writingCellId, bundle: nil)
        writingDiaryCollectionView.register(writingCellNib, forCellWithReuseIdentifier: writingCellId)
    }
}

// MARK: - UICollectionViewDelegate
extension MainWritingDiaryListCell: UICollectionViewDelegate {
}

// MARK: - UICollectionViewDataSource
extension MainWritingDiaryListCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        _diaries.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let writingCell = writingDiaryCollectionView.dequeueReusableCell(withReuseIdentifier: writingCellId, for: indexPath) as? MainWritingDiaryItemCell else { return MainWritingDiaryItemCell(frame: .zero) }
        writingCell.setNewData(_diaries[indexPath.row])
        return writingCell
    }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension MainWritingDiaryListCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: 250, height: 370)
    }
    
    // section inset
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        UIEdgeInsets(top: 0, left: 20, bottom: 32, right: 20)
    }
    
    // cell 사이의 간격
    func collectionView( _ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        12
    }
}
