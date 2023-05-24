//
//  NestedCollectionViewCell.swift
//  TableViewCollectionView
//
//  Created by Shubham Bhatt on 24/05/23.
//

import UIKit

class NestedCollectionViewCell: UICollectionViewCell {
    
    // MARK: OUTLETS
    @IBOutlet weak var lblChapterStatus: UILabel!
    @IBOutlet weak var lblChapters: UILabel!
    
//    var cellsData =
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func configureCell(chapterName: String, chapterNumber: String) {
        lblChapterStatus.text = chapterName
        lblChapters.text = chapterNumber
        // Load and display the image using the imageURL
    }
}
