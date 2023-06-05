//
//  SectionDetailsModel.swift
//  ComponentsKT
//
//  Created by Shubham Bhatt on 05/06/23.
//

import Foundation
import UIKit

class SectionDetailsModel {
    
    private var sectionName: String?
    private var documentList: [DocumentDetailsModel]
    private var sectionId: Int?
    
    init(sectionName: String) {
        self.sectionName = sectionName
        self.documentList = DocumentDetailsModel.getDocumentDetails(sectionName: sectionName)
        self.sectionId = Data.sectionNumber[sectionName]
    }
    
}

