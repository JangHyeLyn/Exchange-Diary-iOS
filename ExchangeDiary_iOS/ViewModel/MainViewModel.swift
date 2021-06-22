//
//  MainViewModel.swift
//  ExchangeDiary_iOS
//
//  Created by 임수현 on 2021/06/22.
//

import Foundation

protocol MainViewModelObserver: class {
    func changedWritingDiaries()
    func changedGroups()
    func changedFullDiaries()
}

class MainViewModel {
    weak var observer: MainViewModelObserver?
    
    // MARK: - Data
    private var _writingDiaries: [Diary] = [.dummy1, .dummy2, .dummy3] {
        didSet { observer?.changedWritingDiaries() }
    }
    private var _groups: [Int: String] = [:] {
        didSet { observer?.changedGroups() }
    }
    private var _fullDiaries: [Diary] = [.dummy1, .dummy2, .dummy3] {
        didSet { observer?.changedFullDiaries() }
    }
    
    var writingDiaries: [Diary] { _writingDiaries }
    var groups: [Int: String] { _groups }
    var fullDiaries: [Diary] { _fullDiaries }
    
    // MARK: - Initializer
    init(observer: MainViewModelObserver?) {
        self.observer = observer
    }
    
    // MARK: - Functions
    func appendWritingDiary() {
        _writingDiaries.append(.dummy1)
        print(writingDiaries)
    }
    func appendGroup() {
        _groups[groups.count] = "새로운그룹"
    }
    func appendFullDiary() {
        _fullDiaries.append(.dummy1)
    }
}
