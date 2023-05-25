//
//  CollectionViewController.swift
//  TableView
//
//  Created by Shubham Bhatt on 22/05/23.
//

import UIKit

class CollectionViewController: UIViewController {

    // MARK: OUTLETS
    @IBOutlet weak private var gridCollectionView: UICollectionView!
    
    // MARK: VARIABLES
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initValues()
        // Do any additional setup after loading the view.
    }
    
    private func initValues() {
        gridCollectionView.delegate = self
        gridCollectionView.dataSource = self
//        gridCollectionView.register(UINib(nibName: "DemoCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "DemoCollectionViewCell")

    }
}

// MARK: COLLECTIONVIEW DATASOURCE
extension CollectionViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = gridCollectionView.dequeueReusableCell(withReuseIdentifier: Constants.Cell.demoCollectionViewCell, for: indexPath) as? DemoCollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.lblCompanyName.text = "Google"
        return cell
    }
    
    
}

// MARK: COLLECTIONVIEW DELEGATE
extension CollectionViewController: UICollectionViewDelegate {
    
}

extension CollectionViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (collectionView.bounds.size.width-60)/4   , height: 100)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }

//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
//        return 30
//    }
//    
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
            return UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        }
}
