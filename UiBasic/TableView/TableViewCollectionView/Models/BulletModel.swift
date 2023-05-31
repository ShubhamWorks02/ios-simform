//
//  BulletModel.swift
//  TableViewCollectionViewCollectionView
//
//  Created by Shubham Bhatt on 31/05/23.
//

import Foundation

class Bullet {
    
    var sectionID: Int?
    var sectionName: String?
    var listOflabelDetails: [String]?
    
    init(sectionID: Int, sectionName: String, listOflabelDetails: [String]) {
        self.sectionID = sectionID
        self.sectionName = sectionName
        self.listOflabelDetails = listOflabelDetails
    }
    
    static func getSectionDetails() -> [Bullet] {
        return [
                Bullet(sectionID: 0, sectionName: "We are the teams who create all of Facebook's products used by billions of people around the world. Want to build new features and improve existing products like Messenger, Video, Groups, News Feed, Search and more?", listOflabelDetails:                     []),
                Bullet(sectionID: 1, sectionName: "Responsibility", listOflabelDetails: LabelData.labelData),
                Bullet(sectionID: 1, sectionName: "Responsibility", listOflabelDetails: LabelData.labelData),
                Bullet(sectionID: 1, sectionName: "Responsibility", listOflabelDetails: LabelData.labelData)

        ]
    }
}

class LabelData {
    static let labelData = ["djfjdfjeioiogor;erfoeju ugergeeiofroeuoguegoeoftueouuoiuiosauoguoguegoeoftueouuoiuiosauog","shubham","djfjdfjeioiogor;erfoeju ugergeeiofroeuoguegoeoftueouuoiuiosauog","djfjdfjeioiogor;erfoeju ugergeeiofroeuoguegoeoftueouuoiuiosauog"]
}

class JobCategory {
    static var categories = ["Description","Requirement","Description","Review"]
}
