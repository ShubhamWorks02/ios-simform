//
//  TableContentViewControllerDuplicate.swift
//  TableView
//
//  Created by Shubham Bhatt on 15/05/23.
//

import UIKit
import Foundation

class TableContentViewControllerDuplicate: UIViewController {

   
    @IBOutlet weak var tblContents: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
                tblContents.register(UINib(nibName: "IndexTableViewCell", bundle: nil), forCellReuseIdentifier: "IndexTableViewCell")

                tblContents.register(UINib(nibName: "EvenTableViewCell", bundle: nil), forCellReuseIdentifier: "EvenTableViewCell")
        // Do any additional setup after loading the view.
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension TableContentViewControllerDuplicate: UITableViewDataSource {

    

    func numberOfSections(in tableView: UITableView) -> Int {

        return 2

    }

    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        if section == 0 {

            return 20

        } else {

            return 40

        }

    }

    

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        guard let oddcell = tableView.dequeueReusableCell(withIdentifier: "IndexTableViewCell") as? IndexTableViewCell else {

            return UITableViewCell()

        }

        guard let evencell = tableView.dequeueReusableCell(withIdentifier: "EvenTableViewCell") as? EvenTableViewCell else {

            return UITableViewCell()

        }

        if indexPath.row % 2 == 0 {

            evencell.lblEven.text = "Even: \(indexPath.row)"

            evencell.backgroundColor = .orange

            return evencell

        } else {

            oddcell.lblIndex.text = "Odd: \(indexPath.row)"

            oddcell.backgroundColor = .cyan

            return oddcell

        }

    }

    

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {

        return UITableView.automaticDimension

    }

    

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {

        return "Section: \(section)"

    }

  

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {

        return 100

    }

}

 

//extension TableContentViewController: UITableViewDelegate {
//
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//
//        print(indexPath)
//
//    }
//
//}
