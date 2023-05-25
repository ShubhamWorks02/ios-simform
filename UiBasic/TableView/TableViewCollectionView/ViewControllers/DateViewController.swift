//
//  DateViewController.swift
//  TableViewCollectionViewCollectionView
//
//  Created by Shubham Bhatt on 24/05/23.
//

import UIKit

class DateViewController: UIViewController {

    // MARK: OUTLETS
    @IBOutlet weak private var segmentType: UISegmentedControl!
    @IBOutlet weak private var datePicker: UIDatePicker!
    @IBOutlet weak private var lblCurrentDate: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        datePicker.locale = .current
        datePicker.date = Date()
        datePicker.addTarget(self, action: #selector(dateSelection), for: .valueChanged)
        datePicker.preferredDatePickerStyle = .compact
        // Do any additional setup after loading the view.
        datePicker.setDate(Date().addingTimeInterval(-2 * 24 * 60 * 60), animated: false) // Set date 2 days before the current date

    }
    
    // MARK: ACTIONS
    @IBAction func btnSegTapped(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0: datePicker.preferredDatePickerStyle = .compact
        case 1: datePicker.preferredDatePickerStyle = .inline
        case 2: datePicker.preferredDatePickerStyle = .wheels
        default:
            break
        }
    }
    
    @objc func dateSelection() {
        let dateFormatter = DateFormatter()
        let randomInteger = Int.random(in: 1...8) // Generate a random integer between 1 and 8

        switch randomInteger {
        case 1:
            dateFormatter.dateFormat = "MM/dd/yyyy HH:mm:ss" // Month/Day/Year Hour:Minute:Second (24-hour format)
        case 2:
            dateFormatter.dateFormat = "dd/MM/yyyy HH:mm:ss" // Day/Month/Year Hour:Minute:Second (24-hour format)
        case 3:
            dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss" // Year-Month-Day Hour:Minute:Second (24-hour format)
        case 4:
            dateFormatter.dateFormat = "EEEE, MMM d, yyyy hh:mm:ss a" // Day of the week, Month Day, Year Hour:Minute:Second AM/PM (12-hour format)
        case 5:
            dateFormatter.dateFormat = "h:mm:ss a" // Hour:Minute:Second AM/PM (12-hour format)
        case 6:
            dateFormatter.dateFormat = "HH:mm:ss" // Hour:Minute:Second (24-hour format)
        case 7:
            dateFormatter.dateFormat = "MMM d, h:mm:ss a" // Month Day, Hour:Minute:Second AM/PM (12-hour format)
        case 8:
            dateFormatter.dateFormat = "yyyy-MM-dd h:mm:ss a" // Year-Month-Day Hour:Minute:Second AM/PM (12-hour format)
        default:
            break
        }

        let selectedDate = dateFormatter.string(from: datePicker.date)
        lblCurrentDate.text = selectedDate
    }


}
