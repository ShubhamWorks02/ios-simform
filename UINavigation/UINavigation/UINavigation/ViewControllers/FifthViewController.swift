//
//  FifthViewController.swift
//  UINavigation
//
//  Created by Shubham Bhatt on 06/06/23.
//

import UIKit

class FifthViewController: UIViewController {
    
    weak var fifthDelegate: DataPreserve?
    
    override func viewDidLoad() {
        super.viewDidLoad()

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
    
    override func viewDidAppear(_ animated: Bool) {
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "fifthToSecond" {
            if let destinationVC = segue.destination as? SecondVC {
                destinationVC.getPoppedVcData(data: "dataToBePassed")
            }
        }
    }

}


protocol DataPreserve: AnyObject {
    func getPoppedVcData(data: String) -> ()
}
