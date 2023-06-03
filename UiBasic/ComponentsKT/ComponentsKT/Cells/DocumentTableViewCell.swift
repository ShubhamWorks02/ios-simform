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
    
    var document: DocumentDetailsModel? {
        didSet {
            lblDocID.text = document?.id ?? ""
            lblApplicationSubject.text = document?.subject ?? ""
            lblApplicantEmail.text = document?.emailID ?? ""
            lblDate.text = document?.date ?? ""
            lblApplicationType.text = document?.type ?? ""
            btnApplicationStatus.setTitle(document?.status?.getStatus() ?? "", for: .normal)
            btnApplicationStatus.backgroundColor = document?.status == .awaitingApproval ? UIColor(red: 249/255, green: 230/255, blue: 209/255, alpha: 1.0) : UIColor(red: 221/255, green: 242/255, blue: 222/255, alpha: 1.0)
            btnApplicationStatus.setTitleColor(document?.status?.getColor(), for: .normal)
            setButtonCornerRadius(btnApplicationStatus, cornerRadius: 14)
        }
    }
    
    private func setButtonCornerRadius(_ button: UIButton, cornerRadius: CGFloat) {
        btnApplicationStatus.layer.cornerRadius = cornerRadius
        btnApplicationStatus.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMaxYCorner]
    }

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
