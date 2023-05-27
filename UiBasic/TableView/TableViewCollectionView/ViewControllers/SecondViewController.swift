//
//  SecondViewController.swift
//  TableViewCollectionViewCollectionView
//
//  Created by Shubham Bhatt on 27/05/23.
//

import UIKit

class SecondViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        print("second")
        view.backgroundColor = .orange
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
            super.viewDidAppear(animated)
        
            if let tabBarController = self.tabBarController,
               let childViewControllers = tabBarController.viewControllers,
               let index = childViewControllers.firstIndex(where: { $0 is SecondViewController }) {
                print("Index: \(index)")
            }
        }
    
}
