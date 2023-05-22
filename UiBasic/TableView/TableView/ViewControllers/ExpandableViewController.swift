//
//  ExpandableViewController.swift
//  TableView
//
//  Created by Shubham Bhatt on 17/05/23.
//

/*
This project involves functionality of radio button selection , select all btn , expandable label , Searchbar filtering live.
*/

import UIKit

class ExpandableViewController: UIViewController {
    
    // MARK: OUTLETS
    @IBOutlet weak var tblExpandable: UITableView!
    
    // MARK: VARIABLES
    var memberDetailsList = MemberDetailsModel.getMemberDetails()
    var searchBar: UISearchBar = UISearchBar()
    var filteredList: [MemberDetailsModel] = []
    var isSelectAllBtnSelected = false
    private var searchIsActive: Bool {
        print("searchBar.searchTextField.hasText",searchBar.searchTextField.hasText)
        return searchBar.searchTextField.hasText
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initValues()
        // Do any additional setup after loading the view.
    }
    
    // MARK: INITIALIZATION
    private func initValues() {
        tblExpandable.delegate = self
        tblExpandable.dataSource = self
        tblExpandable.register(UINib(nibName: Constants.Cell.expandableTableViewCell, bundle: nil), forCellReuseIdentifier: Constants.Cell.expandableTableViewCell)
        tblExpandable.estimatedRowHeight = 60
        configureRefreshControl()
        searchBar.isUserInteractionEnabled = true
        //tblExpandable.rowHeight = UITableView.automaticDimension
    }
}


extension ExpandableViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        filteredList = memberDetailsList.filter {
            $0.description?.lowercased().contains(searchText.lowercased()) ?? false
        }
    print(searchText)
         // filteredList.forEach{print($0.description!)}
        tblExpandable.reloadData()
    }

}

// MARK: TABLEVIEW DATASOURCE
extension ExpandableViewController: UITableViewDataSource,BtnDelegate {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchIsActive ? filteredList.count : memberDetailsList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tblExpandable.dequeueReusableCell(withIdentifier: Constants.Cell.expandableTableViewCell) as? ExpandableTableViewCell else {
            return UITableViewCell()
        }
        let indexData = memberDetailsList[indexPath.row]
        cell.seeMoreDelegate = self
        cell.configCell(data: searchIsActive ? filteredList[indexPath.row] : memberDetailsList[indexPath.row])
        return cell
    }
    
    func btnSeemoreTapped(cell: ExpandableTableViewCell) {
        print("clicked")
        guard let path = tblExpandable.indexPath(for: cell) else {
            print("returned unbinded")
            return
        }
        radioToggleAllExcept(exceptedIndex: path)
        tblExpandable.reloadData()
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

// MARK: TABLEVIEW DELEGATE
extension ExpandableViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
       // print("dimes")
        return UITableView.automaticDimension
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        let customColor = createCustomColor(red: 18, green: 21, blue: 30)

        headerView.backgroundColor = customColor
        headerView.layoutMargins = UIEdgeInsets(top: 0, left: 0, bottom: 200, right: 0)

        searchBar = createSearchBar()
        headerView.addSubview(searchBar)

        let doneButton = createButton()
        doneButton.backgroundColor = customColor
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
        // sender.imageView?.image = sender.isSelected ? UIImage(named: "check") : UIImage(named: "Uncheck")
        isSelectAllBtnSelected.toggle()
        print("isSelected: \(isSelectAllBtnSelected)")
        let select = isSelectAllBtnSelected
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
            // Find the text field in the header view with help of subviews which are contained by headerView
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

// MARK: CUSTOM METHODS
extension ExpandableViewController {
    private func configureRefreshControl() {
        tblExpandable.refreshControl = UIRefreshControl()
        tblExpandable.refreshControl?.addTarget(self, action: #selector(handleRefreshControl), for: .valueChanged)
    }
    
    func createSearchBar() -> UISearchBar {
        let searchBar = UISearchBar(frame: CGRect(x: 10, y: 0, width: 200, height: 30))
        searchBar.placeholder = "Enter text"
        searchBar.searchBarStyle = .minimal
        searchBar.delegate = self
        if let textField = searchBar.value(forKey: "searchField") as? UITextField {
            textField.textColor = .lightGray
            textField.attributedPlaceholder = NSAttributedString(string: "Enter text", attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray])
            if let searchIconView = textField.leftView as? UIImageView {
                searchIconView.image = searchIconView.image?.withRenderingMode(.alwaysTemplate)
                searchIconView.tintColor = .lightGray
            }
        }
        return searchBar
    }
    
    @objc private func handleRefreshControl() {
        // tblExpandable.refreshControl?.beginRefreshing()
        tblExpandable.reloadData()
        // Updating Expanding label to its model content
        memberDetailsList = MemberDetailsModel.getMemberDetails()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            // Thread.sleep(forTimeInterval: 5)
            self.tblExpandable.refreshControl?.endRefreshing()
        }
    }
    
    func createCustomColor(red: CGFloat, green: CGFloat, blue: CGFloat) -> UIColor {
        return UIColor(red: red/255.0, green: green/255.0, blue: blue/255.0, alpha: 1.0)
    }
    
    func createButton() -> UIButton {
        let doneButton = UIButton(type: .system)
        doneButton.frame = CGRect(x: 300, y: 10, width: 70, height: 30)
        doneButton.layer.cornerRadius = 10
        doneButton.tintColor = .white
        doneButton.setTitle("Done", for: .normal)
        // doneButton.contentMode = .right
        doneButton.addTarget(self, action: #selector(doneButtonTapped(_:)), for: .touchUpInside)
        return doneButton
    }
    
    func createTextField() -> UITextField {
        let textField = UITextField(frame: CGRect(x: 10, y: 10, width: 200, height: 30))
        textField.placeholder = "Enter text"
        textField.borderStyle = .roundedRect
        return textField
    }
    
}

