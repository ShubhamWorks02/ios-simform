//
//  Tab1Vc.swift
//  UINavigation
//
//  Created by Shubham Bhatt on 08/06/23.
//

import UIKit

class Tab1Vc: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func goToDetailVc(_ sender: UIButton) {
        let vc = UIViewController()
        vc.hidesBottomBarWhenPushed = false
        let lbl = UILabel(frame: CGRect(x: 100, y: 300, width: 100, height: 100))
        lbl.text = "In details 1"
        vc.view.backgroundColor = .brown
        
        // vc.navigationItem.setHidesBackButton(true, animated: true)
        vc.view.addSubview(lbl)
        navigationController?.pushViewController(vc, animated: true)
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
