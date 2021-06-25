//
//  MainViewController.swift
//  ExchangeDiary_iOS
//
//  Created by 임수현 on 2021/05/30.
//

import UIKit

class MainViewController: UIViewController {
    // MARK: - Components
    @IBOutlet private weak var collectionView: UICollectionView!
    
    // MARK: - Constants
    private let writingDiaryHeaderViewId = "MainWritingDiaryHeaderView"
    private let writingListCellId = "MainWritingDiaryListCell"
    private let groupListCellId = "MainGroupListCell"
    private let diaryItemCellId = "MainSmallDiaryItemCell"
    
    // MARK: - Variables
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
    
    private func getCell(with reuseIdentifier: String, for indexPath: IndexPath) -> UICollectionViewCell {
        collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath)
    }
    
    private func getWritingListCell(indexPath: IndexPath) -> MainWritingDiaryListCell? {
        guard let cell = getCell(with: writingListCellId, for: indexPath) as? MainWritingDiaryListCell else { return nil }
        cell.setup(data: viewmodel.writingDiaries) { [weak self] item in
            guard let self = self else { return }
            self.presentDiaryPageController(diaryId: self.viewmodel.writingDiaries[item].id)
        }
        return cell
    }
    
    private func getGroupListCell(indexPath: IndexPath) -> MainGroupListCell? {
        guard let cell = getCell(with: groupListCellId, for: indexPath) as? MainGroupListCell else { return nil }
        cell.setup(data: viewmodel.groups) { [weak self] item in
            guard let self = self else { return }
            self.showGroupList(groupId: self.viewmodel.groups[item].id)
        }
        return cell
    }
    
    private func getDiaryItemCell(indexPath: IndexPath) -> MainSmallDiaryItemCell? {
        guard let cell = getCell(with: diaryItemCellId, for: indexPath) as? MainSmallDiaryItemCell
        else { return nil }
        cell.setup(data: viewmodel.fullDiaries[indexPath.item])
        return cell
    }
    
    private func presentDiaryPageController(diaryId: Int) {
        print("일기장\(diaryId) 상세정보")
    }
    private func showGroupList(groupId: Int) {
        print("그룹\(groupId)에 해당하는 일기장들 보여주기")
    }
}

// MARK: - MainViewModelObserver
extension MainViewController: MainViewModelObserver {
    func changedWritingDiaries() {
        print("writing Diaries Changed")
        collectionView.reloadSections(IndexSet(integer: 0))
    }
    
    func changedGroups() {
        print("Groups Changed")
        collectionView.reloadSections(IndexSet(integer: 1))
    }
    
    func changedFullDiaries() {
        print("Full Diaries Changed")
        collectionView.reloadSections(IndexSet(integer: 2))
    }
}

// MARK: - UICollectionViewDelegate
extension MainViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        switch indexPath.section {
        case 2:
            // 다이어리 선택 -> 상세페이지
            let selectedId = viewmodel.fullDiaries[indexPath.item].id
            presentDiaryPageController(diaryId: selectedId)
        default:
            let storyBoard = UIStoryboard(name: "Onboarding", bundle: nil)
            let onboardingVC = storyBoard.instantiateViewController(withIdentifier: "OnboardingViewController")
            onboardingVC.modalPresentationStyle = .fullScreen
            present(onboardingVC, animated: true)
        }
    }
}

// MARK: - UICollectionViewDataSource
extension MainViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int { 3 }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section {
        case 2:
            return viewmodel.fullDiaries.count
        default:
            return 1
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch indexPath.section {
        case 0: // 작성중 일기
            return getWritingListCell(indexPath: indexPath) ?? .init()
        case 1: // (일기장 목록) 그룹
            return getGroupListCell(indexPath: indexPath) ?? .init()
        case 2: // (일기장 목록) 전체 일기
            return getDiaryItemCell(indexPath: indexPath) ?? .init()
        default:
            return .init()
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
