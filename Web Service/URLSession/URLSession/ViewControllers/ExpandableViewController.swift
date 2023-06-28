//
//  ExpandableViewController.swift
//  TableView
//
//  Created by Shubham Bhatt on 17/05/23.
//

import UIKit

class ExpandableViewController: UIViewController {
    
    // MARK: OUTLETS
    @IBOutlet weak private var tblExpandable: UITableView!
    
    // MARK: VARIABLES
    private var searchTimer: Timer?
    private var searchBar: UISearchBar = UISearchBar()
    private var isSelectAllBtnSelected = false
    private var articleList: [Article?] = []
    private var filteredArticleList: [Article?] = []
    private var searchIsActive: Bool {
        return searchBar.searchTextField.hasText
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        initValues()
        getNews()
    }
    
    // MARK: INITIALIZATION
    private func initValues() {
        tblExpandable.delegate = self
        tblExpandable.dataSource = self
        tblExpandable.register(UINib(nibName: Constants.Cell.expandableTableViewCell, bundle: nil), forCellReuseIdentifier: Constants.Cell.expandableTableViewCell)
        tblExpandable.estimatedRowHeight = 60
        configureRefreshControl()
        searchBar.isUserInteractionEnabled = true
    }
    
    func getNews() {
        let endPoint = "v2/top-headlines?country=us&category=business&apiKey=e4a998b5b52847ab9676f1907648c874"
        ApiService.shared.get(endpoint: endPoint) {[weak self] (result: Result<NewsModel, Error>) in
            switch result {
            case .success(let news):
                self?.articleList = news.articles!
                DispatchQueue.main.async {
                    self?.tblExpandable.reloadData()
                }
                break
            case .failure(let error):
                // Handle error
                print("Error: \(error)")
            }
        }
    }
    
}

// MARK: SEARCHBAR DELEGATE
extension ExpandableViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        searchTimer?.invalidate()
        searchTimer = Timer.scheduledTimer(withTimeInterval: 1, repeats: false) { [weak self] _ in
            self?.filterData(with: searchText)
        }
    }

    func filterData(with searchText: String) {
        filteredArticleList = articleList.filter { item in
            return item?.description?.lowercased().contains(searchText.lowercased()) ?? false
        }
        tblExpandable.reloadData()
    }
    
}

// MARK: TABLEVIEW DATASOURCE
extension ExpandableViewController: UITableViewDataSource, BtnDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchIsActive ? filteredArticleList.count : articleList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tblExpandable.dequeueReusableCell(withIdentifier: Constants.Cell.expandableTableViewCell) as? ExpandableTableViewCell else {
            return UITableViewCell()
        }
        cell.seeMoreDelegate = self
        cell.configCell(data: (searchIsActive ? filteredArticleList[indexPath.row] : articleList[indexPath.row]) ?? Article(source: Source(id: "", name: ""), author: "", title: "", description: "", url: "", urlToImage: "", publishedAt: "", content: ""))
        return cell
    }
    
    func btnSeemoreTapped(cell: ExpandableTableViewCell) {
        print("clicked")
        guard let path = tblExpandable.indexPath(for: cell) else {
            print("returned unbinded")
            return
        }
        tblExpandable.reloadData()
    }
    
}

// MARK: TABLEVIEW DELEGATE
extension ExpandableViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
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

    @objc private func buttonTapped(_ sender: UIButton) {
        isSelectAllBtnSelected.toggle()
        print("isSelected: \(isSelectAllBtnSelected)")
        let select = isSelectAllBtnSelected
        if select {
            // Do something when select all button is selected
        } else {
            // Do something when select all button is deselected
        }
        tblExpandable.reloadData()
    }

    @objc private func doneButtonTapped(_ sender: UIButton) {
        guard let headerView = sender.superview else {
                return
        }
        var enteredText = ""
        for subview in headerView.subviews {
            if let textField = subview as? UITextField {
                enteredText = textField.text ?? ""
                print("Entered text: \(enteredText)")
                break
            }
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
    
    private func createSearchBar() -> UISearchBar {
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
        tblExpandable.reloadData()
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            self.tblExpandable.refreshControl?.endRefreshing()
        }
    }
    
    public func createCustomColor(red: CGFloat, green: CGFloat, blue: CGFloat) -> UIColor {
        return UIColor(red: red/255.0, green: green/255.0, blue: blue/255.0, alpha: 1.0)
    }
    
    private func createButton() -> UIButton {
        let doneButton = UIButton(type: .system)
        doneButton.frame = CGRect(x: 300, y: 10, width: 70, height: 30)
        doneButton.layer.cornerRadius = 10
        doneButton.tintColor = .white
        doneButton.setTitle("Done", for: .normal)
        doneButton.addTarget(self, action: #selector(doneButtonTapped(_:)), for: .touchUpInside)
        return doneButton
    }
    
    private func createTextField() -> UITextField {
        let textField = UITextField(frame: CGRect(x: 10, y: 10, width: 200, height: 30))
        textField.placeholder = "Enter text"
        textField.borderStyle = .roundedRect
        return textField
    }
}
