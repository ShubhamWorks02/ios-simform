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
        
        tblExpandable.estimatedRowHeight = 60
        tblExpandable.rowHeight = UITableView.automaticDimension

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
        print("clicked")
        guard let path = tblExpandable.indexPath(for: cell) else {
            print("returned unbinded")
            return
        }

        
         // cell.lblDescription.text = memberDetailsList[0].description
        // cell.lblDescription.isHidden.toggle()
        radioToggleAllExcept(exceptedIndex: path)
        
        tblExpandable.reloadData()
//        tblExpandable.reloadRows(at: [path], with: .automatic)
    }
    
    private func radioToggleAllExcept(exceptedIndex: IndexPath) {
        // getting the value to be toggled
        let curValue = memberDetailsList[exceptedIndex.row].isExpanded
        memberDetailsList.forEach {
                $0.isExpanded = false
        }
        memberDetailsList[exceptedIndex.row].isExpanded = !curValue
    }
    
    
}

extension ExpandableViewController: UITableViewDelegate {
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//       // print("dimes")
//        return UITableView.automaticDimension
//    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
    
        headerView.backgroundColor = .lightGray
        headerView.layoutMargins = UIEdgeInsets(top: , left: 0, bottom: 200, right: 0)

        let textField = UITextField(frame: CGRect(x: 10, y: 10, width: 200, height: 30))
        textField.placeholder = "Enter text"
        textField.borderStyle = .roundedRect
        headerView.addSubview(textField)

        let doneButton = UIButton(type: .system)
        doneButton.frame = CGRect(x: 300, y: 10, width: 70, height: 30)
        doneButton.setTitle("Done", for: .normal)
        // doneButton.contentMode = .right
        doneButton.addTarget(self, action: #selector(doneButtonTapped(_:)), for: .touchUpInside)
        headerView.addSubview(doneButton)

        return headerView
    }
    
    @objc func doneButtonTapped(_ sender: UIButton) {
        // Handle the "Done" button tap event
        guard let headerView = sender.superview else {
                return
            }
        var enteredText = ""
            // Find the text field in the header view
            for subview in headerView.subviews {
                if let textField = subview as? UITextField {
                     enteredText = textField.text ?? ""
                    print("Entered text: \(enteredText)")
                    break
                }
                
            }
        memberDetailsList.forEach{
            $0.description = enteredText
        }
        tblExpandable.reloadData()
    }



}


