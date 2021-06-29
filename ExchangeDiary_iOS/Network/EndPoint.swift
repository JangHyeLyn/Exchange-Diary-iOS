//
//  EndPoint.swift
//  ExchangeDiary_iOS
//
//  Created by 임수현 on 2021/06/29.
//

import Foundation

protocol EndPoint {
    // server base url
    var baseURL: String { get }
    
    // /api/v1/users/...
    var path: String { get }
    
    // 구조는 나중에 결정
    var parameters: [String: String] { get }
    
    // GET, POST, PATCH ...
    var method: String { get }
}

// MARK: -
// enum을 사용한 이유 : API별로 케이스를 만들어준다! 그리고 해당 API별로 변수 리턴이 다 다르게 될 예정
enum ServiceAPI: EndPoint {
// MARK: USER
    // - GET
    case getUserInfo(userId: Int)
    case getMyInfo
    // - PATCH
    case updateMyInfo(userName: String? = nil, description: String? = nil, profileImage: String? = nil) // PATCH
    
// MARK: DIARY
    // - POST
    case createDiary(title: String, totalPage: Int = 30, cover: Int = 1, group: Int? = nil)
    // - GET
    case getDiaryInfo(diaryId: Int)
    case getMyDiaries
    // - PATCH
    case updateDiaryInfo(diaryId: Int, title: String? = nil, cover: Int? = nil, group: Int? = nil) // PATCH
    
// MARK: GROUP
    // - POST
    case createGroup(groupTitle: String)
    // - GET
    case getMyGroups
    case getGroupInfo(groupId: Int)
    // - PATCH
    case updateGroupInfo(groupId: Int, title: String)
    case updateGroupRank(groupIdwithRank: [Int: Int])
    // - DELETE
    case deleteGroup(groupId: Int)
    
// MARK: MEMBER
    // - POST
    case joinDiary(diaryId: Int)
    // - GET
    case getMembers(diaryId: Int)
    case getMyInfoInDiary(diaryId: Int)
    // - PATCH
    case updateMyInfoInDiary(diaryId: Int, nickname: String? = nil, profileImage: String? = nil)
    // - DELETE
    case leaveDiary(diaryId: Int)
    
// MARK: NOTIFICATION
    // - GET
    case getNotifications
    
// MARK: - return values
    var baseURL: String {
        return "13.209.49.204"
    }
    
    var path: String {
        return ""
    }
    
    var parameters: [String: String] {
        return [:]
    }
    
    var method: String {
        return ""
    }
}
