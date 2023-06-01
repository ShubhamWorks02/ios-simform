//
//  CompanyTableViewController.swift
//  TableView
//
//  Created by Shubham Bhatt on 15/05/23.
//

import UIKit
import Foundation

class CompanyTableViewController: UIViewController {

    // MARK: OUTLETS
    @IBOutlet weak private var tblCompanyContents: UITableView!
    
    // MARK: VARIABLES
    var openingList: [FindJobModel] = FindJobModel.getCurrentOpening()
    var isHeaderSelected: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initValues()
        // Do any additional setup after loading the view.
    }
    
    // MARK: INITIALIZATION
    private func initValues() {
        tblCompanyContents.delegate = self
        tblCompanyContents.dataSource = self
        tblCompanyContents.register(UINib(nibName: "CompanyTableViewCell", bundle: nil), forCellReuseIdentifier: "CompanyTableViewCell")
    }
    
    // MARK: BUTTON ACTIONS
    @IBAction func btnSubmitPressed(_ sender: UIButton) {
        let filtereData = openingList.filter({$0.isSelected})
        print(filtereData)
        print(filtereData.count)
    }
}


// MARK: TABLEVIEW DATASOURCE
extension CompanyTableViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return openingList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let companyCell = tblCompanyContents.dequeueReusableCell(withIdentifier: "CompanyTableViewCell") as? CompanyTableViewCell else {
            return UITableViewCell()
        }
        
        let indexData = openingList[indexPath.row]
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(imageSelectTapped(_:)))
        // companyCell.imageDelegate = self
        // companyCell.imageDelegate = self
         companyCell.configData = openingList[indexPath.row]
        // companyCell.configCell(data: indexData, tap: tapGesture)
        // let tapGesture = UITapGestureRecognizer(target: self, action: #selector(imageSelectTapped(_:)))
        // openingList[indexPath.] .addGestureRecognizer(tapGesture)
        // companyCell.lblCompanyName.text = openingList[indexPath.row].companyName
        // companyCell.imgLogo.image = UIImage(named: openingList[indexPath.row].imageName!)
        return companyCell
    }
    
    func changeAllCells(isSelected: Bool) {
        openingList.forEach({
            $0.isSelected = isSelected
        })
    }
    
    @objc func imageSelectTapped(_ sender: UITapGestureRecognizer) {
        
        guard let indexPath = tblCompanyContents.indexPathForRow(at: sender.location(in: tblCompanyContents)) else {
            return
        }
        let alertController = UIAlertController(title: "Selected", message: "You Have Selected \(indexPath.row+1)th company's opening", preferredStyle: .alert)
        // Create the alert action
        let okAction = UIAlertAction(title: "OK", style: .default) { (_) in
            // Handle the user's response to the alert action
            print("OK button tapped")
        }
        // Add the alert action to the alert controller
        alertController.addAction(okAction)
        // Present the alert controller
        if indexPath.row == 0 {
            print("tapped on row \(indexPath.row)")
        }
        if indexPath.row == 1 {
            print("tapped on row \(indexPath.row)")
        }
        present(alertController, animated: true, completion: nil)
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
         return 80
         // return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let sectionView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.size.width, height: 60))
        sectionView.contentMode = .right
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: tableView.frame.size.width, height: 60))
        imageView.contentMode = .right
        let image = UIImage(named: "check")
        imageView.image = image
        imageView.isUserInteractionEnabled = true
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(headerImageViewTapped(_:)))
        imageView.addGestureRecognizer(tapGesture)
        sectionView.addSubview(imageView)
        return sectionView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 60
    }
    
    @objc func headerImageViewTapped(_ gestureRecognizer: UITapGestureRecognizer) {
        // let newImage: UIImage? // Set the new image you want to display on the cells
        isHeaderSelected = !isHeaderSelected
        changeAllCells(isSelected: isHeaderSelected)
        tblCompanyContents.reloadData()
    }

}

// MARK: TABLEVIEW DELEGATES
extension CompanyTableViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let indexData = openingList[indexPath.row]
        if indexData.isSelected {return}
        changeAllCells(isSelected: false)
        indexData.isSelected = true
        openingList[indexPath.row] = indexData
        tblCompanyContents.reloadData()
    }
    
}

//extension CompanyTableViewController: TapImageDelegate {
//    func imageSelectTapped(cell: UITableViewCell) {
//        print("selected?")
//        let path = tblCompanyContents.indexPath(for: cell)
//        if path?.row == 0 {
//            print("dfdsfdfdfd")
//        }
//    }
//}
