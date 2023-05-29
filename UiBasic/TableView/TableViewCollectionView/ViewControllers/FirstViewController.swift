//
//  FirstViewController.swift
//  TableViewCollectionViewCollectionView
//
//  Created by Shubham Bhatt on 27/05/23.
//

import UIKit

class FirstViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        print("First")
        
        
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        if let tabBarController = self.tabBarController,
           let childViewControllers = tabBarController.viewControllers,
           let index = childViewControllers.firstIndex(where: { $0 is FirstViewController }) {
            
            print("Index: \(index)")
        }
    }

}
