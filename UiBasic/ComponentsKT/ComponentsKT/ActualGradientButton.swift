//
//  ActualGradientButton.swift
//  ComponentsKT
//
//  Created by Shubham Bhatt on 03/06/23.
//

import Foundation
import UIKit

class ActualGradientButton: UIButton {

    override func layoutSubviews() {
        super.layoutSubviews()
        gradientLayer.frame = bounds
    }

    private lazy var gradientLayer: CAGradientLayer = {
        let l = CAGradientLayer()
        l.frame = self.bounds
        let blueColor = UIColor.blue.cgColor
        let cyanColor = UIColor.cyan.withAlphaComponent(0.8).cgColor
        l.colors = [blueColor, cyanColor]
        l.startPoint = CGPoint(x: 0, y: 0.5)
        l.endPoint = CGPoint(x: 1, y: 0.5)
        l.cornerRadius = 16
        layer.insertSublayer(l, at: 0)
        return l
    }()
}
