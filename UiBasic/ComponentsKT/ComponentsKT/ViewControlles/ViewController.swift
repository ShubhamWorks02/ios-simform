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
    @IBOutlet weak private var lblUserName: UILabel!
    @IBOutlet weak private var btnClearFilters: UIButton!
    @IBOutlet weak private var collectionViewHeightConstraint: NSLayoutConstraint!
    
    
    // MARK: VARIABLES
    private var sectionList = Data.sectionNumber
    private let sectionData = Array(Data.sectionNumber.keys)
    
    // MARK: VIEWCONTROLLER LIFECYCLE
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
        customizeComponent()
    }
    
    // MARK: INITIALIZATION
    private func setUpUI() {
        tblDocumentList.delegate = self
        tblDocumentList.dataSource = self
        tblDocumentList.register(UINib(nibName: Constants.Cell.documentTableViewCell, bundle: nil),
                                 forCellReuseIdentifier: Constants.Cell.documentTableViewCell)
        tblDocumentList.register(UINib(nibName: Constants.Cell.headerTableViewCell, bundle: nil),
                                 forCellReuseIdentifier: Constants.Cell.headerTableViewCell)
        collectionOfFilters.delegate = self
        collectionOfFilters.dataSource = self
        collectionOfFilters.register(UINib(nibName: Constants.Cell.filterCollectionViewCell, bundle: nil),
                                     forCellWithReuseIdentifier: Constants.Cell.filterCollectionViewCell)
        collectionOfFilters.layer.cornerRadius = 10
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard)) //
        view.addGestureRecognizer(tapGesture)
    }
    
    // MARK: ACTION METHODS
    @IBAction func btnBellPressed(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let destinationVC = storyboard.instantiateViewController(withIdentifier: "FormViewController") as! FormViewController
        self.navigationController?.pushViewController(destinationVC, animated: true)
    }
    
    @IBAction func btnClearFiltersTapped(_ sender: Any) {
        applFilter.text = "Applied Filters (0)"
        collectionViewHeightConstraint.constant = 0
        btnClearFilters.isHidden = true
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}

// MARK: TABLEVIEW DATASOURCE
extension ViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sectionData.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let sectionName = sectionData[section]
        let documentDetails = DocumentDetailsModel.getDocumentDetails(sectionName: sectionName) // ternary
        return documentDetails.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let tableCell = tblDocumentList.dequeueReusableCell(withIdentifier: Constants.Cell.documentTableViewCell) as? DocumentTableViewCell else {
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
        guard let headerCell = tableView.dequeueReusableCell(withIdentifier: Constants.Cell.headerTableViewCell) as? HeaderTableViewCell else {
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
        guard let collectionCell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.Cell.filterCollectionViewCell, for: indexPath) as? FilterCollectionViewCell else {
            return UICollectionViewCell()
        }
        return collectionCell
    }
    
}

// MARK: COLLECTIONVIEW FLOWLAYOUT
extension ViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        .zero
    }
    
}

// MARK: CUSTOMIZATION METHODS
extension ViewController {
    
    private func customizeComponent() {
        customizeFixedProfileHeaderView()
        customizeSearchTextField()
        customizeImageView()
        customizeFilterView()
        customizeProfileView()
        customizeUserName()
    }
    
    private func customizeFixedProfileHeaderView() {
        fixedProfileHeaderView.layer.cornerRadius = 35
        fixedProfileHeaderView.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
    }
    
    private func customizeSearchTextField() {
        txtSearch.borderStyle = .none
    }
    
    private func customizeUserName() {
        let attributedString = NSMutableAttributedString(string: "Davis\nBapista")
        let attributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.systemFont(ofSize: 18, weight: .bold),
            .foregroundColor: UIColor.white
        ]
        attributedString.addAttributes(attributes, range: NSRange(location: 0, length: attributedString.length))
        
        lblUserName.attributedText = attributedString
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
