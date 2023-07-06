//
//  HomeCoordinator.swift
//  URLSession
//
//  Created by Shubham Bhatt on 06/07/23.
//

import UIKit

// Not using Coordinators . exploring how to pass data between Vc's through coordinators which conforms to @Objc protocol.

class HomeCoordinator: Coordinator {
    var navigationController: UINavigationController
    var window: UIWindow
    
    init(navigationController: UINavigationController, window: UIWindow) {
        self.navigationController = navigationController
        self.window = window
    }
    
    func start() {
        if let homeVc = UIStoryboard(name: "Kt", bundle: nil).instantiateViewController(withIdentifier: "HomeVc") as? HomeVc {
            homeVc.coordinator = self
            navigationController.pushViewController(homeVc, animated: true)
        }
    }
    
    func goToProfileVc(user: User) {
        let profileCoordinator = ProfileCoordinator(navigationController: navigationController, window: window)
        profileCoordinator.start()
    }
    
}
