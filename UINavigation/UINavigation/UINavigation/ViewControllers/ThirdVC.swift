//
//  ThirdVC.swift
//  UINavigation
//
//  Created by Shubham Bhatt on 01/06/23.
//

import UIKit

class ThirdVC: UIViewController {
    weak var delegate: DataPreserve?
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        print(self.navigationController?.viewControllers, "stack in 3" )
        print(self.navigationController?.topViewController, "topviewcontroller in 3" )
        // delegate?.getPoppedVcData()
    }

}
