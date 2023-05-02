//
//  ViewController.swift
//  JobSeek
//
//  Created by Shubham Bhatt on 02/05/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var fBtn: UIButton!
    @IBOutlet weak var appleBtn: UIButton!
    @IBOutlet weak var googleBtn: UIButton!
    @IBOutlet weak var emaiLabel: UITextField1!
    @IBOutlet weak var passWordField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
//        emaiLabel.leftViewMode = UITextField.ViewMode.always
//        var imageView = UIImageView();
//        var image = UIImage(named: "mail");
//        imageView.image = image;
//        emaiLabel.leftView = imageView;
        // Do any additional setup after loading the view.
        // UITextFieldEmail().labelPlaceholderColorChange(emaiLabel: emaiLabel)
        
        emaiLabel.attributedPlaceholder = NSAttributedString(
            string: "Email",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray]
        )
        
        passWordField.attributedPlaceholder = NSAttributedString(
            string: "Password",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray]
        )
        appleBtn.layer.cornerRadius = appleBtn.frame.width / 2
        appleBtn.layer.masksToBounds = true
        fBtn.layer.cornerRadius = fBtn.frame.width / 2
        fBtn.layer.masksToBounds = true
        
        // .addSubview(appleBtn)
    }

    
}

//
//    func labelPlaceholderColorChange(emaiLabel: UITextField) {
//        // emailabel.
//        emaiLabel.attributedPlaceholder = NSAttributedString(
//            string: "Email",
//            attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray]
//        )
//    }
//
//
