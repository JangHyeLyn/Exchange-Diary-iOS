//
//  ServiceResponse.swift
//  ExchangeDiary_iOS
//
//  Created by 임수현 on 2021/06/30.
//

import Foundation

struct ServiceResponse<T: Codable>: Codable {
    let code: Int
    let message: String
    let data: T
}
