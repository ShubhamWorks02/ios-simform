//
//  VIewControllerOtp.swift
//  OtpVerify
//
//  Created by Shubham Bhatt on 05/05/23.
//

import Foundation
import UIKit

class ViewControllerOtp: ViewController {
    // MARK: OUTLETS
    @IBOutlet weak var tf1: UITextField!
    @IBOutlet weak var btnVerify: UIButton!
    @IBOutlet weak var tf4: UITextField!
    @IBOutlet weak var tf3: UITextField!
    @IBOutlet weak var tf2: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initValues()
        
    }
    
    private func initValues() {
        tf1.delegate = self
        tf2.delegate = self
        tf3.delegate = self
        tf4.delegate = self
        btnVerify.isHidden = true
    }
    
    
}


// Extension

extension ViewControllerOtp: UITextFieldDelegate {
    
//    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
//
//        let textInp = (textField.text ?? "") + string
//        if textInp.count == 1 {
//            textField.resignFirstResponder()
//            if textField == tf1 {
//                tf2.becomeFirstResponder()
//            } else if textField == tf2 {
//                tf2.resignFirstResponder()
//                tf3.becomeFirstResponder()
//            } else if textField == tf3 {
//                tf3.resignFirstResponder()
//                tf4.becomeFirstResponder()
//            } else {
//                tf4.resignFirstResponder()
//                btnVerify.isHidden = false
//            }
//
//        }
//        return true
//    }
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let currentText = textField.text ?? ""
        let newText = (currentText as NSString).replacingCharacters(in: range, with: string)
        
        if newText.count == 1 {
            textField.text = newText
            textField.resignFirstResponder()
            
            if textField == tf1 {
                tf2.becomeFirstResponder()
            } else if textField == tf2 {
                tf3.becomeFirstResponder()
            } else if textField == tf3 {
                tf4.becomeFirstResponder()
            } else {
                tf4.resignFirstResponder()
                btnVerify.isHidden = false
            }
            
            return false
        }
        
        return true
    }


//    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
//        <#code#>
//    }
}
