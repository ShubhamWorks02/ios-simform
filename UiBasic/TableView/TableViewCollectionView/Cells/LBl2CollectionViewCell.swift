//
//  LBl2CollectionViewCell.swift
//  TableViewCollectionViewCollectionView
//
//  Created by Shubham Bhatt on 31/05/23.
//

import UIKit

class LBl2CollectionViewCell: UICollectionViewCell {

    // MARK: OUTLETS
    @IBOutlet weak var lblDetails: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configCell(data: String) {
        lblDetails.text = data
    }

}
