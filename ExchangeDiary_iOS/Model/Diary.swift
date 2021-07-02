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
    var nowPage: Int = 1
    var totalPage: Int = 30
    var userCount: Int = 1
    var nowWriterId: Int = 1
    var coverId: Int = 1
    var groupId: Int?
    
//    init(id: Int, title: String, nowPage: Int = 1, totalPage: Int = 30, userCount: Int = 1, nowWriterId: Int = 1, coverId: Int = 1, groupId: Int? = nil) {
//        self.id = id
//        self.title = title
//        self.nowPage = nowPage
//        self.totalPage = totalPage
//        self.userCount = userCount
//        self.nowWriterId = nowWriterId
//        self.coverId = coverId
//        self.groupId = groupId
//    }
    
    static let DUMMY1: Diary = Diary(id: 1, title: "더미 다이어리 1")
    static let DUMMY2: Diary = Diary(id: 2, title: "더미 다이어리 2")
    static let DUMMY3: Diary = Diary(id: 3, title: "더미 다이어리 3")
}
