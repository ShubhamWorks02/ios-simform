//
//  DemoCollectionViewController.swift
//  TableView
//
//  Created by Shubham Bhatt on 23/05/23.
//

import UIKit


class DemoCollectionViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    var allOpeningDetails = OpeningDetails.getAllOpeningDetails()
    var allCategories = Category.getAllCategories()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCells()
        // Do any additional setup after loading the view.
    }
    
    private func registerCells() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: "JobCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "JobCollectionViewCell")
        collectionView.register(UINib(nibName: "HeaderCollectionViewCell", bundle: nil), forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "HeaderCollectionViewCell")
    }
    
}


// MARK: COLLECTIONVIEW DATASOURCE
extension DemoCollectionViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return allCategories.count
    }
    
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return allOpeningDetails.count
//    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return allCategories[section].arrOfOpenings.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "JobCollectionViewCell", for: indexPath) as? JobCollectionViewCell else {
            return UICollectionViewCell()
        }
//        cell.configCell(data: allOpeningDetails[indexPath.row])
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
        return CGSize(width: (collectionView.bounds.size.width - 60)/3   , height: (collectionView.bounds.size.width - 75)/2)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        // Configure header size as needed
        return CGSize(width: collectionView.bounds.width, height: collectionView.bounds.height/9)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }

//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
//        return 30
//    }
//
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10, left: 15, bottom: 10, right: 15)
    }
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
//        let sectionInsets = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
//        return sectionInsets
//    }
}

