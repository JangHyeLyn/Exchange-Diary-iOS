//
//  Diary.swift
//  ExchangeDiary_iOS
//
//  Created by 임수현 on 2021/06/22.
//

import Foundation

struct Diary {
    var id : Int
    var title: String
    var nowPage: Int
    var totalPage: Int
    var userCount: Int
    var nowWriterId: Int
    var coverId: Int
    var groupId: Int?
    
//        "id": 101,
//        "title": "210620",
//        "now_page": 1,
//        "total_page": 30,
//        "user": 11,
//        "now_writer": 11,
//        "cover": 1,
//        "group": null,
//        "created_at": 1624163083967,
//        "updated_at": 1624163083967
    static let dummy1: Diary = Diary(id: 1,
                                     title: "1번 다이어리 테스트중!",
                                     nowPage: 1,
                                     totalPage: 30,
                                     userCount: 3,
                                     nowWriterId: 1,
                                     coverId: 1,
                                     groupId: nil)
    
    static let dummy2: Diary = Diary(id: 2,
                                     title: "2번 다이어리 테스트중!",
                                     nowPage: 1,
                                     totalPage: 30,
                                     userCount: 3,
                                     nowWriterId: 1,
                                     coverId: 1,
                                     groupId: nil)
    
    static let dummy3: Diary = Diary(id: 3,
                                     title: "3번 다이어리 테스트중!",
                                     nowPage: 1,
                                     totalPage: 30,
                                     userCount: 3,
                                     nowWriterId: 1,
                                     coverId: 1,
                                     groupId: nil)

}
