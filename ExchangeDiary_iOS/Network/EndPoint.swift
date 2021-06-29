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
    
    // Requset
    var header: [String: String] { get }
    var contentType: ContentType? { get }
    var body: [String: String]? { get }
    
    // GET, POST, PATCH ...
    var method: HttpMethod { get }
}

enum HttpMethod {
    case get, post, patch, delete
}
enum ContentType {
    case formData, json
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
    // - GET
    case getDiaryInfo(diaryId: Int)
    case getMyDiaries
    // - POST
    case createDiary(title: String, totalPage: Int = 30, cover: Int = 1, group: Int? = nil)
    // - PATCH
    case updateDiaryInfo(diaryId: Int, title: String? = nil, cover: Int? = nil, group: Int? = nil) // PATCH
    
// MARK: GROUP
    // - GET
    case getMyGroups
    case getGroupInfo(groupId: Int)
    // - POST
    case createGroup(groupTitle: String)
    // - PATCH
    case updateGroupInfo(groupId: Int, title: String)
    case updateGroupRank(groupIdwithRank: [Int: Int])
    // - DELETE
    case deleteGroup(groupId: Int)
    
// MARK: MEMBER
    // - GET
    case getMembers(diaryId: Int)
    case getMyInfoInDiary(diaryId: Int)
    // - POST
    case joinDiary(diaryId: Int)
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
        switch self {
        case .getUserInfo(let userId):
            return "/api/v1/users/\(userId)/"
        case .getMyInfo:
            return "/api/v1/users/me/"
        case .updateMyInfo:
            return "/api/v1/users/me/"
            
        default:
            return ""
        }
    }
    
    var header: [String: String] {
        let token = "jwt토큰"
        return ["Authorization": token]
    }
    
    var contentType: ContentType? {
        switch self {
        case .updateMyInfo:
            return .formData
        default:
            return nil
        }
    }
    
    var body: [String: String]? {
        switch self {
        case .updateMyInfo(let userName, let description, let profileImage):
            var param: [String: String] = [:]
            if let userName = userName {
                param["username"] = userName
            }
            if let description = description {
                param["descriotion"] = description
            }
            if let profileImage = profileImage {
                param["profile_img"] = profileImage
            }
            return param
            
        default:
            return nil
        }
    }
    
    var method: HttpMethod {
        switch self {
        case .getUserInfo, .getMyInfo:
            return .get
            
        case .updateMyInfo:
            return .patch
            
        default:
            return .get
        }
    }
}
