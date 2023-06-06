//
//  SecondVC.swift
//  UINavigation
//
//  Created by Shubham Bhatt on 01/06/23.
//

import UIKit

class SecondVC: UIViewController {

    var details: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 38, height: 38))
        imageView.contentMode = .scaleAspectFit
        let image = UIImage(named: "email")
        imageView.image = image
        navigationItem.titleView = imageView
        // Do any additional setup after loading the view.
        print("details: ",details)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        print(self.navigationController?.viewControllers, "stack in 2" )
        print(self.navigationController?.topViewController, "topviewcontroller in 2" )
    }
    
    @IBAction func goBack(_ sender: UIButton) {
        
    }
    
    
}
