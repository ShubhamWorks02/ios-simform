//
//  JobCollectionViewCell.swift
//  TableView
//
//  Created by Shubham Bhatt on 22/05/23.
//

import UIKit

class JobCollectionViewCell: UICollectionViewCell {

    // MARK: OUTLETS
    @IBOutlet weak private var imgCompanyLogo: UIImageView!
    @IBOutlet weak private var containerView: UIView!
    @IBOutlet weak private var lblRoleName: UILabel!
    @IBOutlet weak private var stackViewContainer: UIStackView!
    
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
    
    func configCell(data: OpeningDetails, isExpanded: Bool = true) {
        imgCompanyLogo.image = UIImage(named: data.imageName ?? "")
//        imgCompanyLogo.image? = isExpanded ? CGSize(width: 75, height: 75) : CGSize(width: 55, height: 55)
        lblRoleName.text = data.roleName
        stackViewContainer.axis = isExpanded ? .horizontal : .vertical
        stackViewContainer.spacing = isExpanded ? 35 : 25
    }
    
    
    
}
