//
//  OnboardingViewController.swift
//  ExchangeDiary_iOS
//
//  Created by 임수현 on 2021/06/24.
//

import UIKit

class OnboardingViewController: UIViewController {
    // MARK: - UIComponents
    @IBOutlet private var pageControl: UIPageControl!
    
    // MARK: - LifCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupPageControl()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "OnboardingPageSegue",
              let pageController = segue.destination as? OnboardingPageViewController else {
            return
        }
        pageController.movePageControlTo = { [weak self] index in
            self?.pageControl.currentPage = index
        }
    }
    
    // MARK: - Functions
    private func setupPageControl() {
        pageControl.numberOfPages = 4
        pageControl.currentPage = 0
        pageControl.isUserInteractionEnabled = false
    }
}
