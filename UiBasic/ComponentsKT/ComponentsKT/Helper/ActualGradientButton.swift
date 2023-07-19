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
        let gradient = CAGradientLayer()
        gradient.frame = bounds
        
        let startColor = UIColor(red: 39/255, green: 205/255, blue: 200/255, alpha: 1.0).cgColor
        let endColor = UIColor(red: 30/255, green: 118/255, blue: 225/255, alpha: 1.0).cgColor
        gradient.colors = [startColor, endColor]
        gradient.startPoint = CGPoint(x: 0, y: 0.5)
        gradient.endPoint = CGPoint(x: 1, y: 0.5)
        gradient.cornerRadius = gradient.bounds.height/2
        layer.insertSublayer(gradient, at: 0)
        return gradient
    }()
}
