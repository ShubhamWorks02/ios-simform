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
    var isSelectAllBtnSelected = false
    
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
        //tblExpandable.rowHeight = UITableView.automaticDimension
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
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
       // print("dimes")
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        let red: CGFloat = 18.0
        let green: CGFloat = 21.0
        let blue: CGFloat = 30.0

        let customColor = UIColor(red: red/255.0, green: green/255.0, blue: blue/255.0, alpha: 1.0)
        headerView.backgroundColor = customColor
        headerView.layoutMargins = UIEdgeInsets(top: 0, left: 0, bottom: 200, right: 0)

        let textField = UITextField(frame: CGRect(x: 10, y: 10, width: 200, height: 30))
        textField.placeholder = "Enter text"
        textField.borderStyle = .roundedRect
        headerView.addSubview(textField)

        let doneButton = UIButton(type: .system)
        doneButton.frame = CGRect(x: 300, y: 10, width: 70, height: 30)
        doneButton.layer.cornerRadius = 10
        doneButton.tintColor = .white
        
        doneButton.setTitle("Done", for: .normal)
        doneButton.backgroundColor = customColor
        // doneButton.contentMode = .right
        doneButton.addTarget(self, action: #selector(doneButtonTapped(_:)), for: .touchUpInside)
        headerView.addSubview(doneButton)

        return headerView
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
            let footerView = UIView(frame: CGRect(x: 0, y: 0, width: tblExpandable.bounds.width, height: 50))
            footerView.backgroundColor = .lightGray

            let button = UIButton(type: .system)
            button.frame = CGRect(x: 0, y: 0, width: 200, height: 50)
            button.setImage(UIImage(named: "uncheck"), for: .normal)
            button.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
            button.isSelected = false
            footerView.addSubview(button)

            return footerView
        }

        func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
            return 50
        }

    @objc func buttonTapped(_ sender: UIButton) {
        //sender.imageView?.image = sender.isSelected ? UIImage(named: "check") : UIImage(named: "Uncheck")
        isSelectAllBtnSelected.toggle()
        
        print("isSelected: \(isSelectAllBtnSelected)")
        var select = isSelectAllBtnSelected
        if select {
            memberDetailsList.forEach {
                $0.isExpanded = select
            }
        } else {
            memberDetailsList.forEach {
                $0.isExpanded = false
            }
        }
        
        tblExpandable.reloadData()

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


