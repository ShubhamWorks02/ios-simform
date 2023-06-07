//
//  p3rdVC.swift
//  UINavigation
//
//  Created by Shubham Bhatt on 07/06/23.
//

import UIKit

class p3rdVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func goToRoot(_ sender: UIButton) {
        
//        if let navigationController = self.navigationController {
//            // Access the viewControllers property to get the navigation stack
//            let viewControllers = navigationController.viewControllers
//
//            // Print the viewControllers array
//            for viewController in viewControllers {
//                 if viewController.isKind(of: p2ndVC.self) {
//                    self.navigationController?.popToViewController(viewController, animated: true)
//                    break
//                 }
//            }
//        }
//        self.view.window?.rootViewController?.dismiss(animated: true)
        guard let vc3 = storyboard?.instantiateViewController(withIdentifier: "rootVC") else { return  }
        // let nav = UINavigationController(rootViewController: vc3)
        self.navigationController?.pushViewController(vc3, animated: true)
        
    }
    
}
