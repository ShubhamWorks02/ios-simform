//
//  FormViewController.swift
//  ComponentsKT
//
//  Created by Shubham Bhatt on 03/06/23.
//

import UIKit

class FormViewController: UIViewController {
    
    // MARK: OUTLETS
    @IBOutlet weak private var btnSaveInfo: ActualGradientButton!
    @IBOutlet weak private var txtFirstName: UITextFieldCustomImage!
    @IBOutlet weak private var txtLastName: UITextFieldCustomImage!
    @IBOutlet weak private var txtEmail: UITextFieldCustomImage!
    @IBOutlet weak private var txtJobTitle: UITextFieldCustomImage!
    @IBOutlet weak private var txtCompanyName: UITextFieldCustomImage!
    @IBOutlet weak private var navigationView: UIView!
    @IBOutlet weak private var mainView: UIView!
    @IBOutlet weak private var imgContainerView: UIView!
    @IBOutlet weak private var imgProfileView: UIImageView!
    
    
    // MARK: VARIABLES
    private var keyboardHeight: CGFloat = 0.0
    private var viewPlacementHeight = 0.0
    private var txtFieldList: [UITextFieldCustomImage] = []
    private var isValidationCompleted: Bool = false
    
    // MARK: VIEWCONTROLLER LIFECYCLE
    override func viewDidLoad() {
        super.viewDidLoad()
        viewPlacementHeight = mainView.bounds.origin.y
        configureTextFields()
        configureUI()
        placeImageOnProfile()
        adjustHeight()
        setUpReturnKeyForTextField()
    }
    
    // MARK: CUSTOMIZATION
    private func configureUI() {
        // txtFirstName.translatesAutoresizingMaskIntoConstraints = false
        navigationView.layer.cornerRadius = 8
        mainView.layer.cornerRadius = 35
        mainView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        btnSaveInfo.isHidden = true
        //btnSaveInfo.layer.cornerRadius = btnSaveInfo.bounds.height/2
    }
    
    private func configureTextFields() {
        txtFirstName.setSemiBoldBlackPlaceholderText("First Name")
        txtLastName.setSemiBoldBlackPlaceholderText("Last Name")
        txtEmail.setSemiBoldBlackPlaceholderText("Email")
        txtJobTitle.setSemiBoldBlackPlaceholderText("Job Title")
        txtCompanyName.setSemiBoldBlackPlaceholderText("Company Name")

        // Set delegate for each text field
        txtFirstName.delegate = self
        txtLastName.delegate = self
        txtEmail.delegate = self
        txtJobTitle.delegate = self
        txtCompanyName.delegate = self

    }
    
    private func placeImageOnProfile() {
        let childView = UIView()
        childView.frame = CGRect(x: (imgProfileView.bounds.width) - 22, y: imgProfileView.bounds.height - 25, width: 28, height: 28)
        childView.backgroundColor = UIColor(named: "emailColor")
        childView.layer.cornerRadius = childView.bounds.width/2
        let cameraImg = UIImageView()
        
        cameraImg.image = UIImage(named: "camera")
        cameraImg.frame = CGRect(x: childView.bounds.midX - 6.5, y: childView.bounds.midY - 6.5, width: 13, height: 13)
        childView.layer.borderWidth = 2
        childView.layer.borderColor = UIColor.white.cgColor
        cameraImg.layer.cornerRadius = cameraImg.bounds.width / 2

        childView.clipsToBounds = true
        cameraImg.isUserInteractionEnabled = true
        childView.isUserInteractionEnabled = true
        imgProfileView.isUserInteractionEnabled = true
        let tap = UITapGestureRecognizer(target: self, action: #selector(camBtnTapped(_ :)))
        cameraImg.addGestureRecognizer(tap)
        childView.addSubview(cameraImg)
        childView.layer.cornerRadius = childView.bounds.height / 2
        imgProfileView.layer.cornerRadius = imgProfileView.bounds.height/2
        imgContainerView.addSubview(childView)
    }
    
    private func adjustHeight() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)

