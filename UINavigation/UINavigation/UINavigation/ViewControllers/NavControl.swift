//
//  NavController.swift
//  UINavigation
//
//  Created by Shubham Bhatt on 08/06/23.
//

import UIKit

class NavControl: UINavigationController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
        // Do any additional setup after loading the view.
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        if let topViewController = topViewController {
            if topViewController is SecondVC {
                return .lightContent // Use light content for SecondVC
            }
        }
        return .default // Use default content for other view controllers
    }
}

extension NavControl: UINavigationControllerDelegate {
    
    func navigationController(_ navigationController: UINavigationController, willShow viewController: UIViewController, animated: Bool) {
        if viewController is SecondVC {
            navigationBar.backgroundColor = .red // Set red background color for SecondVC
        } else {
            navigationBar.backgroundColor = .purple // Set purple background color for other view controllers
        }
    }
    
    func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
        
    }
}
