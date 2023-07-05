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
    @IBOutlet weak private var searchView: UISearchBar!
    
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
        searchView.delegate = self
    }
    
    private func assignApiData() {
        viewModel.userList.bind { [weak self] _ in
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
            self?.viewModel.filterUsers(searchQuery: searchText) //
        }
    }
    
    private func searchData() {
        viewModel.isSearching.bind { [weak self] users in
            DispatchQueue.main.async {
                self?.tblUserList.reloadData()
            }
        }
    }
    
}

// MARK: TABLEVIEW DELEGATE
extension HomeVc: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        guard let userProfileVc = storyboard?.instantiateViewController(
            withIdentifier: "ProfileVc") as? ProfileVc else {
            return
        }
        userProfileVc.userData = viewModel.userList.value[indexPath.row]
        navigationController?.pushViewController(userProfileVc, animated: true)
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row == viewModel.userList.value.count - 1,
           viewModel.currentPage.value < viewModel.totalPages.value {
            viewModel.getUsers()
        }
    }
    
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        UITableView.automaticDimension
//    }
    //    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
    //        if indexPath.row == viewModel.userList.value.count - 1 {
    //            var url = "https://reqres.in/api/users?page=\()"
    //            paginationManager.fetchData(baseURL: .users(page: paginationManager.currentPage + 1)) { [weak self] users in
    //                self?.viewModel.userList.value.append(contentsOf: users)
    //            }
    //        }
    //    }
    //    private func setupPagination() {
    //        paginationManager = PaginationManager(tableView: tblUserList)
    //        paginationManager.fetchData(baseURL: .users(page: 1)) { [weak self] users in
    //            self?.viewModel.userList.value.append(contentsOf: users)
    //        }
    //    }
}
