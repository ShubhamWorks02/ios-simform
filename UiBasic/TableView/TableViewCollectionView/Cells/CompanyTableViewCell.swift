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
    //  var imageDelegate: TapImageDelegate?
    
    var configData: FindJobModel? {
        didSet {
            imgLogo.image = UIImage(named: configData?.imageName ?? "")
            lblCompanyName.text = configData?.companyName
            imgSelect.isUserInteractionEnabled = true
            // let tap = UITapGestureRecognizer(target: self, action: #selector(imageSelectTap(_:)))
            //imgSelect.addGestureRecognizer(tap)
            if configData!.isSelected {
                imgSelect.backgroundColor = .white
                imgSelect.image = UIImage(named: "check")
            } else {
                imgSelect.backgroundColor = .gray
                imgSelect.image = UIImage(named: "uncheck")
            }
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
//    func configCell(data: FindJobModel, tap: UITapGestureRecognizer) {
//        var obsv: CompanyTableViewCell? {
//            didSet{
//                obsv?.lblCompanyName.text = data.companyName
//            }
//        }
//        imgLogo.image = UIImage(named: data.imageName ?? "")
//        lblCompanyName.text = data.companyName
//        imgSelect.isUserInteractionEnabled = true
//        // let tap = UITapGestureRecognizer(target: self, action: #selector(imageSelectTap(_:)))
//        imgSelect.addGestureRecognizer(tap)
//        if data.isSelected {
//            imgSelect.backgroundColor = .white
//            imgSelect.image = UIImage(named: "check")
//        } else {
//            imgSelect.backgroundColor = .gray
//            imgSelect.image = UIImage(named: "uncheck")
//        }
//    }
    
//    @objc func imageSelectTap(_ sender: UITapGestureRecognizer) {
//        print("objc called")
//        imageDelegate?.imageSelectTapped(cell: self)
//    }
    
}
//
//protocol TapImageDelegate {
//    func imageSelectTapped(cell: UITableViewCell)
//}
