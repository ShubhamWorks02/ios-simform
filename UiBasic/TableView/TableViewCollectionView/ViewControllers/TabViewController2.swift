//
//  TabViewController2ViewController.swift
//  TableViewCollectionViewCollectionView
//
//  Created by Shubham Bhatt on 27/05/23.
//

import UIKit

import UIKit
//
//class TabViewController2: UITabBarController {
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        // Create tab bar items
//        let item1 = UITabBarItem(title: "First", image: UIImage(named: "folder"), selectedImage: UIImage(named: "folder"))
//        let item2 = UITabBarItem(title: "Second", image: UIImage(named: "home"), selectedImage: UIImage(named: "selectedImage2"))
//        let vc1 = FirstViewController()
//        let vc2 = SecondViewController()
//
//        // Assign the tab bar items to the view controllers in the tab bar controller
////        if let viewControllers = self.viewControllers {
////            viewControllers[0].tabBarItem = item1
////            viewControllers[1].tabBarItem = item2
////        }
//
//    }
//}
//
//
////extension TabViewController2: UITabBarDelegate { //Redundant conformance of 'TabViewController2' to protocol 'UITabBarDelegate'
////
////}


import UIKit

class TabViewController2: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Create tab bar items
        let item1 = UITabBarItem(title: "First", image: UIImage(named: "folder"), selectedImage: UIImage(named: "folder"))
        let item2 = UITabBarItem(title: "Second", image: UIImage(named: "home"), selectedImage: UIImage(named: "home"))
        
        // Create view controllers for the tabs
//        let firstViewController = FirstViewController()
//        let secondViewController = SecondViewController()
//
        // Assign tab bar items to view controllers
        
        if let firstViewController = storyboard?.instantiateViewController(withIdentifier: "firstViewController"),
           let secondViewController = storyboard?.instantiateViewController(withIdentifier: "secondViewController") {
            
            firstViewController.tabBarItem = item1
            secondViewController.tabBarItem = item2
            viewControllers = [firstViewController, secondViewController]
        }
        // Set the tab bar items for the tab bar controller
         //self.tabBar.setItems([item1, item2], animated: true)
        
        // Set the view controllers for the tab bar controller
        // self.viewControllers = [firstViewController, secondViewController]
        
//        if let tabBarController = self.tabBarController,
//           let childViewControllers = tabBarController.viewControllers,
//           let index = childViewControllers.firstIndex(where: { $0 is TabViewController2 }) {
//            // Index of TabViewController2 within the tab bar controller's child view controllers
//            print("Index: \(index)")
//        }
    }
   
}
