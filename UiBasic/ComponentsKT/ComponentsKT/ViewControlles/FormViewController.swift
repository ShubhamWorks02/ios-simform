//
//  FormViewController.swift
//  ComponentsKT
//
//  Created by Shubham Bhatt on 03/06/23.
//

import UIKit

class FormViewController: UIViewController {
    
    @IBOutlet weak var btnSaveInfo: ActualGradientButton!
    @IBOutlet weak var txtFirstName: UITextFieldCustomImage!
    
    @IBOutlet weak var txtLastName: UITextFieldCustomImage!
    
    @IBOutlet weak var txtEmail: UITextFieldCustomImage!
    
    @IBOutlet weak var txtJobTitle: UITextFieldCustomImage!
    
    
    @IBOutlet weak var txtCompanyName: UITextFieldCustomImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        txtFirstName.translatesAutoresizingMaskIntoConstraints = false
//        let container = UIView(frame: txtFirstName.frame)
//        container.addSubview(txtFirstName)
//
//        let shadowLayer = CALayer()
//        shadowLayer.frame = CGRect(x: 0, y: container.frame.height - 2, width: container.frame.width, height: 2)
//        shadowLayer.backgroundColor = UIColor.black.cgColor
//        shadowLayer.shadowColor = UIColor.black.cgColor
//        shadowLayer.shadowOffset = CGSize(width: 0, height: 2)
//        shadowLayer.shadowOpacity = 0.3
//        shadowLayer.shadowRadius = 2
//        shadowLayer.masksToBounds = false
//
//        container.layer.addSublayer(shadowLayer)
//
//        // Add the container view to your view hierarchy
//        self.view.addSubview(container)


    }
    
    


}
