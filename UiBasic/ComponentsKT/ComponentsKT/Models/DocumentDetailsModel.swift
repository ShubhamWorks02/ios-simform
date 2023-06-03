//
//  DocumentDetailsModel.swift
//  ComponentsKT
//
//  Created by Shubham Bhatt on 02/06/23.
//

import Foundation
import UIKit

class DocumentDetailsModel {
    
    var sectionName: String
    let id: String
    let subject: String
    var emailID: String
    let type: String
    let date: String
    // var status:
    
    init(sectionName: String, id: String, subject: String, emailID: String, type: String, date: String) {
        self.sectionName = sectionName
        self.id = id
        self.subject = subject
        self.emailID = emailID
        self.type = type
        self.date = date
    }
    
}

static var data =
