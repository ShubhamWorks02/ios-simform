//
//  DocumentTableViewCell.swift
//  ComponentsKT
//
//  Created by Shubham Bhatt on 02/06/23.
//

import UIKit

class DocumentTableViewCell: UITableViewCell {

    // MARK: OUTLETS
    @IBOutlet weak var lblDocID: UILabel!
    @IBOutlet weak var lblApplicationSubject: UILabel!
    @IBOutlet weak var lblApplicantEmail: UILabel!
    @IBOutlet weak var lblDate: UILabel!
    @IBOutlet weak var btnApplicationStatus: UIButton!
    @IBOutlet weak var lblApplicationType: UILabel!
    @IBOutlet weak var listView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        listView.layer.cornerRadius = 14
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    
}
