//
//  HomeViewModel.swift
//  URLSession
//
//  Created by Shubham Bhatt on 04/07/23.
//

import Foundation

class HomeViewModel {
    var onSuccess = Dynamic<[User]?>(nil)
    var onFailure = Dynamic<Error?>(nil)
    var userList = Dynamic<[User]>([])
    var isSearching = Dynamic<Bool>(false)
    
    func getUsers() {
        let endPoint = "api/users?page=2"
        
        Task {
            do {
                let users: UserData = try await ApiService.shared.get(endpoint: endPoint)
                if let users = users.data {
                    userList.value = users
                }
            } catch {
                print("Error: \(error)")
            }
        }
    }
    
    
}
