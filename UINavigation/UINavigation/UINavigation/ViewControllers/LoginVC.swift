//
//  LoginVC.swift
//  UINavigation
//
//  Created by Shubham Bhatt on 08/06/23.
//

import UIKit

class LoginVC: UIViewController {

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func btnLoginTapped(_ sender: UIButton) {
        UserDefaults.standard.set(true, forKey: "isLoggedIn")
        let storyboard = UIStoryboard(name: "Main", bundle: nil) // Replace "Main" with your storyboard name
        guard let tabVC = storyboard.instantiateViewController(withIdentifier: "TabBarVc") as? TabBarVc else {
            fatalError("Unable to instantiate TabBarVc from storyboard")
        }

        guard let window = getApplicationWindow() else {
            print("windo")
            return }
        window.rootViewController = tabVC
        window.makeKeyAndVisible()
    }
    
    func getApplicationWindow() -> UIWindow? {
        if #available(iOS 13.0, *) {
            if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene {
                return windowScene.windows.first { $0.isKeyWindow }
            }
        } else {
            return UIApplication.shared.keyWindow
        }
        return nil
    }
}
