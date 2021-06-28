//
//  OnboardingPageViewController.swift
//  ExchangeDiary_iOS
//
//  Created by 임수현 on 2021/06/24.
//

import UIKit

class OnboardingPageViewController: UIPageViewController {
    // MARK: - Variables
    private var onboardingVC: OnboardingViewController?
    
    private var viewList: [UIViewController] = {
        let storyBoard = UIStoryboard(name: "Onboarding", bundle: nil)
       
        let vc0 = storyBoard.instantiateViewController(withIdentifier: "Onboarding_0")
        vc0.view.tag = 0
        let vc1 = storyBoard.instantiateViewController(withIdentifier: "Onboarding_1")
        vc1.view.tag = 1
        let vc2 = storyBoard.instantiateViewController(withIdentifier: "Onboarding_2")
        vc2.view.tag = 2
        let loginVC = storyBoard.instantiateViewController(withIdentifier: "Onboarding_login")
        loginVC.view.tag = 3
        
        return [vc0, vc1, vc2, loginVC]
    }()
    
    var movePageControlTo: ((Int) -> Void) = { _ in }
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupPageViewController()
    }
    
    // MARK: - Functions
    private func setupPageViewController() {
        self.delegate = self
        self.dataSource = self
        self.setViewControllers([viewList[0]], direction: .forward, animated: true, completion: nil)
    }
}

// MARK: - UIPageViewControllerDelegate
extension OnboardingPageViewController: UIPageViewControllerDelegate {
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        // 이동이 완료되지 않았으면 그냥 리턴
        guard completed else { return }
        
        if let vc = pageViewController.viewControllers?.first {
            movePageControlTo(vc.view.tag)
        }
    }
}

// MARK: - UIPageViewControllerDataSource
extension OnboardingPageViewController: UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        if let index = pageViewController.viewControllers?.first?.view.tag {
            if index > 0 {
                return viewList[index - 1]
            }
        }
        return nil
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        if let index = pageViewController.viewControllers?.last?.view.tag {
            if index < viewList.count - 1 {
                return viewList[index + 1]
            }
        }
        return nil
    }
}
