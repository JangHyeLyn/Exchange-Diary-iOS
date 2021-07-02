//
//  DiaryGroup.swift
//  ExchangeDiary_iOS
//
//  Created by 임수현 on 2021/06/23.
//

import Foundation

struct DiaryGroup {
    var id: Int         // diary_group의 id
    var title: String   // diary_group의 title
    var count: Int = 0  // diary_group에 속해 있는 diary의 갯수
    
    static let TOTAL: DiaryGroup = DiaryGroup(id: 0, title: "전체")
    static let UNSPECIFIED: DiaryGroup = DiaryGroup(id: -1, title: "그룹 미지정")
}
