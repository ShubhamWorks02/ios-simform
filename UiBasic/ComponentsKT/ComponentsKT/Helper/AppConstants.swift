//
//  AppConstants.swift
//  ComponentsKT
//
//  Created by Shubham Bhatt on 05/06/23.
//

import Foundation
import UIKit

struct Constants {
    
    struct Cell {
        static let documentTableViewCell = "DocumentTableViewCell"
        static let headerCollectionReusableView = "HeaderCollectionReusableView"
        static let filterCollectionViewCell = "FilterCollectionViewCell"
        static let headerTableViewCell = "HeaderTableViewCell"
    }
    
    struct VCs {
        static let formViewController = "FormViewController"
    }
    
    struct StoryBoards {
        static let main = "Main"
    }
    
    struct DocStatuses {
        static let approved = "Approved"
        static let awaitingApproval = "Awaiting Approval"
    }
    
    struct Colors {
        static let statusBtnApprovedColor = "statusBtnApprovedColor"
        static let statusBtnAwaitingColor = "statusBtnAwaitingColor"
        static let headerThemeColor = "headerThemeColor"
    }
    
    struct TableViewConstants {
        static let heightForHeader = 29.0
    }
    
    struct CollectionViewConstants {
        static let numberOfItemsInSection = 3
    }
    
    struct Strings {
        static let lblUserNameStr = "Davis\nBapista"
        static let lblFilterStr = "Applied Filters (0)"
        static let txtFirstNameStr = "First Name"
        static let txtLastNameStr = "Last Name"
        static let txtEmailStr = "Email"
        static let txtJobTitleStr = "Job Title"
        static let txtCompanyNameStr = "Company Name"
        static let imgCameraStr = "camera"
        static let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        static let emailPredicate = "SELF MATCHES %@"
        static let alertTitle = "Invalid Input"
        static let alertAction = "OK"
    }
    
}
