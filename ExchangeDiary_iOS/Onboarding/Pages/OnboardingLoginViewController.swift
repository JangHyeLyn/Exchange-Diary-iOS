//
//  OnboardingLoginViewController.swift
//  ExchangeDiary_iOS
//
//  Created by 임수현 on 2021/06/24.
//

import UIKit
import KakaoSDKUser
import KakaoSDKAuth

class OnboardingLoginViewController: UIViewController {
    // MARK: - Properties
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    // MARK: - Actions
    @IBAction func touchAppleLogin(_ sender: Any) {
        print("애플로그인")
    }
    @IBAction func touchKakaoLogin(_ sender: Any) {
        print("카카오로그인")
        kakaoLogin()
    }

    // MARK: - Kakao Login
    private func kakaoLogin() {
        if UserApi.isKakaoTalkLoginAvailable() { // 카카오톡 앱 설치 여부
            UserApi.shared.loginWithKakaoTalk(completion: kakaoLoginCompletion) // 카카오톡으로 로그인
        } else {
            UserApi.shared.loginWithKakaoAccount(completion: kakaoLoginCompletion) // 웹으로 로그인
        }
    }
    
    // 카카오 로그인 결과에 따른 completion 클로저
    private lazy var kakaoLoginCompletion: (OAuthToken?, Error?) -> Void = { [weak self] (oauthToken, error) in
        guard let oauthToken = oauthToken else {
            self?.failedKakaoLogin(alert: error?.localizedDescription)
            return
        }
        let token = oauthToken
        self?.successKakaoLogin(token: token)
    }
    
    private func failedKakaoLogin(alert message: String?) {
        // 로그인 실패 메세지 alert
    }
    
    private func successKakaoLogin(token oauthToken: OAuthToken) {
        _ = getJWT(with: oauthToken)
        // 키체인에 토큰 저장
        // 화면 전환
    }
    
    private func getJWT(with oauthToken: OAuthToken) -> String {
        // JWT 발급 api 호출
        return "JWT"
    }
}
