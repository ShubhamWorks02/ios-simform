//
//  EditProfileCoordinator.swift
//  URLSession
//
//  Created by Shubham Bhatt on 06/07/23.
//

import UIKit

class EditProfileCoordinator: Coordinator {
    var navigationController: UINavigationController
    var window: UIWindow
    
    init(navigationController: UINavigationController, window: UIWindow) {
        self.navigationController = navigationController
        self.window = window
    }
    
    func start() {
        if let editProfileVc = UIStoryboard(name: "Kt", bundle: nil).instantiateViewController(withIdentifier: "EditProfileVc") as? EditProfileVc {
            editProfileVc.coordinator = self
            navigationController.pushViewController(editProfileVc, animated: true)
        }
    }
    
    func popToProfileVc() {
        navigationController.popViewController(animated: true)
    }
    
}
