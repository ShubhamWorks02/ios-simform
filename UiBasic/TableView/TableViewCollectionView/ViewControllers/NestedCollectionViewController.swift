//
//  NestedCollectionViewController.swift
//  TableViewCollectionView
//
//  Created by Shubham Bhatt on 24/05/23.
//

import UIKit

class NestedCollectionViewController: UIViewController {

    // MARK: OUTLETS
    @IBOutlet private weak var tblContainer: UITableView!
    
    // MARK: VARIABLES
    var tableRowCount = Data.names.count
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initValues()
    }
    
    // MARK: INITIALIZATION
    private func initValues() {
        tblContainer.delegate = self
        tblContainer.dataSource = self
        tblContainer.register(UINib(nibName: Constants.Cell.containerTableViewCell, bundle: nil), forCellReuseIdentifier: Constants.Cell.containerTableViewCell)
        
    }
    
}

// MARK: TABLEVIEW DATASOURCE
extension NestedCollectionViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableRowCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let tableCell = tblContainer.dequeueReusableCell(withIdentifier: Constants.Cell.containerTableViewCell) as? ContainerTableViewCell else {
            return UITableViewCell()
        }
        
        tableCell.config(data: indexPath)
        // tableCell.chapters = PersonModel(personId: indexPath.row).chapterList
        // tableCell.configureCollectionView()
        // tableCell.config(data: indexPath)
        return tableCell
    }
    
}

// MARK: TABLEVIEW DELEGATE
extension NestedCollectionViewController: UITableViewDelegate {
    
}
