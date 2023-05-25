//
//  ExpandableTableViewCell.swift
//  TableView
//
//  Created by Shubham Bhatt on 17/05/23.
//

import UIKit

class ExpandableTableViewCell: UITableViewCell {

    // MARK: OUTLETS
    @IBOutlet weak var lblPersonName: UILabel!
    @IBOutlet weak var lblMemberDuration: UILabel!
    @IBOutlet weak var lblDescription: UILabel!
    @IBOutlet weak var lblDate: UILabel!
    @IBOutlet weak var btnSeeMore: UIButton!
    @IBOutlet weak var heightOut: NSLayoutConstraint!
    
    // MARK: VARIABLES
    var seeMoreDelegate: BtnDelegate?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    
    func configCell(data: MemberDetailsModel) {
        lblPersonName.text = data.personName
        lblMemberDuration.text = data.memberSincetxt
        lblDescription.text = data.description
        lblDate.text = data.date
        heightOut.priority = UILayoutPriority(data.isExpanded ? 1 : 1000) // initial label not visible
        lblDescription.numberOfLines = data.isExpanded ? 0 : 3
    }
    
    // MARK: ACTIONS
    @IBAction func seeMoreTapped(_ sender: UIButton) {
        seeMoreDelegate?.btnSeemoreTapped(cell: self)

    }
}

protocol BtnDelegate {
    func btnSeemoreTapped(cell: ExpandableTableViewCell)
}
