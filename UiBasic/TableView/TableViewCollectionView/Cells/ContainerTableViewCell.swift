//
//  ContainerTableViewCell.swift
//  TableViewCollectionView
//
//  Created by Shubham Bhatt on 24/05/23.
//

import UIKit

class ContainerTableViewCell: UITableViewCell {

    // MARK: OUTLETS
    
    @IBOutlet weak var lblTraineeName: UILabel!
    @IBOutlet weak var collectionTraineeDetails: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    private func registerCell() {
        collectionTraineeDetails.delegate = self
        collectionTraineeDetails.dataSource = self
        collectionTraineeDetails.register(UINib(nibName: "NestedCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "NestedCollectionViewCell")
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

extension ContainerTableViewCell: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        <#code#>
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        <#code#>
    }
    
}

extension ContainerTableViewCell: UICollectionViewDelegate {
    
}
