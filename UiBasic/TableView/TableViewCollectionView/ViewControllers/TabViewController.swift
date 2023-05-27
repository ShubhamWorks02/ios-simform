//
//  TabViewController.swift
//  TableViewCollectionViewCollectionView
//
//  Created by Shubham Bhatt on 27/05/23.
//

import UIKit

class TabViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let vc1 = FirstViewController()
        let vc2 = SecondViewController()
        
        
//        self.selectedIndex = 1
        vc1.tabBarItem = UITabBarItem(title: "First", image: UIImage(named: "folder"), selectedImage: UIImage(named: "folder"))
        vc2.tabBarItem = UITabBarItem(title: "Second", image: UIImage(named: "home"), selectedImage: UIImage(named: "home"))
        
        
        // self.tabBar.setItems(<#T##[UITabBarItem]?#>, animated: <#T##Bool#>)
        self.setViewControllers([vc1,vc2], animated: true)
        print(self.selectedIndex)
        
        if let tabBarController = self.tabBarController {
            if let childViewControllers = tabBarController.viewControllers {
                if let index = childViewControllers.firstIndex(of: self) {
                    // Index of the child view controller within the tab bar controller
                    print("Index: \(index)")
                }
            }
        }

        
//        viewControllers = []
        // Do any additional setup after loading the view.
    }
    
}
