//
//  OnboardingLoginViewController.swift
//  ExchangeDiary_iOS
//
//  Created by 임수현 on 2021/06/24.
//

import UIKit

class OnboardingLoginViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    // MARK: - Actions
    @IBAction func touchAppleLogin(_ sender: Any) {
        print("애플로그인")
    }
    @IBAction func touchKakaoLogin(_ sender: Any) {
        print("카카오로그인")
    }
}
