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
        
//        // Add other view controllers to the tab bar as needed
//        let otherViewController1 = UIViewController()
//        otherViewController1.tabBarItem = UITabBarItem(tabBarSystemItem: .bookmarks, tag: 1)
//
//        let otherViewController2 = UIViewController()
//        otherViewController2.tabBarItem = UITabBarItem(tabBarSystemItem: .downloads, tag: 2)
//
        // Add the view controllers to the tab bar controller
        viewControllers = [demoScreenViewController]
    }
    
}
