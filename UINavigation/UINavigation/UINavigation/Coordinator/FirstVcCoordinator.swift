//
//  FirstVcCoordinator.swift
//  UINavigation
//
//  Created by Shubham Bhatt on 08/06/23.
//

import UIKit

class FirstVcCoordinator: Coordinator {
    
    var navController: UINavigationController?
    
    init(_ navigationController: UINavigationController) {
        navController = navigationController
    }
    
    func start() {
        if let firstVc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "FirstVC") as? FirstVC {
            firstVc.coordinator = self
            navController?.pushViewController(firstVc, animated: true)
        }
    }
    
    func goToSecondVc() {
        guard let vc2 = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SecondVC") as? SecondVC else { return }
        self.navController?.pushViewController(vc2, animated: true)
    }
    
    func finish() {
        
    }
    
    func finishToRoot() {
        
    }
    
    
}

