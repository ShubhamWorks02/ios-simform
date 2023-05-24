//
//  HeaderCollectionViewCell.swift
//  TableView
//
//  Created by Shubham Bhatt on 22/05/23.
//

import UIKit

class HeaderCollectionViewCell: UICollectionReusableView {

    // MARK: OUTLETS
    @IBOutlet weak var lblHeaderCategory: UILabel!
    @IBOutlet weak var btnSeeAll: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
 
    func configure(categoryName: String) {
        lblHeaderCategory.text = categoryName
    }
 
}
