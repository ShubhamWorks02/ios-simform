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
        let customImage = UIImage(named: "email")
                let customButtonItem = UIBarButtonItem(image: customImage, style: .plain, target: self, action: nil)
                navigationItem.leftBarButtonItems = [customButtonItem,customButtonItem,customButtonItem]
        // Do any additional setup after loading the view.
    }
    

    @IBAction func btnLogoutTapped(_ sender: Any) {
        UserDefaults.standard.set(false, forKey: "isLoggedIn")
        print()
        //getApplicationWindow()
//        guard let sceneDelegate = UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate else {
//              fatalError("could not get scene delegate ")
//            }
//        var wi = self.view.window
           guard let window = getApplicationWindow() else {
               print("windo")
               return }
        
        guard let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "LoginVC") as? LoginVC else { return }
        
        let navVC = UINavigationController(rootViewController: vc)
//        navigationController?.viewControllers = [vc]
        
        window.rootViewController = navVC
        
        window.makeKeyAndVisible()
        // parent?.navigationController?.viewControllers = [UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "LoginVC")]
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
//
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
