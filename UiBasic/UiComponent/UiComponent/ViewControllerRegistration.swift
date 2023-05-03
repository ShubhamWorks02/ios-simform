//
//  ViewControllerRegistration.swift
//  UiComponent
//
//  Created by Shubham Bhatt on 03/05/23.
//

import UIKit

class ViewControllerRegistration: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var lblRegister: UILabel!
    @IBOutlet weak var successView: UIView!
    @IBOutlet weak var tfName: UITextField!
    @IBOutlet weak var lblSubmit: UILabel!
    @IBOutlet weak var tfPass: UITextField!
    @IBOutlet weak var tfMob: UITextField!
    @IBOutlet weak var tfEmail: UITextField!
    @IBOutlet weak var message: UILabel!
    
    override func viewDidAppear(_ animated: Bool) {

        super.viewDidAppear(animated)
        //  tfName.becomeFirstResponder()

    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setInitViews()
        lblSubmit.isUserInteractionEnabled = true
        let tap = UITapGestureRecognizer(target: self, action: #selector(submitBtnPressed(sendeer: )))
        lblSubmit.addGestureRecognizer(tap)
     
        // print("dsf")
        // Do any additional setup after loading the view.
    }
    
    private func setInitViews(){
        tfName.becomeFirstResponder()
        tfName.delegate = self
        tfEmail.delegate = self
        tfPass.delegate = self
        tfMob.delegate = self
      }
    
    // UITextField Delegates
    
    // below code will prevent user to enter passw before inserting name, so name should be entered first
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        if(textField == tfPass && (tfName.text == nil || tfName.text!.isEmpty)) { return false }
        print("enter name first")
        // lblSubmit.text = "started"
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        print("textFieldDidBeginEditing")
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        print("textFieldShouldEndEditing")
        print("delegate to passw")
        tfPass.becomeFirstResponder()
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        print("textFieldDidEndEditing")
    }
    
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        print("textFieldShouldClear")
        return true
    }
    
    @objc func submitBtnPressed (sendeer: UITapGestureRecognizer) {
        if(tfName.text?.isEmpty ?? false || tfPass.text?.isEmpty ?? false || tfMob.text?.isEmpty ?? false || tfEmail.text?.isEmpty ?? false) {
            let alert = UIAlertController(title: nil, message: "Please fill all details", preferredStyle: .alert)
            let action = UIAlertAction(title: "OK", style: .default) {(action) in
                self.dismiss(animated: true, completion: nil)
            }
            alert.addAction(action)
            self.present(alert, animated: true, completion: nil)
            // email validation
            // secure text
            //number count
                // return
        } else {
            lblRegister.text = "Hi " + (tfName.text ?? "")
        }
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
