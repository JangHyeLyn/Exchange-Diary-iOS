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
    private var _writingDiaries: [Diary] = [.DUMMY1, .DUMMY2, .DUMMY3] {
        didSet { observer?.changedWritingDiaries() }
    }
    private var _groups: [DiaryGroup] = [.TOTAL, .UNSPECIFIED] {
        didSet { observer?.changedGroups() }
    }
    private var _fullDiaries: [Diary] = [.DUMMY1, .DUMMY2, .DUMMY3] {
        didSet { observer?.changedFullDiaries() }
    }
    
    var writingDiaries: [Diary] { _writingDiaries }
    var groups: [DiaryGroup] { _groups }
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
        _groups.append(DiaryGroup(id: _groups.count - 1, title: "그룹\(_groups.count - 1)"))
    }
    func appendFullDiary() {
        let diary = Diary(id: fullDiaries.count + 1, title: "Diary \(writingDiaries.count + 1)")
        _fullDiaries.append(diary)
    }
}
