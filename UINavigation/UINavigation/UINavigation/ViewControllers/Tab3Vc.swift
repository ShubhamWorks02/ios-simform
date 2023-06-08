//
//  Tab3Vc.swift
//  UINavigation
//
//  Created by Shubham Bhatt on 08/06/23.
//

import UIKit

class Tab3Vc: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func btnLogoutTapped(_ sender: Any) {
        UserDefaults.standard.set(false, forKey: "isLoggedIn")
        print()
        parent?.navigationController?.viewControllers = [UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "LoginVC")]
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
