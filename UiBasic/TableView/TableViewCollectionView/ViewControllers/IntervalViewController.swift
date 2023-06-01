//
//  IntervalViewController.swift
//  TableViewCollectionViewCollectionView
//
//  Created by Shubham Bhatt on 01/06/23.
//

import UIKit
//, UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate

class IntervalViewController: UIViewController {
    let textField = UITextField()
    var keyboardHeight: CGFloat = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set up the text field
        textField.frame = CGRect(x: 50, y: view.bounds.height - 50, width: view.bounds.width - 100, height: 30)
        textField.borderStyle = .roundedRect
        view.addSubview(textField)
        
        // Add keyboard notification observers
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
        
        // Add a tap gesture recognizer to dismiss the keyboard
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tapGesture)
    }
    
    // MARK: - Keyboard Notification Handlers
    
    @objc func keyboardWillShow(_ notification: Notification) {
        guard let keyboardFrame = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect else {
            return
        }
        
        keyboardHeight = keyboardFrame.height
        
        // Adjust the text field's position based on the keyboard height
//        UIView.animate(withDuration: 0.3) {
            self.textField.frame.origin.y = self.view.bounds.height - self.keyboardHeight - self.textField.frame.height - 10
//        }
    }
    
    @objc func keyboardWillHide(_ notification: Notification) {
        // Reset the text field's position
        UIView.animate(withDuration: 0.3) {
            self.textField.frame.origin.y = self.view.bounds.height - self.textField.frame.height - 10
        }
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    deinit {
        // Remove keyboard notification observers
        NotificationCenter.default.removeObserver(self)
    }
    
/*
performed pickerview time interval picker in TextField
*/
    
    
//    let pickerView = UIPickerView()
//    let textField = UITextField()
//
//    var hoursData = [Int]()
//    var minutesData = [Int]()
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        // Set up the text field
//        textField.frame = CGRect(x: 50, y: 100, width: 200, height: 30)
//        textField.borderStyle = .roundedRect
//        textField.delegate = self
//        view.addSubview(textField)
//
//        // Set up the picker view
//        pickerView.delegate = self
//        pickerView.dataSource = self
//        textField.inputView = pickerView
//
//        // Generate hours data
//        hoursData = Array(0...8)
//
//        // Generate minutes data with 15-minute intervals
//        minutesData = [0,15,30,45]
//    }
//
//    // MARK: - UIPickerViewDelegate
//
//    func numberOfComponents(in pickerView: UIPickerView) -> Int {
//        return 2 // Two components: hours and minutes
//    }
//
//    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
//        if component == 0 {
//            return hoursData.count
//        } else {
//            return minutesData.count
//        }
//    }
//
//    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
//        if component == 0 {
//            return "\(hoursData[row]) hours"
//        } else {
//            return "\(minutesData[row]) mins"
//        }
//    }
//
//    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
//        let selectedHour = hoursData[pickerView.selectedRow(inComponent: 0)]
//        let selectedMinute = minutesData[pickerView.selectedRow(inComponent: 1)]
//        let formattedTime = String(format: "%02d:%02d", selectedHour, selectedMinute)
//        textField.text = formattedTime
//    }
//
//    // MARK: - UITextFieldDelegate
//
//    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
//        pickerView.reloadAllComponents() // Refresh the picker view when the text field is tapped
//        return true
//    }
    
}
