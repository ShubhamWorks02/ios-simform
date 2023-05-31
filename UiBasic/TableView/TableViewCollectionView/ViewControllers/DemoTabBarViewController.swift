//
//  DemoTabBarViewController.swift
//  TableViewCollectionViewCollectionView
//
//  Created by Shubham Bhatt on 30/05/23.
//

import UIKit

class DemoTabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewControllers()
    }
    
    private func setupViewControllers() {
        let demoScreenViewController = UIDemoScreenViewController()
        demoScreenViewController.tabBarItem = UITabBarItem(tabBarSystemItem: .search, tag: 0)
        // Add the view controllers to the tab bar controller
        viewControllers = [demoScreenViewController]
    }
    
}
