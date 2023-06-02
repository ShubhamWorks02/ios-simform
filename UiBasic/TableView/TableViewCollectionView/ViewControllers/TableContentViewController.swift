//
//  TableContentViewController.swift
//  TableView
//
//  Created by Shubham Bhatt on 12/05/23.
//

import UIKit

class TableContentViewController: UIViewController {

    // MARK: OUTLETS
    @IBOutlet weak private var tblContents: UITableView!
    
    // MARK: - Variables
    var dataOfFruits: [String] = ["Apple", "Banana", "Cherry", "Durian"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initValues()
        // navigationItem.leftBarButtonItem = editButtonItem
    }
    
    private func initValues() {
        tblContents.delegate = self
        tblContents.dataSource = self
        tblContents.register(UINib(nibName: Constants.Cell.indexTableViewCell, bundle: nil), forCellReuseIdentifier: Constants.Cell.indexTableViewCell)
        //tblContents.register(UINib(nibName: "EvenTableViewCell", bundle: nil), forCellReuseIdentifier: "EvenTableViewCell")
    }
    
}

// MARK: - Delegate Methods

extension TableContentViewController: UITableViewDelegate {

}

// MARK: - DataSource Methods

extension TableContentViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let oddCell = tableView.dequeueReusableCell(withIdentifier: "IndexTableViewCell") as? IndexTableViewCell else {
            return UITableViewCell()
        }
        
        oddCell.backgroundColor = .gray
        oddCell.contentView.backgroundColor = .blue
        return oddCell
    }
    
    // MARK: - Optional Delegate Methods
    
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//         return UITableView.automaticDimension
//    }

//    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
//        return 60
//    }

//    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        return "Section \(section)"
//    }

//    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        let sectionView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.size.width, height: 60))
//        sectionView.contentMode = .left
//        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: tableView.frame.size.width, height: 60))
//        imageView.contentMode = .left
//        let image = UIImage(named: "img")
//        imageView.image = image
//        sectionView.addSubview(imageView)
//
//        return sectionView
//    }
}
