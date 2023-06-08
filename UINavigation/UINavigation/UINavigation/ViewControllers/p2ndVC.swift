//
//  p2ndVC.swift
//  UINavigation
//
//  Created by Shubham Bhatt on 07/06/23.
//

import UIKit

class p2ndVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func goToThird(_ sender: UIButton) {
        guard let vc3 = storyboard?.instantiateViewController(withIdentifier: "p3rdVC") else { return  }
//        let nav = UINavigationControlle
//        self.present(nav, animated: true)
    }
}
