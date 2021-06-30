//
//  ServiceAPI.swift
//  ExchangeDiary_iOS
//
//  Created by 임수현 on 2021/06/30.
//

import Foundation

// enum을 사용한 이유 : API별로 케이스를 만들어준다! 그리고 해당 API별로 변수 리턴이 다 다르게 될 예정
enum ServiceAPI {
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
    case createDiary(title: String, totalPage: Int? = nil, cover: Int? = nil, group: Int? = nil)
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
}

// MARK: - End Point
extension ServiceAPI: EndPoint {
    var baseURL: String {
        return "13.209.49.204"
    }
    var apiPath: String {
        return "/api/v1"
    }
    var path: String {
        switch self {
        case .getUserInfo(let userId):
            return "\(apiPath)/users/\(userId)/"
            
        case .getMyInfo,
             .updateMyInfo:
            return "\(apiPath)/users/me/"
            
        case .getDiaryInfo(let diaryId),
             .updateDiaryInfo(let diaryId, _, _, _):
            return "\(apiPath)/diaries/\(diaryId)/"
            
        case .getMyDiaries:
            return "\(apiPath)/diaries/me/"
            
        case .createDiary:
            return "\(apiPath)/diaries/"
            
        case .getMyGroups,
             .createGroup,
             .updateGroupRank:
            return "\(apiPath)/diarygroups/"
            
        case .getGroupInfo(let groupId),
             .updateGroupInfo(let groupId, _),
             .deleteGroup(let groupId):
            return "\(apiPath)/diarygroups/\(groupId)/"
            
        case .getMembers(let diaryId),
             .joinDiary(let diaryId):
            return "\(apiPath)/diaries/\(diaryId)/members/"
            
        case .getMyInfoInDiary(let diaryId),
             .updateMyInfoInDiary(let diaryId, _, _),
             .leaveDiary(let diaryId):
            return "\(apiPath)/diaries/\(diaryId)/members/me/"
            
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
        case .updateMyInfo, .createDiary, .updateDiaryInfo,
             .createGroup, .updateGroupInfo,
             .updateMyInfoInDiary:
            return .formData
            
        case .updateGroupRank:
            return .json
            
        default:
            return nil
        }
    }
    
    var body: [String: Any]? {
        switch self {
        case .updateMyInfo(let userName, let description, let profileImage):
            var param: [String: Any] = [:]
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
            
        case .createDiary(let title, let totalPage, let cover, let group):
            var param: [String: Any] = [:]
            param["title"] = title
            if let totalPage = totalPage {
                param["total_page"] = totalPage
            }
            if let cover = cover {
                param["cover"] = cover
            }
            if let group = group {
                param["group"] = group
            }
            return param
            
        case .updateDiaryInfo(_, let title, let cover, let group):
            var param: [String: Any] = [:]
            if let title = title {
                param["title"] = title
            }
            if let cover = cover {
                param["cover"] = cover
            }
            if let group = group {
                param["group"] = group
            }
            return param
            
        case .createGroup(let groupTitle), .updateGroupInfo(_, let groupTitle):
            var param: [String: Any] = [:]
            param["title"] = groupTitle
            return param
            
        case .updateGroupRank(let groupIdwithRank):
            // json형식은 어떻게 할지 고민중
            return [:]
            
        case .updateMyInfoInDiary(_, let nickname, let profileImage):
            var param: [String: Any] = [:]
            if let nickname = nickname {
                param["nickname"] = nickname
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
        case .getUserInfo, .getMyInfo, .getDiaryInfo, .getMyDiaries:
            return .get
            
        case .createDiary:
            return .post
            
        case .updateMyInfo, .updateDiaryInfo:
            return .patch
            
        default:
            return .get
        }
    }
}
