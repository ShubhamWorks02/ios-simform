//
//  ColorPickerViewController.swift
//  UINavigation
//
//  Created by Shubham Bhatt on 06/06/23.
//

import UIKit

class ColorPickerViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func didTapRedBtn(_ sender: UIButton) {
        pushVC(title: "red", color: .red)
    }
    
    
    @IBAction func didTapGreenBtn(_ sender: UIButton) {
        pushVC(title: "green", color: .green)
    }
    
    private func pushVC(title: String, color: UIColor) {
        let vc = UIViewController()
        vc.view.backgroundColor = color
        vc.title = title
        navigationController?.pushViewController(vc, animated: true)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
