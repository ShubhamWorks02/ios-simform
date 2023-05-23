//
//  OpeningDetails.swift
//  TableView
//
//  Created by Shubham Bhatt on 22/05/23.
//

import Foundation

class Category {
    var name: String?
    var isSeeAllClicked: Bool = false
    var arrOfOpenings: [OpeningDetails]
    
    init(name: String, arrOfOpenings: [OpeningDetails]) {
        self.name = name
        self.arrOfOpenings = arrOfOpenings
    }
    static func getAllCategories() -> [Category] {
        return [Category(name: "Popular", arrOfOpenings: OpeningDetails.getAllOpeningDetails())]
    }
}

class OpeningDetails {

    var imageName: String?
    var roleName: String?
    
    init(imageName: String, roleName: String) {
        self.imageName = imageName
        self.roleName = roleName
    }
    
    
    static func getAllOpeningDetails() -> [OpeningDetails] {
        return  [OpeningDetails(imageName: "designer", roleName: "UX Designer"),OpeningDetails(imageName: "web", roleName: "Web Developer"),OpeningDetails(imageName: "sde", roleName: "Software Engineer"),OpeningDetails(imageName: "pm", roleName: "Product Manager"),OpeningDetails(imageName: "designer", roleName: "UX Designer"),OpeningDetails(imageName: "web", roleName: "Web Developer"),OpeningDetails(imageName: "sde", roleName: "Software Engineer"),OpeningDetails(imageName: "pm", roleName: "Product Manager")]
    }
    
}
