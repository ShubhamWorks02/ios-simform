//
//  DocumentStatus.swift
//  ComponentsKT
//
//  Created by Shubham Bhatt on 03/06/23.
//

import Foundation
import UIKit

enum DocumentStatus: String {
    case approved, awaitingApproval
    
    func getStatus() -> String {
        switch self {
        case .approved: return Constants.DocStatuses.approved
        case .awaitingApproval: return Constants.DocStatuses.awaitingApproval
        }
    }
    
    func getColor() -> UIColor {
        switch self {
        case .approved: return UIColor(named: Constants.Colors.statusBtnApprovedColor) ?? .white
        case .awaitingApproval: return UIColor(named: Constants.Colors.statusBtnAwaitingColor) ?? .white
        }
    }
}
