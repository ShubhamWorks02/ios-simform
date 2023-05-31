//
//  BulletedViewController.swift
//  TableViewCollectionViewCollectionView
//
//  Created by Shubham Bhatt on 31/05/23.
//

import UIKit

class BulletedViewController: UIViewController {
    
    // MARK: OUTLETS
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: VARIABLES
    var data = Bullet.getSectionDetails()
    var categories = JobCategory.categories
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initValues()
        // Do any additional setup after loading the view.
    }
    
    private func initValues() {
        tableView.delegate = self
        tableView.dataSource = self
        collectionView.delegate = self
        collectionView.dataSource = self
        tableView.register(UINib(nibName: "DetailsTableViewCell", bundle: nil), forCellReuseIdentifier: "DetailsTableViewCell")
        collectionView.register(UINib(nibName: "LBl2CollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "LBl2CollectionViewCell")
        // tableView.register(UINib(nibName: "", bundle: <#T##Bundle?#>), forCellReuseIdentifier: <#T##String#>)
    }
    
}

extension BulletedViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 0 // Number of rows for section 0
        } else {
            return 4
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let row1Cell = tableView.dequeueReusableCell(withIdentifier: "DetailsTableViewCell") as? DetailsTableViewCell else { return UITableViewCell() }
        // Configure the first type of row cell
        row1Cell.configCell(data: indexPath.section == 0 ? data[0].sectionName! : data[1].listOflabelDetails![indexPath.row])
        return row1Cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {

        guard let headerView = tableView.dequeueReusableCell(withIdentifier: "DetailsTableViewCell") as? DetailsTableViewCell else {
            return UITableViewCell()
        }
        // Configure the header view
        headerView.configCell(data: data[section].sectionName!,isHeader: true)
        return headerView
        
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return UITableView.automaticDimension
    }

    
}

extension BulletedViewController: UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let headerCell = collectionView.dequeueReusableCell(withReuseIdentifier: "LBl2CollectionViewCell", for: indexPath) as? LBl2CollectionViewCell else { return UICollectionViewCell() }
        headerCell.configCell(data: categories[indexPath.row])
        // Configure the header cell
        return headerCell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (collectionView.bounds.width-10)/4, height: 40)
    }
    
}
