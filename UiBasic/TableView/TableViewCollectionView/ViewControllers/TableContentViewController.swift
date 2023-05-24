//
//  TableContentViewController.swift
//  TableView
//
//  Created by Shubham Bhatt on 12/05/23.
//

import UIKit

class TableContentViewController: UIViewController {

    // MARK: OUTLETS
    @IBOutlet weak var tblContents: UITableView!
    
    // MARK: VARIABLES
    var dataOfFruits: [String] = ["Apple", "Banana", "Cherry", "Durian"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initValues()
        // navigationItem.leftBarButtonItem = editButtonItem
    }
    
    
    
    private func initValues() {
        tblContents.delegate = self
        tblContents.dataSource = self
        tblContents.register(UINib(nibName: "IndexTableViewCell", bundle: nil), forCellReuseIdentifier: "IndexTableViewCell")
        //tblContents.register(UINib(nibName: "EvenTableViewCell", bundle: nil), forCellReuseIdentifier: "EvenTableViewCell")
    }
    
}

// MARK: DELEGATE METHODS
extension TableContentViewController: UITableViewDelegate {
    
//     func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
//            if editingStyle == .delete {
//                dataOfFruits.remove(at: indexPath.row)
//                tableView.deleteRows(at: [indexPath], with: .automatic)
//            }
//
//         if editingStyle == .insert {
//             dataOfFruits.append("added Fruit")
//             tableView.insertRows(at: [indexPath], with: .automatic)
//         }
//        }
//
    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        print("selected row is : \(indexPath)")
//    }
}

// MARK: DATASOURCE METHODS

extension TableContentViewController: UITableViewDataSource {
//    func tableView(_ tableView: UITableView, prefetchRowsAt indexPaths: [IndexPath]) {
//        print("prefetching row at ",indexPaths[indexPaths.count])
//    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

//    func numberOfSections(in tableView: UITableView) -> Int {
//        return 1
//    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let oddCell = tableView.dequeueReusableCell(withIdentifier: "IndexTableViewCell") as? IndexTableViewCell else {
            return UITableViewCell()
        }
        oddCell.layoutSubviews()
        oddCell.layoutIfNeeded()
//        oddCell.leading.constant = 50
//        guard let evenCell = tableView.dequeueReusableCell(withIdentifier: "EvenTableViewCell") as? EvenTableViewCell else {
//            return UITableViewCell()
//        }
        // oddCell.lblIndex.text = dataOfFruits[indexPath.row]
         // evenCell.lblEven.text = dataOfFruits[indexPath.row]
//        if indexPath.row % 2 == 0 {
//            evenCell.lblEven.text = "hklsdhfkrehsdfhdhfhidhfhjfdhfhgdfhdesfhidhghdefhdhgfhdhfhdihghdfdhfhdhfhhufhduhfghhklsdhfkrehsdfhdhfhidhfhjfdhfhgdfhdesfhidhghdefhdhgfhdhfhdihghdfdhfhdhfhhufhduhfghhklsdhfkrehsdfhdhfhidhfhjfdhfhgdfhdesfhidhghdefhdhgfhdhfhdihghdfdhfhdhfhhufhduhfgh"
//            evenCell.backgroundColor = .green
//            return evenCell
//        } else {
//            oddCell.lblIndex.numberOfLines = 0
//            oddCell.lblIndex.text = "hklsdhfkrehsdfhdhfhidhfhjfdhfhgdfhdesfhidhghdefhdhgfhdhfhdihghdfdhfhdhfhhufhduhfghhklsdhfkrehsdfhdhfhidhfhjfdhfhgdfhdesfhidhghdefhdhgfhdhfhdihghdfdhfhdhfhhufhduhfghhklsdhfkrehsdfhdhfhidhfhjfdhfhgdfhdesfhidhghdefhdhgfhdhfhdihghdfdhfhdhfhhufhduhfgh"
            oddCell.backgroundColor = .gray
        oddCell.contentView.backgroundColor = .blue
            return oddCell
        
        // return oddCell

    }
    
//
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
