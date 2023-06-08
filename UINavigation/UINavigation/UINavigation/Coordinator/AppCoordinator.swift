//
//  AppCoordinator.swift
//  UINavigation
//
//  Created by Shubham Bhatt on 08/06/23.
//

import UIKit

class AppCoordinator: Coordinator {

    var navController: UINavigationController?
    
    init(_ navigationController: UINavigationController) {
        navController = navigationController
    }
    
    func start() {
        guard let navVc = navController else {
            return
        }
        let firstVcCoordinator = FirstVcCoordinator(navVc)
        firstVcCoordinator.start()
    }
    
    func finish() {
        
    }
    
    func finishToRoot() {
        
    }
}
