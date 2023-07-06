//
//  EditProfileVc.swift
//  URLSession
//
//  Created by Shubham Bhatt on 04/07/23.
//

import UIKit
import Kingfisher

class EditProfileVc: UIViewController {
    
    // MARK: OUTLETS
    @IBOutlet weak private var tfFirstName: UITextField!
    @IBOutlet weak private var tfLastName: UITextField!
    @IBOutlet weak private var tfEmail: UITextField!
    @IBOutlet weak private var imgUserProfile: UIImageView!
    @IBOutlet weak private var tfJob: UITextField!
    @IBOutlet weak private var imgContainerView: UIView!
    @IBOutlet weak private var containerView: UIView!
    
    // MARK: VARIABLES
    var userData: User?
    private lazy var viewModel = EditProfileViewModel()
    var coordinator: EditProfileCoordinator? // not being used
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpViews()
    }
    
    private func placeImageOnProfile() {
        let childView = UIView()
        childView.frame = CGRect(x: (imgUserProfile.bounds.width) - 18, y: imgUserProfile.bounds.height - 20, width: 28, height: 28)
        childView.backgroundColor = UIColor(named: "tableTheme")
        childView.layer.cornerRadius = childView.bounds.width/2
        let cameraImg = UIImageView()
        
        cameraImg.image = UIImage(named: "camera")
        cameraImg.tintColor = UIColor(named: "themeColor")
        cameraImg.frame = CGRect(x: childView.bounds.midX - 6.5, y: childView.bounds.midY - 6.5, width: 13, height: 13)
        childView.layer.borderWidth = 2
        childView.layer.borderColor = UIColor.white.cgColor
        cameraImg.layer.cornerRadius = cameraImg.bounds.width / 2
        
        childView.clipsToBounds = true
        imgUserProfile.isUserInteractionEnabled = true
        childView.addSubview(cameraImg)
        childView.layer.cornerRadius = childView.bounds.height / 2
        imgUserProfile.layer.cornerRadius = imgUserProfile.bounds.height/2
        imgContainerView.addSubview(childView)
    }
    
    private func getResponseStatus() {
        viewModel.isResponseArrivedSucessfully.bind { [weak self] isSuccessFull in
            DispatchQueue.main.async {
                let alertController = UIAlertController(title: "Profile Updated", message: "Thank you", preferredStyle: .alert)
                let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
                alertController.addAction(okAction)
                
                // Present the alert
                self?.present(alertController, animated: true, completion: nil)
            }
        }
    }
    
    
    @objc private func saveProfileButtonClicked(_ sender: UITapGestureRecognizer) {
        guard let firstName = tfFirstName.text,
              let lastName = tfLastName.text,
              let job = tfJob.text,
              validateEntriesAndUpdate(firstName: firstName, lastName: lastName, job: job) else {
            return
        }
        getResponseStatus()
    }
    
    @objc private func backButtonPressed(_ sender: UITapGestureRecognizer) {
        navigationController?.popViewController(animated: true)
    }
    
    private func validateEntriesAndUpdate(firstName: String, lastName: String, job: String) -> Bool {
        if !firstName.isEmpty && !lastName.isEmpty && !job.isEmpty {
            let editUserReq = EditUserRequest(name: "\(firstName) \(lastName)", job: tfJob.text)
            if let id = userData?.id {
                viewModel.editProfileOnServer(userId: id, userRequest: editUserReq)
                return true
            }
        } else {
            let alertController = UIAlertController(title: "Invalid Entries", message: "Please fill in all the fields.", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            alertController.addAction(okAction)
            present(alertController, animated: true, completion: nil)
        }
        return false
    }
    
    private func configureUserData(user: User) {
        tfFirstName.text = user.firstName
        tfLastName.text = user.lastName
        tfEmail.text = user.email
        tfJob.text = "zion resident"
        if let userImg = user.avatar {
            imgUserProfile.kf.setImage(with: URL(string: userImg))
        }
    }
    
    private func setUpViews() {
        navigationController?.setNavigationBarHidden(false, animated: false)
        navigationItem.title = "Edit Profile"
        let saveBtn = UIBarButtonItem(image: UIImage(named: "imgTick"),
                                      style: .plain, target: self, action: #selector(saveProfileButtonClicked))
        saveBtn.tintColor = UIColor(named: "tableTheme")
        navigationItem.rightBarButtonItem = saveBtn
        let backBtn = UIBarButtonItem(image: UIImage(named: "imgback2"),
                                      style: .plain, target: self, action: #selector(backButtonPressed))
        backBtn.tintColor = UIColor(named: "tableTheme")
        navigationItem.leftBarButtonItem = backBtn
        containerView.layer.cornerRadius = 15
        guard let userData else {
            return
        }
        placeImageOnProfile()
        configureUserData(user: userData)
    }
    
}
