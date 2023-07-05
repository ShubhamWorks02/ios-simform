//
//  ProfileVc.swift
//  URLSession
//
//  Created by Shubham Bhatt on 04/07/23.
//

import UIKit
import Kingfisher

class ProfileVc: UIViewController {
    
    // MARK: OUTLETS
    @IBOutlet weak var imgProfile: UIImageView!
    @IBOutlet weak var lblUserName: UILabel!
    @IBOutlet weak var lblEmail: UILabel!
    @IBOutlet weak var lblUserLastName: UILabel!
    @IBOutlet weak var lblUserId: UILabel!
    @IBOutlet weak var btnNotificationStatus: UIButton!
    
    // MARK: VARIABLES
    var userData: User?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        initSetUp()
    }
    
    // MARK: ACTION METHODS
    @IBAction func btnNotificationClicked(_ sender: UIButton) {
        sender.isSelected.toggle()
    }
    
    @objc private func editProfileTapped(_ sender: UITapGestureRecognizer) {
        guard let editProfileVc = storyboard?.instantiateViewController(
            withIdentifier: "EditProfileVc") as? EditProfileVc else {
            return
        }
        editProfileVc.userData = userData
        navigationController?.pushViewController(editProfileVc, animated: true)
    }
}

// MARK: UI SETUPS
extension ProfileVc {
    private func initSetUp() {
        setUpUserProfile()
        imgProfile.makeViewCircular()
        btnNotificationStatus.isSelected = false
        setUpViews()
    }
    
    private func setUpUserProfile() {
        if let imgString = userData?.avatar {
            imgProfile.kf.setImage(with: URL(string: imgString))
        }
        lblEmail.text = userData?.email
        lblUserName.text = userData?.firstName
        lblUserLastName.text = userData?.lastName
        if let userId = userData?.id {
            lblUserId.text = "\(userId)"
        }
    }
    
    private func setUpViews() {
        navigationItem.title = "Profile"
        let saveBtn = UIBarButtonItem(image: UIImage(named: "imgBack"),
                                      style: .plain, target: self, action: #selector(editProfileTapped(_:)))
        saveBtn.tintColor = UIColor(named: "tableTheme")
        navigationItem.rightBarButtonItem = saveBtn
        navigationItem.setHidesBackButton(true, animated: true)
    }
    
}

// MARK: EXTENSIONS CUSTOMIZE
extension UIView {
    func makeViewCircular() {
        layer.cornerRadius = self.frame.height / 2
        layer.masksToBounds = false
        clipsToBounds = true
    }
}
