//
//  DateViewController.swift
//  TableViewCollectionViewCollectionView
//
//  Created by Shubham Bhatt on 24/05/23.
//

import UIKit

class DateViewController: UIViewController {

    @IBOutlet weak var segmentType: UISegmentedControl!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var lblCurrentDate: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        datePicker.locale = .current
        datePicker.date = Date()
        datePicker.preferredDatePickerStyle = .compact
        // Do any additional setup after loading the view.
    }
    

    @IBAction func btnSegTapped(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0: datePicker.preferredDatePickerStyle = .compact
        case 1: datePicker.preferredDatePickerStyle = .inline
        case 2: datePicker.preferredDatePickerStyle = .wheels
        default:
            break
        }
    }
}
