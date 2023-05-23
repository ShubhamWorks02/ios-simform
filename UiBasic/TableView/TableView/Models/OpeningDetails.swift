//
//  OpeningDetails.swift
//  TableView
//
//  Created by Shubham Bhatt on 22/05/23.
//

import Foundation

class OpeningDetails {
//    var sectioName: String?
    var imageName: String?
    var roleName: String?
    
    static func getAllOpeningDetails() -> [String: [OpeningDetails]] {
        return ["Popular": [OpeningDetails(),]]
    }
}
