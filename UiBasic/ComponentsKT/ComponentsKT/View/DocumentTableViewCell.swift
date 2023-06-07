//
//  DocumentTableViewCell.swift
//  ComponentsKT
//
//  Created by Shubham Bhatt on 02/06/23.
//

import UIKit

class DocumentTableViewCell: UITableViewCell {

    // MARK: OUTLETS
    @IBOutlet weak private var lblDocID: UILabel!
    @IBOutlet weak private var lblApplicationSubject: UILabel!
    @IBOutlet weak private var lblApplicantEmail: UILabel!
    @IBOutlet weak private var lblDate: UILabel!
    @IBOutlet weak private var btnApplicationStatus: UIButton!
    @IBOutlet weak private var lblApplicationType: UILabel!
    @IBOutlet weak private var listView: UIView!
    
    // MARK: VARIABLES
    var document: DocumentDetailsModel? {
        didSet {
            lblDocID.text = document?.id ?? "NA"
            lblApplicationSubject.text = document?.subject ?? "NA"
            lblApplicantEmail.text = document?.emailID ?? "NA"
            lblDate.text = document?.date ?? "NA"
            lblApplicationType.text = document?.type ?? "NA"
            setBtnProperties(button: btnApplicationStatus)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        listView.layer.cornerRadius = 14
    }
    
    private func setButtonCornerRadius(cornerRadius: CGFloat) {
        btnApplicationStatus.layer.cornerRadius = cornerRadius
        btnApplicationStatus.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMaxYCorner]
    }
    
    private func setBtnProperties(button: UIButton) {
        button.setTitle(document?.status?.getStatus() ?? "NA", for: .normal)
        button.backgroundColor = document?.status == .awaitingApproval ? UIColor(red: 249/255, green: 230/255, blue: 209/255, alpha: 1.0) : UIColor(red: 221/255, green: 242/255, blue: 222/255, alpha: 1.0)
        button.setTitleColor(document?.status?.getColor(), for: .normal)
        setButtonCornerRadius(cornerRadius: 14)
    }

}
