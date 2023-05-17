//
//  CompanyTableViewCell.swift
//  TableView
//
//  Created by Shubham Bhatt on 15/05/23.
//

import UIKit

class CompanyTableViewCell: UITableViewCell {

    // MARK: OUTLETS
    @IBOutlet weak var imgLogo: UIImageView!
    @IBOutlet weak var lblCompanyName: UILabel!
    @IBOutlet weak var imgSelect: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func configCell(data: FindJobModel) {
        imgLogo.image = UIImage(named: data.imageName ?? "")
        lblCompanyName.text = data.companyName
        //imgSelect.addGestureRecognizer(<#T##gestureRecognizer: UIGestureRecognizer##UIGestureRecognizer#>)
        if data.isSelected {
            imgSelect.backgroundColor = .white
            imgSelect.image = UIImage(named: "check")
        } else {
            imgSelect.backgroundColor = .gray
            imgSelect.image = UIImage(named: "uncheck")
        }
    }
    
    
}
