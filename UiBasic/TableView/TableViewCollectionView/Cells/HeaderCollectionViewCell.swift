//
//  HeaderCollectionViewCell.swift
//  TableView
//
//  Created by Shubham Bhatt on 22/05/23.
//

import UIKit

class HeaderCollectionViewCell: UICollectionReusableView {

    // MARK: OUTLETS
    @IBOutlet weak private var lblHeaderCategory: UILabel!
    @IBOutlet weak private var btnSeeAll: UIButton!
    var btnDelegate: HeaderCollectionView?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    @IBAction func btnSeeAllClicked(_ sender: UIButton) {
        var viewStyle: Bool? = btnDelegate?.toggleType()
        btnSeeAll.setTitle(viewStyle! ? "List" : "Grid", for: .normal)
        viewStyle!.toggle()
    }
    
    func configure(categoryName: String) {
        lblHeaderCategory.text = categoryName
    }
 
    
}

protocol HeaderCollectionView {
    func toggleType() -> Bool
}

