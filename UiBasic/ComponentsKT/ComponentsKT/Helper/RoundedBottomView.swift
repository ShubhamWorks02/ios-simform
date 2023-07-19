//
//  RoundedViewCustom.swift
//  ComponentsKT
//
//  Created by Shubham Bhatt on 02/06/23.
//

import Foundation
import UIKit

class RoundedBottomView: UIView {
    override func draw(_ rect: CGRect) {
        let cornerRadius: CGFloat = 30.0
        let path = UIBezierPath(roundedRect: bounds,
                                byRoundingCorners: [.bottomLeft, .bottomRight],
                                cornerRadii: CGSize(width: cornerRadius, height: cornerRadius))
        let maskLayer = CAShapeLayer()
        maskLayer.path = path.cgPath
        layer.mask = maskLayer
    }
}
