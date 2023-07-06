//
//  AppCoordinator.swift
//  URLSession
//
//  Created by Shubham Bhatt on 01/07/23.
//

import Foundation
import UIKit

class AppCoordinator: Coordinator {
    var navigationController: UINavigationController
    var window: UIWindow
    
    init(navigationController: UINavigationController, window: UIWindow) {
        self.navigationController = navigationController
        self.window = window
    }
    
    func start() {
        let mainCoordinator = MainCoordinator(navigationController: navigationController, window: window)
        mainCoordinator.start()
    }

}
