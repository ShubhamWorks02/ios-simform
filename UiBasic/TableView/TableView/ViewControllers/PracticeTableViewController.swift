//
//  PracticeTableViewController.swift
//  TableView
//
//  Created by Shubham Bhatt on 17/05/23.
//

import UIKit

class PracticeTableViewController: UIViewController {

    @IBOutlet weak var tblViewPractice: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initValues()
        tblViewPractice.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
    }
    
    private func initValues() {
        tblViewPractice.delegate = self
        tblViewPractice.dataSource = self
        

    }


}

// MARK: TBVDATASOURCE
extension PracticeTableViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 15
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
//        var cell = defaultCellConfig(indexPath: indexPath)
//        return cell
        var defaultCell = tblViewPractice.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        defaultCell = UITableViewCell(style: .subtitle, reuseIdentifier: "Cell")        // Configure the cell's text label
        defaultCell.textLabel?.text = "Row \(indexPath.row)"
        
        // Optional: Configure the cell's detail text label
        defaultCell.detailTextLabel?.text = "Subtitle"
        
        // Optional: Configure the cell's image view
        defaultCell.imageView?.image = UIImage(named: "check")
        
        return defaultCell
    }

    // Method for default cell making
    func defaultCellConfig(indexPath: IndexPath) -> UITableViewCell {
        var defaultCell = tblViewPractice.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        defaultCell = UITableViewCell(style: .subtitle, reuseIdentifier: "Cell")        // Configure the cell's text label
        defaultCell.textLabel?.text = "Row \(indexPath.row)"
        
        // Optional: Configure the cell's detail text label
        defaultCell.detailTextLabel?.text = "Subtitle"
        
        // Optional: Configure the cell's image view
        defaultCell.imageView?.image = UIImage(named: "check")
        
        return defaultCell
    }
    

    
}

// MARK: TBVDELEGATE
extension PracticeTableViewController: UITableViewDelegate {
    
//    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
//        print("cell will display having indexpath : ",indexPath)
//    }
//
//    func tableView(_ tableView: UITableView, didEndDisplaying cell: UITableViewCell, forRowAt indexPath: IndexPath) {
//        print("didEndDisplaying")
//    }
//
//    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
//        print("didDeselectRowAt")
//    }
//
//    func tableView(_ tableView: UITableView, willDeselectRowAt indexPath: IndexPath) -> IndexPath? {
//        print("willDeselectRowAt")
//        return indexPath
//    }
//
//    func tableView(_ tableView: UITableView, shouldHighlightRowAt indexPath: IndexPath) -> Bool {
//        if indexPath.row == 0 {
//            return true
//        } else  {
//            return false
//        }
//
//    }
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
////        if indexPath.row == 0 || indexPath.row == 1 || indexPath.row == 2 {
//               // Set a custom height for the first default cell
//               return 50
////           } else {
////               // Use the default height for other cells
////               return UITableView.automaticDimension
////           }
//    }
    
//    func tableView(_ tableView: UITableView, indentationLevelForRowAt indexPath: IndexPath) -> Int {
//        return 0
//    }
}
