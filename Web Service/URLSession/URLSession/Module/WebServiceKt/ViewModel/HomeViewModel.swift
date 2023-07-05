//
//  HomeViewModel.swift
//  URLSession
//
//  Created by Shubham Bhatt on 04/07/23.
//

import Foundation
import Reachability

class HomeViewModel {
    
    // MARK: VARIABLES
    var userList = Dynamic<[User]>([])
    private (set) var currentPage = Dynamic(0)
    private (set) var totalPages = Dynamic(0)
    private (set) var isLoadingData = Dynamic(true)
    private (set) var isSearching = Dynamic(false)
    private var filterUsersList = [User]()
    
    func getUsers() {
        currentPage.value += 1
        let endPoint = "api/users?page=\(currentPage.value)&per_page=\(5)&delay=\(2)"
        
        // Connection checks
        let reachability = try? Reachability()
        if reachability?.connection == .unavailable {
            print("No connection")
            return
        }
        
        Task {
            do {
                let users: UserData = try await ApiService.shared.get(endpoint: endPoint)
                self.totalPages.value = users.totalPages ?? 20
                if let users = users.data {
                    userList.value += users
                    filterUsersList = userList.value
                }
            } catch {
                currentPage.value -= 1
                print("Error: \(error)")
            }
        }
    }
    
    func filterUsers(searchQuery: String) {
        isSearching.value = true
        if searchQuery.isEmpty {
            userList.value = filterUsersList
            return
        }
        userList.value = filterUsersList.filter { user in
            let fullName = user.firstName! + user.lastName!
            return fullName.lowercased().contains(searchQuery.lowercased())
        }
    }
    
}
