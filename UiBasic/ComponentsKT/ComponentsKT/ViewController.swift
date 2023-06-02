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
    @IBOutlet weak var profileView: UIView!
    @IBOutlet weak var imgProfile: UIImageView!
    
    // MARK: VIEWCONTROLLER LIFECYCLE
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        // setupSearchBar()
        initValues()
        customizeComponent()
    }
    
    // MARK: CUSTOMIZATION
    private func customizeComponent() {
        fixedProfileHeaderView.layer.cornerRadius = 35
        fixedProfileHeaderView.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        txtSearch.borderStyle = .none
        let button = UIButton(type: .custom)
        button.frame = CGRect(x: imgV.bounds.width - 12 , y: 0, width: 10, height: 10)
        
        // Set the button's background color
        button.backgroundColor = .clear
        
        // Set the button's corner radius to make it circular
        button.layer.cornerRadius = button.frame.width / 2
        
        button.backgroundColor = .green
        imgV.layer.cornerRadius = imgV.bounds.width/2
        
        imgV.addSubview(button)
        filterView.layer.cornerRadius = 25
        let button2 = UIButton(type: .custom)
        button2.frame = CGRect(x: profileView.bounds.width - 25 , y: profileView.bounds.height - 35, width: 20, height: 20)
        button2.backgroundColor = .green
        button2.layer.cornerRadius = 10
        profileView.addSubview(button2)
        
    }
    
    // MARK: INITIALIZATION
    private func initValues() {
        tblDocumentList.delegate = self
        tblDocumentList.dataSource = self
        tblDocumentList.register(UINib(nibName: "DocumentTableViewCell", bundle: nil), forCellReuseIdentifier: "DocumentTableViewCell")
        tblDocumentList.register(UINib(nibName: "HeaderTableViewCell", bundle: nil
                                      ), forCellReuseIdentifier: "HeaderTableViewCell")
//        collectionOfFilters.delegate = self
//        collectionOfFilters.dataSource = self
        collectionOfFilters.register(UINib(nibName: "FilterCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "FilterCollectionViewCell")
//        collectionOfFilters.register(UINib(nibName: "HeaderCollectionReusableView", bundle: nil), forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "HeaderCollectionReusableView")
//        tblDocumentList.separatorStyle = .singleLine
//        tblDocumentList.separatorInset = UIEdgeInsets(top: 0, left: 16, bottom: 50, right: 16)

    }
}

// MARK: TABLEVIEW DATASOURCE
extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let tableCell = tblDocumentList.dequeueReusableCell(withIdentifier: "DocumentTableViewCell") as? DocumentTableViewCell else {
            return UITableViewCell()
        }
        
        // let indexData = memberDetailsList[indexPath.row]
        // cell.seeMoreDelegate = self
        // tableCell.configCell(data: searchIsActive ? filteredList[indexPath.row] : memberDetailsList[indexPath.row])
        return tableCell
    }
}

// MARK: TABLEVIEW DELEGATES
extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
//    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        if section == 0 {
//            return "All Documents"
//        }
//        return nil
//    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {

        guard let headerView = tblDocumentList.dequeueReusableCell(withIdentifier: "HeaderTableViewCell") as? HeaderTableViewCell else {
            return UITableViewCell()
        }
        // Configure the header view
        // headerView.configCell(data: data[section].sectionName!,isHeader: true)
        return headerView
        
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
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
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        collectionView.bounds.height - 30
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        10
    }
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
//        return CGSize(width: collectionOfFilters.bounds.width, height: 10)
//    }
}
