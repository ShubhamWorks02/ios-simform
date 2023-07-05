////
////  PaginationManager.swift
////  URLSession
////
////  Created by Shubham Bhatt on 05/07/23.
////
//
//import UIKit
//import Alamofire
//
//class PaginationManager<T: Codable> {
//
//    var currentPage = 1
//    var totalPages = 20
//    var isFetchingData = false
//    var isAllDataLoaded = false
//    var tableView: UITableView
//    let activityIndicator = UIActivityIndicatorView(style: .medium)
//
//    init(tableView: UITableView) {
//        self.tableView = tableView
//        activityIndicator.hidesWhenStopped = true
//    }
//
//    func fetchData(baseURL: RequestURLType, complitionHandler: @escaping (T) -> ()) {
//        guard !isFetchingData else { return }
//
//        if !isAllDataLoaded {
//            tableView.tableFooterView = activityIndicator
//            activityIndicator.startAnimating()
//            isFetchingData = true
//
//            guard var url = baseURL.url else { return }
//            url.append(queryItems: baseURL.urlQueryParams)
//
//
//            AlamofireHelper.shared.request(url: baseURL, completion: { [weak self] data in
//                guard let self else { return }
//                self.stopIndicator()
//                complitionHandler(data)
//                self.tableView.reloadData()
//                self.currentPage += 1
//            }) { [weak self] error in
//                guard let self else { return }
//                self.stopIndicator()
//            }
//        }
//    }
//    
//    // TODO: Pull to refresh
//    func stopIndicator() {
//        isFetchingData = false
//        activityIndicator.stopAnimating()
//        tableView.tableFooterView = nil
//    }
//
//}
