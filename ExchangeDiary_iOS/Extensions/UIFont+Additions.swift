//
//  UIFont+Additions.swift
//  ExchangeDiary_iOS
//
//  Created by 임수현 on 2021/06/01.
//

import Foundation

import UIKit

extension UIFont {
    enum DaehanWeight: String {
        case bold = "-Bold", regular = ""
    }
    
    static func daehan(ofSize fontSize: CGFloat = 15, weight: DaehanWeight = .regular) -> UIFont {
        UIFont(name: "Daehan\(weight)", size: fontSize)!
    }
}
