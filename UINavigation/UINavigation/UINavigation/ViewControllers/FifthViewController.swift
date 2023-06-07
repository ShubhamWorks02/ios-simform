//
//  FifthViewController.swift
//  UINavigation
//
//  Created by Shubham Bhatt on 06/06/23.
//

import UIKit

class FifthViewController: UIViewController {
    
    weak var fifthDelegate: DataPreserve?
    var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textField = UITextField(frame: CGRect(x: 50, y: 100, width: 200, height: 30))
                textField.borderStyle = .roundedRect
                textField.placeholder = "Enter text"
                view.addSubview(textField)
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
                destinationVC.getPoppedVcData(data: textField.text ?? "")
            }
        }
    }

}


protocol DataPreserve: AnyObject {
    func getPoppedVcData(data: String) -> ()
}
