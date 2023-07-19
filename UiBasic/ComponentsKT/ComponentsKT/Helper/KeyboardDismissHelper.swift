//
//  KeyboardDismissHelper.swift
//  ComponentsKT
//
//  Created by Shubham Bhatt on 18/07/23.
//

import UIKit

class KeyboardDismissHelper {
    private let view: UIView
    
    private static var sharedHelper: KeyboardDismissHelper?
    
    static func shared(view: UIView) -> KeyboardDismissHelper {
        if sharedHelper == nil {
            sharedHelper = KeyboardDismissHelper(view: view)
        }
        return sharedHelper!
    }
    
    private init(view: UIView) {
        self.view = view
        setupTapGesture()
    }
    
    private func setupTapGesture() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tapGesture)
    }
    
    @objc private func dismissKeyboard() {
        view.endEditing(true)
    }
}

