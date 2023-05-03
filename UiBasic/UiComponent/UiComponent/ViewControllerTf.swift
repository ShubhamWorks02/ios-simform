//
//  ViewControllerTf.swift
//  UiComponent
//
//  Created by Shubham Bhatt on 03/05/23.
//

import UIKit

class ViewControllerTf: UIViewController {
    
    @IBOutlet weak var textField1: UITextField!
    @IBOutlet weak var clrBtn: UITextField!
    @IBOutlet weak var changeTfBtn: UIButton!
    @IBAction func changeTfwhenPressed(_ sender: UIButton) {
        textField1.text = "btn pressed"
        // textField1.isSelected = true
    }
    
    @IBAction func changeClrTf(_ sender: Any) {
        clrBtn.text = "pressed"
        clrBtn.isOpaque = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
