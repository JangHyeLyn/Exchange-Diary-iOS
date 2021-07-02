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
            defaults.set(false, forKey: "isFirstExcute")
            return true
        } else {
            return false
        }
    }
    
    func isUserTokenEmpty() -> Bool {
        guard let appName = Bundle.main.displayName else { return true }
        let query: [CFString: Any] = [kSecClass: kSecClassGenericPassword,
                                                kSecAttrService: appName,
                                                kSecMatchLimit: kSecMatchLimitOne,
                                                kSecReturnAttributes: true,
                                                kSecReturnData: true]

        var item: CFTypeRef?
        if SecItemCopyMatching(query as CFDictionary, &item) != errSecSuccess { return true }
        guard let existingItem = item as? [CFString: Any],
              existingItem[kSecAttrGeneric] != nil
        else { return true }
        return false
    }
}
