//
//  FindJobModel.swift
//  TableView
//
//  Created by Shubham Bhatt on 15/05/23.
//

import Foundation

class FindJobModel: NSObject {
    
    var imageName: String?
    var companyName: String?
    var currentOpening: String?
    var isSelected: Bool = false
    // Isimg
    
    override init() {
        super.init()
    }
    
    init(imageName: String, companyName: String, currentOpening: String) {
        self.imageName = imageName
        self.companyName = companyName
        self.currentOpening = currentOpening
    }
    
    static func getCurrentOpening() -> [FindJobModel] {
        return [FindJobModel(imageName: "google", companyName: "Google", currentOpening: "SDE1"),
                FindJobModel(imageName: "facebook", companyName: "faceBook", currentOpening: "SDE2"),
                FindJobModel(imageName: "linkedIn", companyName: "LinkedIn", currentOpening: "UI/UX"),FindJobModel(imageName: "google", companyName: "Google", currentOpening: "SDE1"),
                FindJobModel(imageName: "facebook", companyName: "faceBook", currentOpening: "SDE2"),
                FindJobModel(imageName: "linkedIn", companyName: "LinkedIn", currentOpening: "UI/UX"),FindJobModel(imageName: "google", companyName: "Google", currentOpening: "SDE1"),
                FindJobModel(imageName: "facebook", companyName: "faceBook", currentOpening: "SDE2"),
                FindJobModel(imageName: "linkedIn", companyName: "LinkedIn", currentOpening: "UI/UX"),FindJobModel(imageName: "google", companyName: "Google", currentOpening: "SDE1"),
                FindJobModel(imageName: "facebook", companyName: "faceBook", currentOpening: "SDE2"),
                FindJobModel(imageName: "linkedIn", companyName: "LinkedIn", currentOpening: "UI/UX"),
                FindJobModel(imageName: "facebook", companyName: "faceBook", currentOpening: "SDE2"),
                FindJobModel(imageName: "linkedIn", companyName: "LinkedIn", currentOpening: "UI/UX"),
                FindJobModel(imageName: "facebook", companyName: "faceBook", currentOpening: "SDE2"),
                FindJobModel(imageName: "linkedIn", companyName: "LinkedIn", currentOpening: "UI/UX")]
    }
    
}
