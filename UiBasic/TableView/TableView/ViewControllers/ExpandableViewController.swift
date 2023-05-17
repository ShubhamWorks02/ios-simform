//
//  ExpandableViewController.swift
//  TableView
//
//  Created by Shubham Bhatt on 17/05/23.
//

import UIKit

class ExpandableViewController: UIViewController {
    
    // MARK: OUTLETS
    @IBOutlet weak var tblExpandable: UITableView!
    
    // MARK: VARIABLES
    var memberDetailsList = MemberDetailsModel.getMemberDetails()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initValues()
        // Do any additional setup after loading the view.
    }
    
    private func initValues() {
        tblExpandable.delegate = self
        tblExpandable.dataSource = self
        tblExpandable.register(UINib(nibName: "ExpandableTableViewCell", bundle: nil), forCellReuseIdentifier: "ExpandableTableViewCell")

    }
}

extension ExpandableViewController: UITableViewDataSource,BtnDelegate {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return memberDetailsList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tblExpandable.dequeueReusableCell(withIdentifier: "ExpandableTableViewCell") as? ExpandableTableViewCell else {
            return UITableViewCell()
        }
        let indexData = memberDetailsList[indexPath.row]
        cell.seeMoreDelegate = self
        cell.configCell(data: indexData)
        return cell
    }
    
    func btnSeemoreTapped(cell: ExpandableTableViewCell) {
        guard let path = tblExpandable.indexPath(for: cell) else {
            print("returned unbinded")
            return
        }
        
        if cell.lblDescription.numberOfLines == 3 {
            cell.lblDescription.numberOfLines = 0
        } else {
            cell.lblDescription.numberOfLines = 3
        }
        tblExpandable.reloadRows(at: [path], with: .none)
    }
    
}

extension ExpandableViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        print("dimes")
        return UITableView.automaticDimension
    }
}


