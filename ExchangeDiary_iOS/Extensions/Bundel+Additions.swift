//
//  Bundel+Additions.swift
//  ExchangeDiary_iOS
//
//  Created by 임수현 on 2021/06/25.
//

import Foundation

extension Bundle {
    var displayName: String? {
        return object(forInfoDictionaryKey: "CFBundleDisplayName") as? String
    }
}
