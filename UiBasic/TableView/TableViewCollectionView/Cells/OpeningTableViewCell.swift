//
//  OpeningTableViewCell.swift
//  TableViewCollectionViewCollectionView
//
//  Created by Shubham Bhatt on 29/05/23.
//

import UIKit

class OpeningTableViewCell: UITableViewCell {

    @IBOutlet weak var tableViewContainer: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        tableViewContainer.layer.cornerRadius = 20
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
