//
//  JobCollectionViewCell.swift
//  TableView
//
//  Created by Shubham Bhatt on 22/05/23.
//

import UIKit

class JobCollectionViewCell: UICollectionViewCell {

    // MARK: OUTLETS
    @IBOutlet weak var imgCompanyLogo: UIImageView!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var lblRoleName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        initViews()
        // Initialization code
    }
    
    // MARK: INITIALIZATION CELL
    private func initViews() {
        containerView.layer.cornerRadius = 15
        containerView.backgroundColor = UIColor(red: 19/255, green: 21/255, blue: 30/255, alpha: 1)
    }
    
    func configCell(data: OpeningDetails) {
        imgCompanyLogo.image = UIImage(named: data.imageName ?? "")
        lblRoleName.text = data.roleName
        
    }

    
}
