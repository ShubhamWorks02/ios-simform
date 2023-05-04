//
//  ViewControllerTextView.swift
//  UiComponent
//
//  Created by Shubham Bhatt on 03/05/23.
//

import UIKit

class ViewControllerTextView: UIViewController {

    @IBOutlet weak var textView1: UITextView!
    @IBOutlet weak var textView2: UITextView!
    deinit {
        print("deinit called")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        print("viewWillDisappear")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        print("viewDidDisappear")
    }
    
    private func setinitValues() {
        textView1.delegate = self
        textView2.delegate = self
        textView1.layer.borderWidth = 1.0
        textView1.layer.cornerRadius = 10
        textView1.layer.borderColor = UIColor.gray.cgColor
        textView2.layer.borderColor = UIColor.gray.cgColor
        textView2.layer.borderWidth = 1.0
        textView2.layer.cornerRadius = 10
        
    }
    
     override func viewDidLoad() {
        super.viewDidLoad()
        setinitValues()
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

}

extension ViewControllerTextView: UITextViewDelegate {
    func textViewShouldBeginEditing(_ textView: UITextView) -> Bool {
        print("shouldBeginEdit")
//        let alert = UIAlertController(title: nil, message: "Caution editing begins", preferredStyle: .alert)
//        let action = UIAlertAction(title: "Got It", style: .destructive, handler: nil )
//        alert.addAction(action)
//        self.present(alert,animated: true,completion: nil)
        return true
    }
    
    //
    func textViewDidChangeSelection(_ textView: UITextView) {
        let selectedRange = textView.selectedRange
        if selectedRange.length > 0 {
            print("selected")
            // User has selected some text
            // Update UI elements as needed
        } else {
            // User has moved the insertion point
            // Update UI elements as needed
        }
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        textView.layer.borderColor = UIColor.red.cgColor
        print("did begin edit")
    }
    
    func textViewShouldEndEditing(_ textView: UITextView) -> Bool {
        print("should end editing")
        return true
    }
    
    func textViewDidChange(_ textView: UITextView) {
        print("TV changed")
    }
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        // there is no method called textview should return in TextView unlike TxtF so implemented with
        // help of detecting replacement text
        if text == "\n" {
            if textView == textView1 {
                textView1.layer.borderColor = UIColor.green.cgColor
                textView2.becomeFirstResponder()
            }
            else {
                textView2.layer.borderColor = UIColor.green.cgColor
                textView.resignFirstResponder()
            }
            return true
        }
        return false
    }
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView == textView1 {
            textView1.resignFirstResponder()
            textView2.becomeFirstResponder()
        }
    }
    
}
