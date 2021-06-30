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
    var body: [String: Any]? { get }
    
    // GET, POST, PATCH ...
    var method: HttpMethod { get }
}

enum HttpMethod {
    case get, post, patch, delete
}
enum ContentType {
    case formData, json
}
