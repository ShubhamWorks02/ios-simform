//
//  ViewController.swift
//  AutomaticDimension
//
//  Created by Shubham Bhatt on 16/05/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tblContents: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initValues()
        // Do any additional setup after loading the view.
    }
    
    private func initValues() {
        tblContents.delegate = self
        tblContents.dataSource = self
        tblContents.register(UINib(nibName: "ResizeTableViewCell2", bundle: nil), forCellReuseIdentifier: "ResizeTableViewCell2")
        tblContents.register(UINib(nibName: "ResizeTableViewCell", bundle: nil), forCellReuseIdentifier: "ResizeTableViewCell")
    }

}

extension ViewController: UITableViewDelegate {
    
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let resizeTableViewCell2 = tblContents.dequeueReusableCell(withIdentifier: "ResizeTableViewCell2") as? ResizeTableViewCell2 else {
            return UITableViewCell()
        }
        guard let resizeTableViewCell = tblContents.dequeueReusableCell(withIdentifier: "ResizeTableViewCell") as? ResizeTableViewCell else {
            return UITableViewCell()
        }
        
        if indexPath.row % 2 == 0 {
            resizeTableViewCell2.lblResize2.text =  "hklsdhfkrehsdfhdhfhidhfhjfdhfhgdfhdesfhidhghdefhdhgfhdhfhdihghdfdhfhdhfhhufhduhfghhklsdhfkrehsdfhdhfhidhfhjfdhfhgdfhdesfhidhghdefhdhgfhdhfhdihghdfdhfhdhfhhufhduhfghhklsdhfkrehsdfhdhfhidhfhjfdhfhgdfhdesfhidhghdefhdhgfhdhfhdihghdfdhfhdhfhhufhduhfgh"
            resizeTableViewCell2.backgroundColor = .green
            return resizeTableViewCell2
        } else {
            resizeTableViewCell.lblResize.text = "\(indexPath.row)"
            resizeTableViewCell.backgroundColor = .gray
            return resizeTableViewCell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
