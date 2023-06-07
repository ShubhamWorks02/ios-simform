//
//  ThirdVC.swift
//  UINavigation
//
//  Created by Shubham Bhatt on 01/06/23.
//

import UIKit

class ThirdVC: UIViewController {
    weak var thirdDelegate: DataPreserve?
    
    func getPoppedVcData(data: String) -> String {
        return data
    }
    
    weak var delegate: DataPreserve?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ThirdToFourth" {
            if let destinationVC = segue.destination as? FourthVC {
                destinationVC.fourthDelegate = thirdDelegate
//                destinationVC.details = "data passed through fifth to second"
            }
        }
        
        if segue.identifier == "forwardSegues" {
            if let destinationVC = segue.destination as? SixthVC {
                destinationVC.data = "data arrived in forward direction"
            }
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        print(self.navigationController?.viewControllers, "stack in 3" )
        print(self.navigationController?.topViewController, "topviewcontroller in 3" )
        // delegate?.getPoppedVcData()
    }

}
