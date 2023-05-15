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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tblContents.delegate = self
        tblContents.dataSource = self
        tblContents.register(UINib(nibName: "IndexTableViewCell", bundle: nil), forCellReuseIdentifier: "IndexTableViewCell")
        tblContents.register(UINib(nibName: "EvenTableViewCell", bundle: nil), forCellReuseIdentifier: "EvenTableViewCell")
        // Do any additional setup after loading the view.
    }
    
    
    
}

// MARK: DELEGATE METHODS
extension TableContentViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("selected row is : \(indexPath)")
    }
}

// MARK: DATASOURCE METHODS

extension TableContentViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 10
        }
        return 20
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let oddCell = tableView.dequeueReusableCell(withIdentifier: "IndexTableViewCell") as? IndexTableViewCell else {
            return UITableViewCell()
        }
        guard let evenCell = tableView.dequeueReusableCell(withIdentifier: "EvenTableViewCell") as? EvenTableViewCell else {
            return UITableViewCell()
        }
        if indexPath.row % 2 == 0 {
            evenCell.lblEven.text = "\(indexPath.row)"
            evenCell.backgroundColor = .green
            return evenCell
        } else {
            oddCell.lblIndex.text = "hklsdhfkrehsdfhdhfhidhfhjfdhfhgdfhdesfhidhghdefhdhgfhdhfhdihghdfdhfhdhfhhufhduhfghhklsdhfkrehsdfhdhfhidhfhjfdhfhgdfhdesfhidhghdefhdhgfhdhfhdihghdfdhfhdhfhhufhduhfghhklsdhfkrehsdfhdhfhidhfhjfdhfhgdfhdesfhidhghdefhdhgfhdhfhdihghdfdhfhdhfhhufhduhfgh"
            oddCell.backgroundColor = .gray
            return oddCell
        }

    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
         return UITableView.automaticDimension
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 60
    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Section \(section)"
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let sectionView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.size.width, height: 60))
        sectionView.contentMode = .left
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: tableView.frame.size.width, height: 60))
        imageView.contentMode = .left
        let image = UIImage(named: "img")
        imageView.image = image
        sectionView.addSubview(imageView)

        return sectionView
    }
}
