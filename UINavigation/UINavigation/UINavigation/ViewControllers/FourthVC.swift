//
//  FourthVC.swift
//  UINavigation
//
//  Created by Shubham Bhatt on 01/06/23.
//

import UIKit

class FourthVC: UIViewController, DataPreserve  {

    var dataToBePassed = "dataToBePassed"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
//    override func viewDidAppear(_ animated: Bool) {
//        print(self.navigationController?.viewControllers, "stack in 4" )
//        print(self.navigationController?.topViewController, "topviewcontroller in 4" )
//    }
    
    
    @IBAction func goBack(_ sender: UIButton) {
        if let secondVC = navigationController?.viewControllers.filter({ $0 is SecondVC }).first as? SecondVC {
            secondVC.delegate = self
        }
        self.navigationController?.popViewController(animated: true)
        //self.dismiss(animated: true)
    }
    
    func getPoppedVcData() -> String {
        return dataToBePassed
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

