//
//  ViewControllerSwitch.swift
//  UiComponent
//
//  Created by Shubham Bhatt on 04/05/23.
//

import Foundation
import UIKit

class ViewControllerSwitchSlider : UIViewController {
    
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var switchforLbl: UISwitch!
    @IBOutlet weak var lblTxt: UILabel!
    private var thumbOriginalRect: CGRect = .zero

    
    override func viewDidLoad() {
        super.viewDidLoad()
        switchforLbl.setOn(true, animated: true)
//        switchforLbl.offImage = UIImage(named: "img")
        switchforLbl.addTarget(self, action: #selector(onSwitchChanged), for: .valueChanged)
        
        if let onImage = UIImage(systemName: "trash") {
            switchforLbl.onImage = onImage
        }
        slider.isContinuous = true
        slider.minimumValue = 0
        slider.maximumValue = 60  
    }
    
    @objc func onSwitchChanged() {
        lblTxt.text = switchforLbl.isOn ? "On" : "Off"
        
        switchforLbl.layer.borderColor = UIColor.green.cgColor
        let color = UIColor(patternImage: UIImage(named: switchforLbl.isOn ? "img": "img")!)
                if switchforLbl.isOn {
                    switchforLbl.onTintColor = color
                    
                } else {
                    switchforLbl.tintColor = color
                    // switchforLbl.subviews[0].subviews[0].backgroundColor = color
                }
        isSlidable()
        
    }
    
    func isSlidable() {
        if switchforLbl.isOn {
            slider.isUserInteractionEnabled = true
            return
        }
        slider.isUserInteractionEnabled = false
    }
    
    @IBAction func sliderValueChanged(_ sender: UISlider) {
        print("slider has slided through \(sender.value*100)")
        
    }

}

