//
//  FourthVC.swift
//  UINavigation
//
//  Created by Shubham Bhatt on 01/06/23.
//

import UIKit

class FourthVC: UIViewController {

    var dataToBePassed = "dataToBePassed"
    weak var fourthDelegate: DataPreserve?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        print(self.navigationController?.viewControllers, "stack in 4" )
        print(self.navigationController?.topViewController, "topviewcontroller in 4" )
        
    }
    
    
    @IBAction func goBack(_ sender: UIButton) {
        if let secondVC = navigationController?.viewControllers.filter({ $0 is SecondVC }).first as? SecondVC {
            // self.fourthDelegate?.getPoppedVcData(data: dataToBePassed)
            self.navigationController?.popToViewController(secondVC, animated: true)
        }
        
        //self.dismiss(animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "fourthToFIfth" {
            if let destinationVC = segue.destination as? FifthViewController {
                destinationVC.fifthDelegate = fourthDelegate
            }
        }

//        if segue.identifier == "forwardSegues" {
//            if let destinationVC = segue.destination as? SixthVC {
//                destinationVC.data = "data arrived in forward direction"
//            }
//        }
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



