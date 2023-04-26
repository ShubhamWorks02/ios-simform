//
//  RoundCornerRadius.swift
//  AdvanceUi-B
//
//  Created by Shubham Bhatt on 26/04/23.
//

import Foundation
import UIKit

extension UIImageView {
   func makeRoundCorners(byRadius rad: CGFloat) {
      self.layer.cornerRadius = rad
      self.clipsToBounds = true
   }
}
