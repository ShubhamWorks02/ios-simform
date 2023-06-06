//
//  DocumentDetailsModel.swift
//  ComponentsKT
//
//  Created by Shubham Bhatt on 02/06/23.
//

import Foundation

class DocumentDetailsModel {
    let sectionName: String?
    let id: String?
    let subject: String?
    var emailID: String?
    let type: String?
    let date: String?
    var status: DocumentStatus? // Added status parameter
    
    init(sectionName: String?, id: String?, subject: String?, emailID: String?, type: String?, date: String?, status: DocumentStatus?) {
        self.sectionName = sectionName
        self.id = id
        self.subject = subject
        self.emailID = emailID
        self.type = type
        self.date = date
        self.status = status
    }
    
    static func getDocumentDetails(sectionName: String) -> [DocumentDetailsModel] {
        return Data.data.filter { item in
            item.sectionName == sectionName
        }
    }
}

class Data {
    static var data = [
            DocumentDetailsModel(sectionName: "All Document",id: nil, subject: "Test Request Compliance Approval Test Request Compliance Approval ", emailID: "DavisBaptista@domain.name DavisBaptista@domain.name", type: "Request", date: "Jan 01, 2020", status: .approved),
            DocumentDetailsModel(sectionName: "All Document", id: "745AF6", subject: "Test Request Compliance Approval", emailID: "DavisBaptista@domain.name", type: "Request", date: "Jan 01, 2020", status: .awaitingApproval),
            DocumentDetailsModel(sectionName: "All", id: "745AF6", subject: "Test Request Compliance Approval", emailID: "DavisBaptista@domain.name", type: "Request", date: "Jan 01, 2020", status: .approved),
            DocumentDetailsModel(sectionName: "All Document", id: "745AF6", subject: "Test Request Compliance Approval", emailID: "DavisBaptista@domain.name", type: "Request", date: "Jan 01, 2020", status: .awaitingApproval),
            DocumentDetailsModel(sectionName: "All Document", id: "745AF6", subject: "Test Request Compliance Approval", emailID: "DavisBaptista@domain.name", type: "Request", date: "Jan 01, 2020", status: .approved),
           // DocumentDetailsModel(sectionName: "All Document54725734", id: "745AF6", subject: "Test Request Compliance Approval", emailID: "DavisBaptista@domain.name", type: "Request", date: "Jan 01, 2020", status: .approved)
        ]
    
    static var sectionNumber: [String: Int] = [
        "All Document": 0,
        "All": 1
    ]
}

// we can scale this model with unique entry by ids

