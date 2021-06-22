//
//  MainViewController.swift
//  ExchangeDiary_iOS
//
//  Created by 임수현 on 2021/05/30.
//

import UIKit

class MainViewController: UIViewController {
    // MARK: - Components
    @IBOutlet weak var collectionView: UICollectionView!
    
    // MARK: - Constants
    let writingDiaryHeaderViewId = "MainWritingDiaryHeaderView"
    let writingListCellId = "MainWritingDiaryListCell"
    let groupListCellId = "MainGroupListCell"
    let diaryItemCellId = "MainSmallDiaryItemCell"
    lazy var viewmodel = MainViewModel(observer: self)
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
    }
    
    // MARK: - Actions
    @IBAction func touchAddDiaryButton(_ sender: Any) {
        viewmodel.appendWritingDiary()
    }
    @IBAction func touchAlertButton(_ sender: Any) {
        viewmodel.appendGroup()
    }
    @IBAction func touchProfileButton(_ sender: Any) {
        viewmodel.appendFullDiary()
    }
    
    // MARK: - Functions
    private func setupCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        
        let writingListCellNib = UINib(nibName: writingListCellId, bundle: nil)
        collectionView.register(writingListCellNib, forCellWithReuseIdentifier: writingListCellId)
        
        let groupListCellNib = UINib(nibName: groupListCellId, bundle: nil)
        collectionView.register(groupListCellNib, forCellWithReuseIdentifier: groupListCellId)
        
        let diaryItemCellNib = UINib(nibName: diaryItemCellId, bundle: nil)
        collectionView.register(diaryItemCellNib, forCellWithReuseIdentifier: diaryItemCellId)
    }
}

// MARK: - UICollectionViewDelegate
extension MainViewController: UICollectionViewDelegate { }

// MARK: - UICollectionViewDataSource
extension MainViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int { 3 }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section {
        case 0: return 1
        case 1: return 1
        case 2: return viewmodel.fullDiaries.count
        default: return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch indexPath.section {
        case 0: // 작성중 일기
            let writingItemCell = collectionView.dequeueReusableCell(withReuseIdentifier: writingListCellId, for: indexPath)
            return writingItemCell
        case 1: // (일기장 목록) 그룹
            let groupListCell = collectionView.dequeueReusableCell(withReuseIdentifier: groupListCellId, for: indexPath)
            return groupListCell
        case 2: // (일기장 목록) 전체 일기
            let diaryItemCell = collectionView.dequeueReusableCell(withReuseIdentifier: diaryItemCellId, for: indexPath)
            return diaryItemCell
        default:
            return MainGroupItemCell(frame: .zero)
        }
    }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension MainViewController: UICollectionViewDelegateFlowLayout {
    // cell size
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        switch indexPath.section {
        case 0:
            return CGSize(width: collectionView.frame.width, height: 458)
        case 1:
            return CGSize(width: collectionView.frame.width, height: 89)
        case 2:
            return CGSize(width: 109, height: 157)
        default:
            return .zero
        }
    }
    
    // section inset
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        switch section {
        case 2:
            return UIEdgeInsets(top: 16, left: 20, bottom: 16, right: 20)
        default:
            return .zero
        }
    }
    
    // cell vertical spacing
    func collectionView( _ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        switch section {
        case 2:
            return 8
        default:
            return 0
        }
    }
    
    // cell horizontal spacing
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        switch section {
        case 2:
            return 4
        default:
            return 0
        }
    }
}

// MARK: - MainViewModelObserver
extension MainViewController: MainViewModelObserver {
    func changedWritingDiaries() {
        print("writing Diaries Changed")
    }
    
    func changedGroups() {
        print("Groups Changed")
    }
    
    func changedFullDiaries() {
        print("Full Diaries Changed")
        collectionView.reloadSections(IndexSet(integer: 2))
    }
}
