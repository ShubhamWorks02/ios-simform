//
//  FilterCollectionViewCell.swift
//  ComponentsKT
//
//  Created by Shubham Bhatt on 02/06/23.
//

import UIKit

class FilterCollectionViewCell: UICollectionViewCell {

   
    
    @IBOutlet weak var imgClearFilter: UIImageView!
    @IBOutlet weak var cellContainerView: UIView!
    @IBOutlet weak var lblFilterTitle: UILabel!
    @IBOutlet weak var lblFilterValue: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        cellContainerView.layer.cornerRadius = 10
    }

}
