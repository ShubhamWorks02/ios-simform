//
//  ExchangeCoordinator.swift
//  URLSession
//
//  Created by Shubham Bhatt on 01/07/23.
//

import Foundation
import UIKit

class ExchangeCoordinator: Coordinator {
    var navigationController: UINavigationController
    var window: UIWindow
    
    init(navigationController: UINavigationController, window: UIWindow) {
        self.navigationController = navigationController
        self.window = window
    }
    
    func start() {
        if let exchangeVc = UIStoryboard(name: "Exchange", bundle: nil).instantiateViewController(withIdentifier: "DownloadVc") as? DownloadVc {
            exchangeVc.coordinator = self
            navigationController.pushViewController(exchangeVc, animated: true)
        }
    }
    
    func gotoRoot() {
        navigationController.popToRootViewController(animated: true)
    }
    
}
