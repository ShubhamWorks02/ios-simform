//
//  TabBarVc.swift
//  UINavigation
//
//  Created by Shubham Bhatt on 08/06/23.
//

import UIKit

class TabBarVc: UITabBarController,UITabBarControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.selectedIndex = 1
        self.delegate = self
        print("parent",parent)
        //printContent(tabBarController == nil)
        // Do any additional setup after loading the view.
    }
    
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        if item == self.viewControllers?.first?.tabBarItem {
            if let vc1 = self.viewControllers?.first as? UINavigationController {
                vc1.popToRootViewController(animated: false)
            }
        }
    }
    
}
