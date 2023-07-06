//
//  ProfileCoordinator.swift
//  URLSession
//
//  Created by Shubham Bhatt on 06/07/23.
//

import UIKit

class ProfileCoordinator: Coordinator {
    var navigationController: UINavigationController
    var window: UIWindow
    
    init(navigationController: UINavigationController, window: UIWindow) {
        self.navigationController = navigationController
        self.window = window
    }
    
    func start() {
        if let profileVc = UIStoryboard(name: "Kt", bundle: nil).instantiateViewController(withIdentifier: "ProfileVc") as? ProfileVc {
            profileVc.coordinator = self
            navigationController.pushViewController(profileVc, animated: true)
        }
    }
    
    func goToEditProfileVc() {
        let editProfileCoordinator = EditProfileCoordinator(navigationController: navigationController, window: window)
        editProfileCoordinator.start()
    }
    
}
