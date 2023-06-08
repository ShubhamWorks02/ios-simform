//
//  Tab2Vc.swift
//  UINavigation
//
//  Created by Shubham Bhatt on 08/06/23.
//

import UIKit

class Tab2Vc: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
         UserDefaults.standard.set(true, forKey: "isLoggedIn")
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
