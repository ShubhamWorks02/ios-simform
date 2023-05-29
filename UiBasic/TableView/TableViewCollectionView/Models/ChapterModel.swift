//
//  ChapterModel.swift
//  TableViewCollectionViewCollectionView
//
//  Created by Shubham Bhatt on 24/05/23.
//

import Foundation

class PersonModel {
    var personName: String?
    var chapterList: [ChapterModel] = []
    var personId: Int?
    
    init(personId: Int) {
        self.personId = personId
        self.personName = Data.names[personId]
        self.chapterList = ChapterModel.getChapterDetails(personId: personId)
    }

}

class ChapterModel {
    var personID: Int?
    var chapterName: String?
    var isCompleted: Bool?
    var chapterNumber: String?
    
    init(personID: Int?, chapterName: String, isCompleted: Bool, chapterNumber: String) {
        self.personID = personID
        self.chapterName = chapterName
        self.isCompleted = isCompleted
        self.chapterNumber = chapterNumber
    }
    
    static func getChapterDetails(personId: Int) -> [ChapterModel] {
        return Data.book.filter {item in
            item.personID == personId
        }
    }
}

class Data {
    
    static var book: [ChapterModel] = [
        ChapterModel(personID: 0, chapterName: "Kotlin", isCompleted: false, chapterNumber: "5"),
        ChapterModel(personID: 2,chapterName: "Swift", isCompleted: false, chapterNumber: "6"),
        ChapterModel(personID: 1, chapterName: "Kotlin", isCompleted: false, chapterNumber: "5"),
        ChapterModel(personID: 2,chapterName: "Swift", isCompleted: false, chapterNumber: "6"),
        ChapterModel(personID: 1,chapterName: "Kotlin", isCompleted: false, chapterNumber: "5"),
        ChapterModel(personID: 3, chapterName: "Swift", isCompleted: false, chapterNumber: "6"),
        ChapterModel(personID: 3,chapterName: "Kotlin", isCompleted: false, chapterNumber: "5"),
        ChapterModel(personID: 3,chapterName: "Swift", isCompleted: false, chapterNumber: "6"),
        ChapterModel(personID: 1,chapterName: "Kotlin", isCompleted: false, chapterNumber: "5"),
        ChapterModel(personID: 1,chapterName: "Swift", isCompleted: false, chapterNumber: "6"),
        ChapterModel(personID: 4, chapterName: "Kotlin", isCompleted: false, chapterNumber: "5"),
        ChapterModel(personID: 4,chapterName: "Swift", isCompleted: false, chapterNumber: "6"),
        ChapterModel(personID: 4,chapterName: "Kotlin", isCompleted: false, chapterNumber: "5"),
        ChapterModel(personID: 4,chapterName: "Swift", isCompleted: false, chapterNumber: "6"),
        ChapterModel(personID: 1,chapterName: "Kotlin", isCompleted: false, chapterNumber: "5"),
        ChapterModel(personID: 1, chapterName: "Swift", isCompleted: false, chapterNumber: "6"),
        ChapterModel(personID: 5,chapterName: "Kotlin", isCompleted: false, chapterNumber: "5"),
        ChapterModel(personID: 1,chapterName: "Swift", isCompleted: false, chapterNumber: "6"),
        ChapterModel(personID: 1,chapterName: "Kotlin", isCompleted: false, chapterNumber: "5"),
        ChapterModel(personID: 1,chapterName: "Swift", isCompleted: false, chapterNumber: "6")
    ]
    
    static var names: [Int: String] = [
        0:"shubham",
        1:"Qsr11",
        2:"Darshan",
        3:"shyam"
    ]
    
}


