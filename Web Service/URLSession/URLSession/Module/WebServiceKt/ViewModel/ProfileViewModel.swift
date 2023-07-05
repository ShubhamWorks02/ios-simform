//
//  ProfileViewModel.swift
//  URLSession
//
//  Created by Shubham Bhatt on 05/07/23.
//

import UIKit

//class ProfileViewModel {
//
//    func getUsers() {
//        currentPage.value += 1
//        let endPoint = "api/users?page=\(currentPage.value)&per_page=\(5)&delay=\(2)"
//
//        // Connection checks
//        let reachability = try? Reachability()
//        if reachability?.connection == .unavailable {
//            print("No connection")
//            return
//        }
//
//        Task {
//            do {
//                let users: UserData = try await ApiService.shared.get(endpoint: endPoint)
//                self.totalPages.value = users.totalPages ?? 20
//                if let users = users.data {
//                    userList.value += users
//                    filterUsersList = userList.value
//                }
//            } catch {
//                currentPage.value -= 1
//                print("Error: \(error)")
//            }
//        }
//    }
//}
//

