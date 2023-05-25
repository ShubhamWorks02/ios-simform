//
//  NestedCollectionViewCell.swift
//  TableViewCollectionView
//
//  Created by Shubham Bhatt on 24/05/23.
//

import UIKit

class NestedCollectionViewCell: UICollectionViewCell {
    
    // MARK: OUTLETS
    @IBOutlet weak private var lblChapterStatus: UILabel!
    @IBOutlet weak private var lblChapters: UILabel!
    @IBOutlet weak var cellView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        cellView.layer.cornerRadius = 25
    }

    func configureCell(chapterName: String, chapterNumber: String) {
        lblChapterStatus.text = chapterName
        lblChapters.text = chapterNumber
        // Load and display the image using the imageURL
    }
}
