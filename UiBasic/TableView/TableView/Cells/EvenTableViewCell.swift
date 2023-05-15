//
//  EvenTableViewCell.swift
//  TableView
//
//  Created by Shubham Bhatt on 15/05/23.
//

import UIKit

class EvenTableViewCell: UITableViewCell {

    // MARK: OUTLETS
    @IBOutlet weak var lblEven: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
