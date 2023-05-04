//
//  UITextField1.swift
//  UiComponent
//
//  Created by Shubham Bhatt on 04/05/23.
//

import Foundation
import UIKit

@IBDesignable
class UITextField1: UITextField {
    
      @IBInspectable var leftImage: UIImage? {
          didSet {
              leftViewMode = .always
              let imageView = UIImageView(image: leftImage)
              imageView.tintColor = .lightGray
              imageView.contentMode = .left
              leftView = imageView
              leftView?.tintColor = .lightGray
          }
      }
    
    @IBInspectable var rightImage: UIImage? {
        didSet {
            rightViewMode = .always
            let imageView = UIImageView(image: rightImage)
            imageView.tintColor = .lightGray
            imageView.contentMode = .right
            rightView = imageView
            rightView?.tintColor = .lightGray
        }
    }
      
      let textPadding = UIEdgeInsets(top: 10, left: 45, bottom: 10, right: 40)
      
      required init?(coder: NSCoder) {
          super.init(coder: coder)
          updateView()
      }
      
      override init(frame: CGRect) {
          super.init(frame: frame)
          updateView()
      }

      override func leftViewRect(forBounds bounds: CGRect) -> CGRect {
          return bounds.inset(by: .init(top: 0, left: 20, bottom: 0, right: 0))
          
      }
        override func rightViewRect(forBounds bounds: CGRect) -> CGRect {
            return bounds.inset(by: .init(top: 0, left: 0, bottom: 0, right: 20))
        }
      
      override open func textRect(forBounds bounds: CGRect) -> CGRect {
          return bounds.inset(by: textPadding)
      }

      override open func placeholderRect(forBounds bounds: CGRect) -> CGRect {
          return bounds.inset(by: textPadding)
      }

      override open func editingRect(forBounds bounds: CGRect) -> CGRect {
          return bounds.inset(by: textPadding)
      }
      
      private func updateView() {
          layer.masksToBounds = true
          layer.cornerRadius = 10
          layer.borderWidth = 1
          layer.borderColor = UIColor.lightGray.cgColor
          returnKeyType = .done
      }
    
}
