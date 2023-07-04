//
//  HomeVc.swift
//  URLSession
//
//  Created by Shubham Bhatt on 04/07/23.
//

import UIKit

class HomeVc: UIViewController {

    // MARK: OUTLETS
    @IBOutlet weak private var tblUserList: UITableView!
    @IBOutlet weak var searchView: UISearchBar!
    
    // MARK: VARIABLE
    var viewModel = HomeViewModel()
    private var userList: [User?] = []
    private var filteredUserList: [User?] = []
    private var searchIsActive: Bool {
        return searchView.searchTextField.hasText
    }
    private var searchTimer: Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initValues()
        assignApiData()
        viewModel.getUsers()
    }
    
    private func initValues() {
        tblUserList.delegate = self
        tblUserList.dataSource = self
        tblUserList.register(UINib(nibName: Constants.Cell.userTableViewCell, bundle: nil), forCellReuseIdentifier: Constants.Cell.userTableViewCell)
        tblUserList.estimatedRowHeight = 60
        searchView.isUserInteractionEnabled = true
    }
    
    private func assignApiData() {
        viewModel.userList.bind { [weak self] users in
            
//                self?.userList = users
//                self?.userList.forEach { user in
//                    print("FirstName: ",user?.firstName)
//
           //}
            DispatchQueue.main.async {
                self?.tblUserList.reloadData()
            }
        }
    }

}

// MARK: TABLEVIEW DATASOURCE
extension HomeVc: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.userList.value.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tblUserList.dequeueReusableCell(withIdentifier: Constants.Cell.userTableViewCell) as? UserTableViewCell else {
            return UITableViewCell()
        }
        cell.configCell(data: viewModel.userList.value[indexPath.row]) // viewmodel.users
        return cell
    }
    
}


// MARK: SEARCHBAR DELEGATE
extension HomeVc: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        searchTimer?.invalidate()
        searchTimer = Timer.scheduledTimer(withTimeInterval: 1, repeats: false) { [weak self] _ in
             self?.filterData(with: searchText) //
        }
    }
    
    
    func filterData(with searchText: String) {
        filteredUserList = userList.filter { user in
            return user?.firstName?.lowercased().contains(searchText.lowercased()) ?? false
        }
        tblUserList.reloadData()
    }
    
}

// MARK: TABLEVIEW DELEGATE
extension HomeVc: UITableViewDelegate {
    
}
