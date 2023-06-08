//
//  FirstVC.swift
//  UINavigation
//
//  Created by Shubham Bhatt on 06/06/23.
//

import UIKit

class FirstVC: UIViewController {

    var coordinator: FirstVcCoordinator?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        print(self.navigationController?.viewControllers, "stack in 1" )
        print(self.navigationController?.topViewController, "topviewcontroller in 1" )
    }
    
    @IBAction func goToSecond(_ sender: UIButton) {
        coordinator?.goToSecondVc()
    }

}

