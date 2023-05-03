//
//  ViewControllerTextView.swift
//  UiComponent
//
//  Created by Shubham Bhatt on 03/05/23.
//

import UIKit

class ViewControllerTextView: UIViewController, UITextViewDelegate {

    @IBOutlet weak var textView1: UITextView!
    
    deinit {
        print("deinit called")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        print("viewWillDisappear")
    }
    override func viewDidDisappear(_ animated: Bool) {
        print("viewDidDisappear")
    }
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
        
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        print("did begin edit")
    }
    
    func textViewShouldEndEditing(_ textView: UITextView) -> Bool {
        print("should end editing")
        return true
    }
    
    func textViewDidChange(_ textView: UITextView) {
        print("TV changed")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textView1.delegate = self
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
