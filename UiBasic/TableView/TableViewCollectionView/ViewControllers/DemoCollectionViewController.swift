//
//  DemoCollectionViewController.swift
//  TableView
//
//  Created by Shubham Bhatt on 23/05/23.
//

import UIKit


class DemoCollectionViewController: UIViewController {
    
    // MARK: OUTLETS
    @IBOutlet private weak var collectionView: UICollectionView!
    
    // MARK: VARIABLES
    private var allCategories = Category.getAllCategories()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCells()
    }
    
    // MARK: INITIALIZATION
    private func registerCells() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: Constants.Cell.jobCollectionViewCell, bundle: nil), forCellWithReuseIdentifier: Constants.Cell.jobCollectionViewCell)
        collectionView.register(UINib(nibName: Constants.Cell.headerCollectionViewCell, bundle: nil), forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: Constants.Cell.headerCollectionViewCell)
    }
    
}


// MARK: COLLECTIONVIEW DATASOURCE
extension DemoCollectionViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return allCategories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return allCategories[section].arrOfOpenings.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "JobCollectionViewCell", for: indexPath) as? JobCollectionViewCell else {
            return UICollectionViewCell()
        }
        let openingDetails = allCategories[indexPath.section].arrOfOpenings[indexPath.row]
        cell.configCell(data: openingDetails)
        return cell
    }
    
}

// MARK: COLLECTIONVIEW DELEGATE
extension DemoCollectionViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if kind == UICollectionView.elementKindSectionHeader {
            let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "HeaderCollectionViewCell", for: indexPath) as! HeaderCollectionViewCell
            
            let categoryName = allCategories[indexPath.section].name
            headerView.configure(categoryName: categoryName ?? "")
            return headerView
        }
        return UICollectionReusableView()
    }
    
}

extension DemoCollectionViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (collectionView.bounds.size.width - 40)   , height: (collectionView.bounds.size.width - 75)/2)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        // Configure header size as needed
        return CGSize(width: collectionView.bounds.width, height: collectionView.bounds.height/9)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10, left: 15, bottom: 10, right: 15)
    }

}

