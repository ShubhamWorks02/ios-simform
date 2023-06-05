//
//  UITextFieldCustom.swift
//  ComponentsKT
//
//  Created by Shubham Bhatt on 03/06/23.
//

import Foundation
import UIKit


@IBDesignable
class UITextFieldCustomImage: UITextField {
    
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
    
    @objc private func toggleVisibility() {
        self.isSecureTextEntry.toggle()
    }
    
    @IBInspectable var rightImage: UIImage? {
        didSet {
            let btn = UIButton(frame: CGRectMake( 100 , 0, 24, 24))
            btn.setImage(UIImage(named: "eye"), for: .normal)
            btn.addTarget(self, action: #selector(toggleVisibility), for: .touchUpInside)
            rightViewMode = .whileEditing
            rightView = btn
            btn.contentMode = .right
            rightView?.isUserInteractionEnabled = true
            rightView?.tintColor = .lightGray
        }
    }
      
      let textPadding = UIEdgeInsets(top: 10, left: 45, bottom: 10, right: 20)
      
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
        var rect = super.rightViewRect(forBounds: bounds)
        rect.origin.x = bounds.width - rect.width - textPadding.right
        return rect
    }

//        override func rightViewRect(forBounds bounds: CGRect) -> CGRect {
//            return bounds.inset(by: .init(top: 0, left: 0, bottom: 0, right: 20))
//        }
//
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
          layer.cornerRadius = 11
          layer.borderWidth = 0
          layer.borderColor = UIColor.lightGray.cgColor
          returnKeyType = .next
      }
    override func layoutSubviews() {
            super.layoutSubviews()
            addBottomShadow()
        }
        
    private func addBottomShadow() {
        // Remove existing shadow layer if any
        layer.sublayers?.filter { $0.name == "bottomShadowLayer" }.forEach { $0.removeFromSuperlayer() }

        // Create the shadow layer
        let shadowLayer = CALayer()
        shadowLayer.name = "bottomShadowLayer"
        shadowLayer.frame = CGRect(x: 0, y: bounds.height - 3, width: bounds.width, height: 3)
        shadowLayer.backgroundColor = UIColor.black.cgColor
        shadowLayer.opacity = 0.1
        shadowLayer.shadowColor = UIColor.black.cgColor
        shadowLayer.shadowOffset = CGSize(width: 0, height: 3)
        shadowLayer.shadowRadius = 6
        shadowLayer.shadowOpacity = 1
        layer.addSublayer(shadowLayer)
    }

    
}

extension UITextFieldCustomImage {
    func setSemiBoldBlackPlaceholderText(_ text: String) {
        let attributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor.black,
            .font: UIFont.systemFont(ofSize: 13, weight: .semibold)
        ]
        attributedPlaceholder = NSAttributedString(string: text, attributes: attributes)
    }
}
// Usage:

