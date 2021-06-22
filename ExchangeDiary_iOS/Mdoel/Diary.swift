//
//  Diary.swift
//  ExchangeDiary_iOS
//
//  Created by 임수현 on 2021/06/22.
//

import Foundation

struct Diary {
    var id: Int
    var title: String
    var nowPage: Int
    var totalPage: Int
    var userCount: Int
    var nowWriterId: Int
    var coverId: Int
    var groupId: Int?
    
    init(id: Int, title: String, nowPage: Int = 1, totalPage: Int = 30, userCount: Int = 1, nowWriterId: Int = 1, coverId: Int = 1, groupId: Int? = nil) {
        self.id = id
        self.title = title
        self.nowPage = nowPage
        self.totalPage = totalPage
        self.userCount = userCount
        self.nowWriterId = nowWriterId
        self.coverId = coverId
        self.groupId = groupId
    }
    
    static let dummy1: Diary = Diary(id: 1, title: "더미 다이어리 1")
    static let dummy2: Diary = Diary(id: 2, title: "더미 다이어리 2")
    static let dummy3: Diary = Diary(id: 3, title: "더미 다이어리 3")
}
