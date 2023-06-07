//
//  SecondVC.swift
//  UINavigation
//
//  Created by Shubham Bhatt on 01/06/23.
//

import UIKit

class SecondVC: UIViewController, DataPreserve {

    var details: String = ""
    var delegate: DataPreserve?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 38, height: 38))
        imageView.contentMode = .scaleAspectFit
        let image = UIImage(named: "email")
        imageView.image = image
        navigationItem.titleView = imageView
        // Do any additional setup after loading the view.
        // print("details: ",details)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        print(self.navigationController?.viewControllers, "stack in 2" )
        print(self.navigationController?.topViewController, "topviewcontroller in 2" )
        // print(delegate?.getPoppedVcData())
//        let sb = storyboard?.instantiateViewController(withIdentifier: "ThirdVC") as? ThirdVC
//        sb?.delegate = self.delegate
    }
    
//    @IBAction func goBack(_ sender: UIButton) {
//
//    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "SecondToFourth" {
            if let destinationVC = segue.destination as? FourthVC {
                destinationVC.fourthDelegate = self
//                destinationVC.details = "data passed through fifth to second"
            }
        }
        
//        if segue.identifier == "forwardSegues" {
//            if let destinationVC = segue.destination as? SixthVC {
//                destinationVC.data = "data arrived in forward direction"
//            }
//        }
    }
    
    func getPoppedVcData(data: String) {
        print("data: ",data)
    }
    
    
}
