//
//  HeaderTableViewCell.swift
//  ComponentsKT
//
//  Created by Shubham Bhatt on 02/06/23.
//

import UIKit

class HeaderTableViewCell: UITableViewCell {

    // MARK: OUTLETS
    @IBOutlet weak private var lblSectionName: UILabel!
    
    // MARK: VARIABLES
    var sectionName: String? {
        didSet {
            lblSectionName.text = sectionName
        }
    }
    
}
