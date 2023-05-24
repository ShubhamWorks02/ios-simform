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
    
    
    var chapters: [ChapterModel] = []
    
    override func awakeFromNib() {
        super.awakeFromNib()
        registerCell()
        
        // Initialization code
    }
    
    private func registerCell() {
        collectionTraineeDetails.register(UINib(nibName: "NestedCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "NestedCollectionViewCell")
        collectionTraineeDetails.delegate = self
        collectionTraineeDetails.dataSource = self
        collectionTraineeDetails.backgroundColor = .blue
    }
    
//    func configureCollectionView() {
//
//        // collectionTraineeDetails.reloadData()
//        }

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

extension ContainerTableViewCell: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return chapters.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let collectionCell = collectionTraineeDetails.dequeueReusableCell(withReuseIdentifier: "NestedCollectionViewCell", for: indexPath) as? NestedCollectionViewCell else {
            return UICollectionViewCell()
        }
        // let item2 = ChapterModel.getChapterDetails(personId: indexPath.row)
         let item = chapters[indexPath.row]
        collectionCell.configureCell(chapterName: item.chapterName ?? "", chapterNumber: item.chapterNumber ?? "")
        // let openingDetails = allCategories[indexPath.section].arrOfOpenings[indexPath.row]
        // cell.configCell(data: openingDetails)
        return collectionCell
    }
    
}


extension ContainerTableViewCell: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 100 , height: 100)
    }
////
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
//        // Configure header size as needed
//        return CGSize(width: collectionView.bounds.width, height: collectionView.bounds.height/9)
//    }
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
//        return 10
//    }
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
//        return UIEdgeInsets(top: 10, left: 15, bottom: 10, right: 15)
//    }
    
}
