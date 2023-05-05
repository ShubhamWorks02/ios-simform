//
//  ViewController.swift
//  JobSeek
//
//  Created by Shubham Bhatt on 02/05/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var btnLogin: UIButton!
    @IBOutlet weak var tfEmail: UITextField1!
    @IBOutlet weak var tfPass: UITextField1!
    @IBOutlet weak var fBtn: UIButton!
    @IBOutlet weak var appleBtn: UIButton!
    @IBOutlet weak var googleBtn: UIButton!
//    @IBOutlet weak var emaifield: UITextField1!
//    @IBOutlet weak var passWordField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        emaiLabel.leftViewMode = UITextField.ViewMode.always
//        var imageView = UIImageView();
//        var image = UIImage(named: "mail");
//        imageView.image = image;
//        emaiLabel.leftView = imageView;
        // Do any additional setup after loading the view.
        // UITextFieldEmail().labelPlaceholderColorChange(emaiLabel: emaiLabel)
        setInitViews()
        btnLogin.isUserInteractionEnabled = true
        tfEmail.isUserInteractionEnabled = true
        let tap = UITapGestureRecognizer(target: self, action: #selector(submitBtnPressed(sendeer: )))
        btnLogin.addGestureRecognizer(tap)
     
        tfEmail.attributedPlaceholder = NSAttributedString(
            string: "Email",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray]
        )
        
        tfPass.attributedPlaceholder = NSAttributedString(
            string: "Password",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray]
        )
        appleBtn.layer.cornerRadius = appleBtn.frame.width / 2
        appleBtn.layer.masksToBounds = true
        fBtn.layer.cornerRadius = fBtn.frame.width / 2
        fBtn.layer.masksToBounds = true
        
        // .addSubview(appleBtn)
    }
    private func setInitViews(){
//        tfName.becomeFirstResponder()
//        tfName.delegate = self
        tfEmail.delegate = self
        tfPass.delegate = self
//        tfMob.delegate = self
      }

    @objc func submitBtnPressed (sendeer: UITapGestureRecognizer) {
        
        if( tfPass.text?.isEmpty ?? false || tfEmail.text?.isEmpty ?? false) {
    
                let alert = UIAlertController(title: nil, message: "Please fill all details", preferredStyle: .alert)
                let action = UIAlertAction(title: "OK", style: .default) {(action) in
                    self.dismiss(animated: true, completion: nil)
                }
                alert.addAction(action)
                self.present(alert, animated: true, completion: nil)
           
            
            // email validation - done
            // secure text should ch change in range - done
            // number count
            // return - done
            
        } else {
            if (!verifyEmail()) {
                let alert2 = UIAlertController(title: nil, message: "Please enter valid email", preferredStyle: .alert)
                let action2 = UIAlertAction(title: "OK", style: .default) {(action2) in
                    self.dismiss(animated: true, completion: nil)
                }
                alert2.addAction(action2)
                self.present(alert2, animated: true, completion: nil)
                
            } else {
                btnLogin.isHidden = true
                
                print("hi user")
            }
            
        }
        
    }
    
    private func verifyEmail() -> Bool {
         
         // Define a regular expression pattern to match email addresses
         let emailPattern = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
         // Create a regular expression object from the pattern
         guard let emailRegex = try? NSRegularExpression(pattern: emailPattern, options: []) else {
             print("guard")
             return false
         }

         // Get the input text from the text field
         let emailInput = tfEmail.text ?? ""

         // Use the regular expression to check if the input text is a valid email address
         let emailMatch = emailRegex.firstMatch(in: emailInput, options: [], range: NSRange(location: 0, length: emailInput.utf16.count))

         // If the input text matches the regular expression, it's a valid email address
         if emailMatch != nil {
             // Email is valid
             return true
             
         } else {
             return false
             // Email is invalid
         }
     }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
            textField.textColor = UIColor.gray
    
        return range.location < 20
//
//        if range.length == 1 {
//            switch textField {
//            case tfMob:
//                tfPass.becomeFirstResponder()
//            default:
//                print("no")
//            }
//            textField.text = string
//            return false
//        } else {
//            return true
//        }
        
    }
}

//
//    func labelPlaceholderColorChange(emaiLabel: UITextField) {
//        // emailabel.
//        emaiLabel.attributedPlaceholder = NSAttributedString(
//            string: "Email",
//            attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray]
//        )
//    }
//
//
extension ViewController:  UITextFieldDelegate {
   
    // below code will prevent user to enter passw before inserting name, so name should be entered first
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        if(textField == tfPass && (tfEmail.text == nil || tfEmail.text!.isEmpty)) { return false }
        print("enter email first")
        // lblSubmit.text = "started"
        return true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print("returned")
        switch(textField) {
        //case tfName: tfEmail.becomeFirstResponder()
        case tfEmail: tfPass.becomeFirstResponder()
        //case tfMob: tfPass.becomeFirstResponder()
        default: tfEmail.becomeFirstResponder()
        }

        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
//        textField.layer.cornerRadius = 10
//        textField.borderStyle = .roundedRect
//        textField.layer.borderWidth = 1.0
//        textField.layer.borderColor = UIColor.red.cgColor
//        print("textFieldDidBeginEditing")
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        print("textFieldShouldEndEditing")
        print("delegate to passw")
        tfPass.becomeFirstResponder()
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if(textField == nil || textField.text!.isEmpty) {
            textField.layer.borderColor = UIColor.red.cgColor
            return
        }
        // textField.layer.borderColor = UIColor.green.cgColor
        print("textFieldDidEndEditing")
    }
    
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        print("textFieldShouldClear")
        return true
    }

}
