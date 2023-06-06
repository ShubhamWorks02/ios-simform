//
//  UIDemoScreenViewController.swift
//  TableViewCollectionViewCollectionView
//
//  Created by Shubham Bhatt on 30/05/23.
//

import UIKit

class UIDemoScreenViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout  {
    
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        profileImage.layer.cornerRadius = 10
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: Constants.Cell.openingTableViewCell, bundle: nil), forCellReuseIdentifier: Constants.Cell.openingTableViewCell)
        
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: Constants.Cell.jobDetailCollectionViewCell, bundle: nil), forCellWithReuseIdentifier: Constants.Cell.jobDetailCollectionViewCell)
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4 // Number of table view cells
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "OpeningTableViewCell", for: indexPath) as! OpeningTableViewCell
        // Configure the cell with your static data
        return cell
    }
    
    // MARK: - UITableViewDelegate
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 85
        //            return tableView.bounds.size.height / 4 // Divide by the number of cells you want
    }
    
    // MARK: - UICollectionViewDataSource
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4 // Number of collection view cells
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "JobDetailCollectionViewCell", for: indexPath) as! JobDetailCollectionViewCell
        // Configure the cell with your static data
        return cell
    }
    
    // MARK: - UICollectionViewDelegateFlowLayout
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.width - 25, height: collectionView.bounds.height)
        
    }
    
//    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
//        // Add spacing to the top and bottom of each cell
//        let verticalSpacing: CGFloat = 10  // Set the desired vertical spacing value
//        let isFirstRow = indexPath.row == 0
//        let isLastRow = indexPath.row == tableView.numberOfRows(inSection: indexPath.section) - 1
//        
//        cell.separatorInset = UIEdgeInsets(top: 50, left: 15, bottom: 0, right: 15)  // Adjust the separator inset if needed
//        
//        if isFirstRow && isLastRow {
//            cell.contentView.backgroundColor = .clear
//        } else if isFirstRow {
//            cell.contentView.backgroundColor = .clear
//            cell.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)  // Remove the top separator inset for the first row
//        } else if isLastRow {
//            cell.contentView.backgroundColor = .clear
//        } else {
//            cell.contentView.backgroundColor = .systemBackground
//        }
//        
//        cell.layoutMargins = UIEdgeInsets(top: verticalSpacing, left: 0, bottom: verticalSpacing, right: 0)  // Adjust the cell's layout margins to add spacing
//        
//        // Additional cell customization
//        
//    }
    
    
}