        // Add a tap gesture recognizer to dismiss the keyboard
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tapGesture)
    }

    @objc func keyboardWillShow(_ notification: Notification) {
        guard let keyboardFrame = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect else {
            return
        }

        keyboardHeight = keyboardFrame.height

        // Adjust the text field's position based on the keyboard height
        UIView.animate(withDuration: 0.3) {
        self.mainView.frame.origin.y = self.view.bounds.height - self.keyboardHeight - self.txtCompanyName.frame.height*8 - 10
        }
    }

    @objc func keyboardWillHide(_ notification: Notification) {
        // Reset the text field's position
        UIView.animate(withDuration: 0.3) {
            self.mainView.frame.origin.y = self.view.bounds.height - self.mainView.bounds.height
        }
    }

    @objc func dismissKeyboard() {
        view.endEditing(true)
    }

    deinit {
        // Remove keyboard notification observers
        NotificationCenter.default.removeObserver(self)
    }
}

// MARK: TEXTFIELD DELEGATES
extension FormViewController: UITextFieldDelegate {
    
    func setUpReturnKeyForTextField() {
        txtCompanyName.returnKeyType = .done
        txtFieldList = [txtFirstName,txtLastName,txtEmail,txtJobTitle,txtCompanyName]
        for textField in txtFieldList {
            textField.delegate = self
        }
    }
    
}

// MARK: IMAGEPICKER DELEGATES
extension FormViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    @objc func camBtnTapped(_ sender: UIImageView) {
        let imageController = UIImagePickerController()
        imageController.delegate = self
        imageController.sourceType = UIImagePickerController.SourceType.photoLibrary
        self.present(imageController, animated: true)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        imgProfileView.image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage
        imgProfileView.contentMode = .scaleAspectFill
        dismiss(animated: true)
    }
}

// MARK: TEXTFIELD VALIDATION
extension FormViewController {
    
    private func isTextFieldEmpty(_ textField: UITextField) -> Bool {
        return textField.text?.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty ?? true
    }
    
    private func showAlert(for textField: UITextField, with message: String) {
        let alert = UIAlertController(title: "Invalid Input", message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if let currentIndex = txtFieldList.firstIndex(of: textField as! UITextFieldCustomImage) {
            // If it's the last text field, resign first responder and perform necessary actions
            if currentIndex == txtFieldList.count - 1 {
                textField.resignFirstResponder()
                // Perform any final actions here
            } else {
                // Otherwise, move to the next text field and set it as the first responder
                let nextTextField = txtFieldList[currentIndex + 1]
                
                // Validate the current text field before moving to the next one
                let isCurrentFieldValid = validateTextField(textField)
                
                if isCurrentFieldValid {
                    nextTextField.becomeFirstResponder()
                }
            }
        }
        
        // Update validation status
        isValidationCompleted = txtFieldList.allSatisfy { !isTextFieldEmpty($0) && ($0 == txtEmail ? isValidEmail($0.text ?? "") : containsOnlyLetters($0.text ?? "")) }
        
        // Show/hide saveInfo button
        btnSaveInfo.isHidden = !isValidationCompleted
        
        return true
    }

    private func validateTextField(_ textField: UITextField) -> Bool {
        if textField == txtEmail {
            if !isTextFieldEmpty(textField) && isValidEmail(textField.text ?? "") {
                removeBorderError(textField)
                return true
            } else {
                setBorderError(textField)
                return false
            }
        } else {
            if !isTextFieldEmpty(textField) && containsOnlyLetters(textField.text ?? "") {
                removeBorderError(textField)
                return true
            } else {
                setBorderError(textField)
                return false
            }
        }
    }

    private func setBorderError(_ textField: UITextField) {
        textField.layer.borderColor = UIColor.red.cgColor
        textField.layer.borderWidth = 1.0
    }

    private func removeBorderError(_ textField: UITextField) {
        textField.layer.borderColor = UIColor.green.cgColor
        textField.layer.borderWidth = 1.0
    }

    func textFieldDidEndEditing(_ textField: UITextField) {
        validateTextField(textField)
        updateValidationStatus()
    }
    
    private func updateValidationStatus() {
        // Update validation status
        isValidationCompleted = txtFieldList.allSatisfy { !isTextFieldEmpty($0) && ($0 == txtEmail ? isValidEmail($0.text ?? "") : containsOnlyLetters($0.text ?? "")) }
        
        // Show/hide saveInfo button
        btnSaveInfo.isHidden = !isValidationCompleted
    }

    private func isValidEmail(_ email: String) -> Bool {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        return emailPredicate.evaluate(with: email)
    }

    private func containsOnlyLetters(_ string: String) -> Bool {
        let letterCharacterSet = CharacterSet.letters
        return string.rangeOfCharacter(from: letterCharacterSet.inverted) == nil
    }

}
