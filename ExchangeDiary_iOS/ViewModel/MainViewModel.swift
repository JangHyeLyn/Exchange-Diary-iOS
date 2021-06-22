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
    private var _groups: [String] = ["전체"] {
        didSet { observer?.changedGroups() }
    }
    private var _fullDiaries: [Diary] = [.dummy1, .dummy2, .dummy3] {
        didSet { observer?.changedFullDiaries() }
    }
    
    var writingDiaries: [Diary] { _writingDiaries }
    var groups: [String] { _groups }
    var fullDiaries: [Diary] { _fullDiaries }
    
    // MARK: - Initializer
    init(observer: MainViewModelObserver?) {
        self.observer = observer
    }
    
    // MARK: - Functions
    func appendWritingDiary() {
        let diary = Diary(id: writingDiaries.count + 1, title: "Dummy Diary \(writingDiaries.count + 1)")
        _writingDiaries.append(diary)
    }
    func appendGroup() {
        _groups.append("그룹\(_groups.count)")
    }
    func appendFullDiary() {
        let diary = Diary(id: fullDiaries.count + 1, title: "Dummy Diary \(writingDiaries.count + 1)")
        _fullDiaries.append(diary)
    }
}
