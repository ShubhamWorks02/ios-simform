//
//  UserTableViewCell.swift
//  URLSession
//
//  Created by Shubham Bhatt on 04/07/23.
//

import UIKit
import Kingfisher

class UserTableViewCell: UITableViewCell {

    // MARK: OUTLET
    @IBOutlet weak private var imgUser: UIImageView!
    @IBOutlet weak private var lblUserName: UILabel!
    @IBOutlet weak private var lblUserEmail: UILabel!
    @IBOutlet weak private var lblUserid: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        imgUser.makeViewCircular()
    }
    
    func configCell(data: User) {
        if let imageUrl = data.avatar {
            imgUser.kf.setImage(with: URL(string: imageUrl))
        }
        lblUserName.text = "\(data.firstName!) \(data.lastName!)"
        if let id = data.id {
            lblUserid.text = "\(id)"
        }
        lblUserEmail.text = data.email!
    }
    
}
