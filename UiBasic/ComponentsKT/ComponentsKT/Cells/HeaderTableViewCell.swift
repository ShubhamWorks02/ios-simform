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
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
