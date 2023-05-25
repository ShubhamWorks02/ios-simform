//
//  ViewController.swift
//  OtpVerify
//
//  Created by Shubham Bhatt on 04/05/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var btnSelectAll: UIButton!
    @IBOutlet weak var btnSelect2: UIButton!
    @IBOutlet weak var btnSelect3: UIButton!
    @IBOutlet weak var btnSelect1: UIButton!
    @IBOutlet weak var marketingBtn: UIButton!
    @IBOutlet weak var adminBtn: UIButton!
    @IBOutlet weak var designerBtn: UIButton!
    @IBOutlet weak var switchSelect: UISwitch!
    
    @IBAction func selectAllChanged(_ sender: UIButton) {
        btnSelectAll.isSelected.toggle()
        if switchSelect.isOn && btnSelectAll.isSelected {
            btnSelect1.isSelected = true
            btnSelect2.isSelected = true
            btnSelect3.isSelected = true
//        }
//        if !switchSelect.isOn {
//
//        }
        } else {
            btnSelect1.isSelected = false
            btnSelect2.isSelected = false
            btnSelect3.isSelected = false
        }
    }
    
    @IBAction func select1Changed(_ sender: UIButton) {
        if switchSelect.isOn {
            sender.isSelected = true
//            btnSelect2.isSelected = false
//            btnSelect3.isSelected = false
        }
    }
    
    @IBAction func select2Changed(_ sender: UIButton) {
        if switchSelect.isOn {
            sender.isSelected = true
//            btnSelect1.isSelected = false
//            btnSelect3.isSelected = false
        }
    }
    
    @IBAction func select3Changed(_ sender: UIButton) {
        if switchSelect.isOn {
            sender.isSelected = true
//            btnSelect1.isSelected = false
//            btnSelect2.isSelected = false
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initValues()
        
        // Do any additional setup after loading the view.
    }
    
    private func initValues() {
        
        
        
    }
    

    
    @IBAction func switchValuechanged(_ sender: UISwitch) {
        if switchSelect.isOn {
            btnSelect1.isSelected = true
        } else {
            btnSelect1.isSelected = false
            btnSelect2.isSelected = false
            btnSelect3.isSelected = false
            btnSelectAll.isSelected = false
        }
    }
    
   
    
}

