//
//  KeyboardHelper.swift
//  ComponentsKT
//
//  Created by Shubham Bhatt on 07/06/23.
//

import Foundation
import UIKit

class KeyboardHelper {
    static let shared = KeyboardHelper()
    
    private init() {}
    
    func setupKeyboardDismissal(for view: UIView) {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tapGesture)
    }
    
    @objc private func dismissKeyboard() {
        UIApplication.shared.keyWindow?.endEditing(true)
    }
}
