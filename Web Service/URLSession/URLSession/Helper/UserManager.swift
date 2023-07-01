//
//  UserManager.swift
//  URLSession
//
//  Created by Shubham Bhatt on 01/07/23.
//

import Foundation
import UIKit

struct Keys {
    static let isUserLogin = "isUserLogin"
}

class UserManager {
    static let shared = UserManager()
    
    var isUserLogin: Bool {
        get {
            return UserDefaults.standard.bool(forKey: Keys.isUserLogin)
        } set(newValue) {
            UserDefaults.standard.setValue(newValue, forKey: Keys.isUserLogin)
            UserDefaults.standard.synchronize()
        }
    }
}
