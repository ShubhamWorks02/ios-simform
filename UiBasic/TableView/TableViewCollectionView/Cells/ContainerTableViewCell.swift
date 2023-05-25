//
//  ContainerTableViewCell.swift
//  TableViewCollectionView
//
//  Created by Shubham Bhatt on 24/05/23.
//

import UIKit

class ContainerTableViewCell: UITableViewCell {

    // MARK: OUTLETS
    @IBOutlet weak private var lblTraineeName: UILabel!
    @IBOutlet weak private var collectionTraineeDetails: UICollectionView!
    
    // MARK: VARIABLES
    var chapters: [ChapterModel] = []
    
    override func awakeFromNib() {
        super.awakeFromNib()
        registerCell()
        
        // Initialization code
    }
    
    private func registerCell() {
        collectionTraineeDetails.register(UINib(nibName: Constants.Cell.nestedCollectionViewCell, bundle: nil), forCellWithReuseIdentifier: Constants.Cell.nestedCollectionViewCell)
        collectionTraineeDetails.delegate = self
        collectionTraineeDetails.dataSource = self
        // collectionTraineeDetails.backgroundColor = .
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    func config(data: IndexPath) {
        var person = PersonModel(personId: data.row)
        chapters = person.chapterList
        lblTraineeName.text = person.personName
        collectionTraineeDetails.reloadData()
    }
    
}

// MARK: COLLECTIOVIEW DATASOURCE
extension ContainerTableViewCell: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return chapters.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let collectionCell = collectionTraineeDetails.dequeueReusableCell(withReuseIdentifier: Constants.Cell.nestedCollectionViewCell, for: indexPath) as? NestedCollectionViewCell else {
            return UICollectionViewCell()
        }
        let item = chapters[indexPath.row]
        collectionCell.configureCell(chapterName: item.chapterName ?? "", chapterNumber: item.chapterNumber ?? "")
        return collectionCell
    }
    
}

// MARK: COLLECTIOVIEW DELEGATE
extension ContainerTableViewCell: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (collectionView.bounds.width - 20)/2.5 , height: 100)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }

}
