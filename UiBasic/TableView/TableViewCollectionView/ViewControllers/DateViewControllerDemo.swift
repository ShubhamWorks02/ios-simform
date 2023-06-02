//
//  DateViewControllerDemo.swift
//  TableViewCollectionViewCollectionView
//
//  Created by Shubham Bhatt on 26/05/23.
//

import UIKit

class DateViewControllerDemo: UIViewController {

    
    @IBOutlet weak var secondDatePicker: UIDatePicker!
    @IBOutlet weak var firstDatePicker: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        secondDatePicker.minimumDate = Date()
        
        // Add target to the first date picker to update the minimum date of the second date picker
        firstDatePicker.addTarget(self, action: #selector(updateSecondDatePickerMinimumDate), for: .valueChanged)
        // Do any additional setup after loading the view.
    }
    @objc func updateSecondDatePickerMinimumDate() {
        // Get the selected date from the first date picker
        let selectedDate = firstDatePicker.date
        
        // Update the minimum date of the second date picker to the selected date
        secondDatePicker.minimumDate = selectedDate
    }
}
