//
//  ViewControllerBtn.swift
//  UiComponent
//
//  Created by Shubham Bhatt on 02/05/23.
//

import UIKit

class ViewControllerBtn: UIViewController {

    @IBOutlet var mainView: UIView!
    @IBOutlet weak var loginBtn: UIButton!
    
    @IBOutlet weak var selectedBtn: UIButton!
    @IBOutlet weak var propBtn: UIButton!
    @IBAction func anotherFunc(_ sender: UIButton) {
        if(sender.isSelected) {
            mainView.backgroundColor = .red
        }
    }
    @IBAction func loginPressed(_ sender: UIButton) {
        let str = NSAttributedString(string: "attributed string")
        let selectedStr = NSAttributedString(string: "selected")
        sender.setAttributedTitle(selectedStr, for: .selected)
        sender.setAttributedTitle(str, for: .normal)
        sender.isHighlighted = true
        if(sender.isHighlighted) {
            sender.setTitle("highlighted", for: .highlighted)
            mainView.backgroundColor = .red
        }
        sender.backgroundColor = UIColor.black
        mainView.backgroundColor = .gray
    }
    
    @IBAction func onPressSelcted(_ sender: UIButton) {
        print(sender.isHighlighted, "isHigh")
        sender.isSelected = true
        //mainView.backgroundColor = UIColor.black
        print(sender.isSelected, "isSelected")
    }
    
    
    
    @IBAction func placeImage(_ sender: UIButton) {
//        let image = UIImage(named: "img")
//        propBtn.imageEdgeInsets = UIEdgeInsets(top: 50, left: 10, bottom: 0, right: 50)
//        propBtn.setImage(image, for: .highlighted)
        propBtn.contentEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 20)

//        if(sender.isHighlighted) {
//            propBtn.setTitle("highli",for: .highlighted)
//        }
    
        if(sender.isSelected){
            propBtn.setTitle("selected",for: .selected)
        }
        //propBtn.isSelected = true
        // propBtn.isHighlighted = true
        

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        if(loginBtn.isHighlighted){
//            loginBtn.setTitle("highlighted", for: .highlighted)
//            mainView.backgroundColor = .red
//        }
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
