//
//  HeaderCollectionReusableView.swift
//  ComponentsKT
//
//  Created by Shubham Bhatt on 02/06/23.
//

import UIKit

class HeaderCollectionReusableView: UICollectionReusableView {

    // MARK: OUTLETS
    @IBOutlet weak var lblFilterCount: UILabel!
    @IBOutlet weak var btnClearFilter: UIButton!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    
}
