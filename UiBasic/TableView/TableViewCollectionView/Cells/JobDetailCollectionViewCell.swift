//
//  JobDetailCollectionViewCell.swift
//  TableViewCollectionViewCollectionView
//
//  Created by Shubham Bhatt on 29/05/23.
//

import UIKit

class JobDetailCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var containerView: UIView!
    
    @IBOutlet weak var companyPick: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        containerView.layer.cornerRadius = 24
        companyPick.backgroundColor = .white
        companyPick.layer.cornerRadius = 11
        // Initialization code
    }

}
