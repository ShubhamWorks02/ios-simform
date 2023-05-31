//
//  LabelCollectionViewCell.swift
//  TableViewCollectionViewCollectionView
//
//  Created by Shubham Bhatt on 30/05/23.
//

import UIKit

class LabelCollectionViewCell: UICollectionViewCell {
    
    // MARK: OUTLETS
    @IBOutlet weak var lblCategory: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func config(data: String) {
        lblCategory.text = data
    }

}
