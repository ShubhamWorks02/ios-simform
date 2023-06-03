//
//  DocumentStatus.swift
//  ComponentsKT
//
//  Created by Shubham Bhatt on 03/06/23.
//

import Foundation
import UIKit

enum DocumentStatus: String, CaseIterable {
    case approved, awaitingApproval
    
    func getStatus() -> String {
        switch self {
        case .approved: return "Approved"
        case .awaitingApproval: return "Awaiting Approval"
        }
    }
    
    func getColor() -> UIColor {
        switch self {
        case .approved: return UIColor(red: 80/255, green: 175/255, blue: 87/255, alpha: 1.0)
        case .awaitingApproval: return UIColor(red: 204/255, green: 99/255, blue: 0/255, alpha: 1.0) // Custom color for Awaiting Approval case
        }
    }
}
