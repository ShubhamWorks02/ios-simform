//
//  MemberDetailsModel.swift
//  TableView
//
//  Created by Shubham Bhatt on 17/05/23.
//

import Foundation
import UIKit

class MemberDetailsModel {
    
    var personName: String?
    var memberSincetxt: String?
    var description: String?
    var date: String?
    var isExpanded: Bool = false
    
    
    init(personName: String, memberSincetxt: String, description: String, date: String) {
        self.personName = personName
        self.memberSincetxt = memberSincetxt
        self.description = description
        self.date = date
    }
    
    static func getMemberDetails() -> [MemberDetailsModel] {
        return [MemberDetailsModel(personName: "Shubham", memberSincetxt: "Is a member since 2023", description: "By reusing the prototype cell, you can efficiently manage the creation and recycling of cells as the table view is scrolled. This approach helps improve performance and memory usage by reusing existing cells instead of creating new ones for each row.", date: "24th Jan 2023"),
                MemberDetailsModel(personName: "Shubham", memberSincetxt: "Is a member since 2023", description: "By reusing the prototype cell, you can efficiently manage the creation and recycling of cells as the table view is scrolled. This approach helps improve performance and memory usage by reusing existing cells instead of creating new ones for each row.", date: "24th Jan 2023"),
                MemberDetailsModel(personName: "Shubham", memberSincetxt: "Is a member since 2023", description: "By reusing the prototype cell, you can efficiently manage the creation and recycling of cells as the table view is scrolled. This approach helps improve performance and memory usage by reusing existing cells instead of creating new ones for each row.", date: "24th Jan 2023"),
                MemberDetailsModel(personName: "Shubham", memberSincetxt: "Is a member since 2023", description: "By reusing the prototype cell, you can efficiently manage the creation and recycling of cells as the table view is scrolled. This approach helps improve performance and memory usage by reusing existing cells instead of creating new ones for each row.", date: "24th Jan 2023")]
        
    }
    
}
