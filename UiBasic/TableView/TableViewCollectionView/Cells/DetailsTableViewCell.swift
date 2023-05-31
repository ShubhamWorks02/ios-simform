//
//  DetailsTableViewCell.swift
//  TableViewCollectionViewCollectionView
//
//  Created by Shubham Bhatt on 31/05/23.
//

import UIKit

class DetailsTableViewCell: UITableViewCell {
    
    // MARK: OUTLETS
    @IBOutlet weak var lblDetails: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configCell(data: String, isHeader: Bool = false) {
        if !isHeader {
            lblDetails.attributedText = getBulletedString(str: data)
            return
        }
        lblDetails.text = data
    }
    
    func getBulletedString (str: String) -> NSAttributedString {
        let bulletPoint = "\u{2022}"
        // let content = "Lorem ipsum dolor sit amet, consectetur adipiscing elit.dfidfhdfjpdfkpdjsfiojdiofjudehufhduhfudhyufhudhfihdfiyg"

        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.headIndent = 30// Adjust the indentation value as needed

        let attributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.systemFont(ofSize: 16),
            .foregroundColor: UIColor.black,
            .paragraphStyle: paragraphStyle
        ]

        let bulletAttributedString = NSAttributedString(string: "    \(bulletPoint) ", attributes: attributes)
        let contentAttributedString = NSAttributedString(string: str, attributes: attributes)

        let fullAttributedString = NSMutableAttributedString()
        fullAttributedString.append(bulletAttributedString)
        fullAttributedString.append(contentAttributedString)

        
        return fullAttributedString
        //lblBullet.attributedText = fullAttributedString
    }

    
}
