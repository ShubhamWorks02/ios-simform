//
//  1stVC.swift
//  UINavigation
//
//  Created by Shubham Bhatt on 07/06/23.
//

import UIKit

class rootVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }

    @IBAction func goToSecond(_ sender: UIButton) {
        guard let vc2 = storyboard?.instantiateViewController(withIdentifier: "p2ndVC") else { return  }
        self.navigationController?.pushViewController(vc2, animated: true)
    }
}
