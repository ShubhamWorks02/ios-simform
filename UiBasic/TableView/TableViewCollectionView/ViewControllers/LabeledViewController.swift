//
//  LabeledViewController.swift
//  TableViewCollectionViewCollectionView
//
//  Created by Shubham Bhatt on 30/05/23.
//

import UIKit

class LabeledViewController: UIViewController {

    @IBOutlet weak var lblBullet: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let bulletPoint = "\u{2022}"
        let content = "Lorem ipsum dolor sit amet, consectetur adipiscing elit.dfidfhdfjpdfkpdjsfiojdiofjudehufhduhfudhyufhudhfihdfiyg"

        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.headIndent = 10 // Adjust the indentation value as needed

        let attributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.systemFont(ofSize: 16),
            .foregroundColor: UIColor.black,
            .paragraphStyle: paragraphStyle
        ]

        let bulletAttributedString = NSAttributedString(string: "\(bulletPoint) ", attributes: attributes)
        let contentAttributedString = NSAttributedString(string: content, attributes: attributes)

        let fullAttributedString = NSMutableAttributedString()
        fullAttributedString.append(bulletAttributedString)
        fullAttributedString.append(contentAttributedString)

        

        lblBullet.attributedText = fullAttributedString

        // Do any additional setup after loading the view.
    }
    
}
