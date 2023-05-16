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
    @IBOutlet weak var tblCompanyContents: UITableView!
    
    // MARK: VARIABLES
    var openingList: [FindJobModel] = FindJobModel.getCurrentOpening()
    var isHeaderSelected: Bool = false
    override func viewDidLoad() {
        super.viewDidLoad()
        initValues()
        // Do any additional setup after loading the view.
    }
    
    private func initValues() {
        tblCompanyContents.delegate = self
        tblCompanyContents.dataSource = self
        tblCompanyContents.register(UINib(nibName: "CompanyTableViewCell", bundle: nil), forCellReuseIdentifier: "CompanyTableViewCell")
    }
    
    // MARK: ACTIONS
    @IBAction func btnSubmitPressed(_ sender: UIButton) {
        let filtereData = openingList.filter({$0.isSelected})
        print(filtereData)
        print(filtereData.count)
    }
}

extension CompanyTableViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

   //     changeAllCells(isSelected: false)
        let indexData = openingList[indexPath.row]
        
        if indexData.isSelected {return}
        changeAllCells(isSelected: false)
        indexData.isSelected = true
        openingList[indexPath.row] = indexData
        
        tblCompanyContents.reloadData()
    }
}

extension CompanyTableViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return openingList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let companyCell = tblCompanyContents.dequeueReusableCell(withIdentifier: "CompanyTableViewCell") as? CompanyTableViewCell else {
            return UITableViewCell()
        }
        let indexData = openingList[indexPath.row]
        companyCell.configCell(data: indexData)
        // companyCell.lblCompanyName.text = openingList[indexPath.row].companyName
        // companyCell.imgLogo.image = UIImage(named: openingList[indexPath.row].imageName!)
        return companyCell
    }
    
    func changeAllCells(isSelected: Bool) {
        openingList.forEach({
            $0.isSelected = isSelected
        })
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
