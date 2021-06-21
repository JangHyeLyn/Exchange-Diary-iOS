//
//  MainWritingDiaryListCell.swift
//  ExchangeDiary_iOS
//
//  Created by 임수현 on 2021/06/21.
//

import UIKit

class MainWritingDiaryListCell: UICollectionViewCell {
    let writingCellId = "MainWritingDiaryItemCell"
    @IBOutlet weak var writingDiaryCollectionView: UICollectionView!
    
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

extension MainWritingDiaryListCell: UICollectionViewDelegate {
}

extension MainWritingDiaryListCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let writingCell = writingDiaryCollectionView.dequeueReusableCell(withReuseIdentifier: writingCellId, for: indexPath)
                    as? MainWritingDiaryItemCell else { return MainWritingDiaryItemCell(frame: .zero) }
        return writingCell
    }
}

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
