//
//  TabViewController2ViewController.swift
//  TableViewCollectionViewCollectionView
//
//  Created by Shubham Bhatt on 27/05/23.


import UIKit

class TabViewController2: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Create tab bar items
        let item1 = UITabBarItem(title: "First", image: UIImage(named: "folder"), selectedImage: UIImage(named: "folder"))
        let item2 = UITabBarItem(title: "Second", image: UIImage(named: "home"), selectedImage: UIImage(named: "home"))

        
        if let firstViewController = storyboard?.instantiateViewController(withIdentifier: "firstViewController"),
           let secondViewController = storyboard?.instantiateViewController(withIdentifier: "secondViewController") {
            
            firstViewController.tabBarItem = item1
            secondViewController.tabBarItem = item2
            viewControllers = [firstViewController, secondViewController]
        }

    }
   
}
