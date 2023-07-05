//
//  UserCommunication.swift
//  URLSession
//
//  Created by Shubham Bhatt on 05/07/23.
//

import UIKit


struct EditUserRequest: Codable {
    let name, job: String?
}

struct EditUserResponse: Codable {
    let name, job, updatedAt: String
}
