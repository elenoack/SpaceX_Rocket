//
//  PageViewController.swift
//  SpaceX_Rocket
//
//  Created by Elena Noack on 22.07.22.
//

import UIKit

class PageViewController: UIPageViewController, MainViewProtocol {
    // MARK: - Properties
    
    let initialPage = 0
    private var pageControl = UIPageControl()
    var presenter: MainViewPresenterProtocol!
    
    //MARK: - Views
    
    private var pages: [UIViewController] = [RocketInfoViewController(),
                                             RocketInfoViewController(),
                                             RocketInfoViewController()]
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupLayout()
    }
    
    //MARK: - Settings
    
    private func setupView() {
        dataSource = self
        delegate = self
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        pageControl.currentPageIndicatorTintColor = .white
        pageControl.backgroundColor = .black
        pageControl.pageIndicatorTintColor = .systemGray
        pageControl.numberOfPages = pages.count
        pageControl.currentPage = initialPage
        pageControl.addTarget(self, action: #selector(tapped), for: .valueChanged)
        setViewControllers([pages[initialPage]], direction: .forward, animated: true, completion: nil)
    }
    
    private func setupLayout() {
        view.addSubview(pageControl)
        pageControl.topAnchor.constraint(equalTo: view.bottomAnchor, constant: -Metric.indentTop).isActive = true
        pageControl.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        pageControl.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        pageControl.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
}

//MARK: - UIPageViewControllerDataSource

extension PageViewController: UIPageViewControllerDataSource {
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        guard let currentIndex = pages.firstIndex(of: viewController) else { return nil }
        
        if currentIndex == 0 {
            return pages.last
        } else {
            return pages[currentIndex - 1]
        }
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        guard let currentIndex = pages.firstIndex(of: viewController) else { return nil }
        
        if currentIndex < pages.count - 1 {
            return pages[currentIndex + 1]
        } else {
            return pages.first
        }
    }
}

//MARK: - UIPageViewControllerDelegate

extension PageViewController: UIPageViewControllerDelegate {
    
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        guard let viewControllers = pageViewController.viewControllers else { return }
        guard let currentIndex = pages.firstIndex(of: viewControllers[0]) else { return }
        
        pageControl.currentPage = currentIndex
    }
}

// MARK: - Actions

extension PageViewController {
    
    @objc func tapped(_ sender: UIPageControl) {
        setViewControllers([pages[sender.currentPage]], direction: .forward, animated: true, completion: nil)
    }
}

// MARK: - Constants

extension PageViewController {
    
    enum Metric {
        static let indentTop: CGFloat = 64
    }
}
