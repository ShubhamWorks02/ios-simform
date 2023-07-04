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
    @IBOutlet weak var imgUser: UIImageView!
    @IBOutlet weak var lblUserName: UILabel!
    @IBOutlet weak var lblUserEmail: UILabel!
    @IBOutlet weak var lblUserid: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func configCell(data: User) {
        if let imageUrl = data.avatar {
            imgUser.kf.setImage(with: URL(string: imageUrl))
        }
        lblUserName.text = "\(data.firstName!) \(data.lastName!)"
        lblUserid.text = "\(data.id)"
        lblUserEmail.text = data.email!
    }
    
    func makeImageViewCircular() {
        
    }
    
}
