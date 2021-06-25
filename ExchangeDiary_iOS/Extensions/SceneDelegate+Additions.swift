//
//  SceneDelegate+Additions.swift
//  ExchangeDiary_iOS
//
//  Created by 임수현 on 2021/06/25.
//

import Foundation

extension SceneDelegate {
    func isFirstExcute() -> Bool {
        let defaults = UserDefaults.standard
        if defaults.object(forKey: "isFirstExcute") == nil {
            defaults.set(false, forKey:"isFirstExcute")
            return true
        } else {
            return false
        }
    }
}
