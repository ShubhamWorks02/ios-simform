//
//  ViewController.swift
//  ComponentsKT
//
//  Created by Shubham Bhatt on 02/06/23.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: OUTLETS
    @IBOutlet weak private var txtSearch: UITextFieldCustom!
    @IBOutlet weak private var imgBellicon: UIImageView!
    @IBOutlet weak private var fixedProfileHeaderView: UIView!
    @IBOutlet weak private var imgV: UIView!
    @IBOutlet weak private var filterView: UIView!
    @IBOutlet weak private var tblDocumentList: UITableView!
    @IBOutlet weak private var collectionOfFilters: UICollectionView!
    @IBOutlet weak private var profileView: UIView!
    @IBOutlet weak private var imgProfile: UIImageView!
    @IBOutlet weak private var applFilter: UILabel!
    
    // MARK: VARIABLES
    private var sectionList = Data.sectionNumber
    private let sectionData = Array(Data.sectionNumber.keys)
    
    // MARK: VIEWCONTROLLER LIFECYCLE
    override func viewDidLoad() {
        super.viewDidLoad()
        initValues()
        customizeComponent()
    }
    
    // MARK: INITIALIZATION
    private func initValues() {
        tblDocumentList.delegate = self
        tblDocumentList.dataSource = self
        tblDocumentList.register(UINib(nibName: "DocumentTableViewCell", bundle: nil), forCellReuseIdentifier: "DocumentTableViewCell")
        tblDocumentList.register(UINib(nibName: "HeaderTableViewCell", bundle: nil
                                      ), forCellReuseIdentifier: "HeaderTableViewCell")
        collectionOfFilters.delegate = self
        collectionOfFilters.dataSource = self
        collectionOfFilters.register(UINib(nibName: "FilterCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "FilterCollectionViewCell")
    }
    
}

// MARK: TABLEVIEW DATASOURCE
extension ViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sectionData.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let sectionName = sectionData[section]
        let documentDetails = DocumentDetailsModel.getDocumentDetails(sectionName: sectionName)
        return documentDetails.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let tableCell = tblDocumentList.dequeueReusableCell(withIdentifier: "DocumentTableViewCell") as? DocumentTableViewCell else {
            return UITableViewCell()
        }
        
        let sectionName = sectionData[indexPath.section]
        let documentDetails = DocumentDetailsModel.getDocumentDetails(sectionName: sectionName)
        let document = documentDetails[indexPath.row]
        tableCell.document = document
    
        return tableCell
    }
    
    
}

// MARK: TABLEVIEW DELEGATES
extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let headerCell = tableView.dequeueReusableCell(withIdentifier: "HeaderTableViewCell") as? HeaderTableViewCell else {
            return nil
        }
        
        let sortedSections = Data.sectionNumber.keys.sorted() // Get the sorted section names
        let sectionName = sortedSections[section]
        headerCell.sectionName = sectionName
        
        return headerCell
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 29
    }
}

// MARK: COLLECTIONVIEW DATASOURCE
extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let collectionCell = collectionView.dequeueReusableCell(withReuseIdentifier: "FilterCollectionViewCell", for: indexPath) as? FilterCollectionViewCell else {
            return UICollectionViewCell()
        }
        //let openingDetails = allCategories[indexPath.section].arrOfOpenings[indexPath.row]
        // collectionCell.configCell(data: openingDetails, isExpanded: isExp)
        return collectionCell
    }
    
//    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
//        if kind == UICollectionView.elementKindSectionHeader {
//            let headerCollectionView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "HeaderCollectionReusableView", for: indexPath) as! HeaderCollectionReusableView
//
//            //            let categoryName = allCategories[indexPath.section].name
//            //            headerView.configure(categoryName: categoryName ?? "")
//            //            headerView.btnDelegate = self
//            return headerCollectionView
//        }
//        return UICollectionReusableView()
//    }


//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        return CGSize(width: 100, height: 100)
//    }
    
}

// MARK: COLLECTIONVIEW DELEGATES
extension ViewController: UICollectionViewDelegate {
    
}

// MARK: COLLECTIONVIEW FLOWLAYOUT
extension ViewController: UICollectionViewDelegateFlowLayout {
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
//        collectionView.bounds.height
//    }
//
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        0
    }
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
//        return CGSize(width: collectionOfFilters.bounds.width, height: 10)
//    }
}

// MARK: CUSTOMIZATION
extension ViewController {
    
    private func customizeComponent() {
        customizeFixedProfileHeaderView()
        customizeSearchTextField()
        customizeImageView()
        customizeFilterView()
        customizeProfileView()
    }

    private func customizeFixedProfileHeaderView() {
        fixedProfileHeaderView.layer.cornerRadius = 35
        fixedProfileHeaderView.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
    }

    private func customizeSearchTextField() {
        txtSearch.borderStyle = .none
    }

    private func customizeImageView() {
        let button = UIButton(type: .custom)
        button.frame = CGRect(x: imgV.bounds.width - 12 , y: 0, width: 10, height: 10)
        button.backgroundColor = .clear
        button.layer.cornerRadius = button.frame.width / 2
        button.backgroundColor = .green
        imgV.layer.cornerRadius = imgV.bounds.width / 2
        imgV.addSubview(button)
    }

    private func customizeFilterView() {
        filterView.layer.cornerRadius = 25
    }

    private func customizeProfileView() {
        let button2 = UIButton(type: .custom)
        button2.frame = CGRect(x: profileView.bounds.width - 25 , y: profileView.bounds.height - 35, width: 20, height: 20)
        button2.backgroundColor = .green
        button2.layer.cornerRadius = 10
        profileView.addSubview(button2)
    }
    
}
