//
//  ViewController.swift
//  URLSession
//
//  Created by Shubham Bhatt on 27/06/23.
//

import UIKit

struct User: Codable {
    let email: String
    let password: String
}



class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchData()
    }
    
    private func fetchData() {
            Task {
                do {
                    let welcome: Welcome = try await ApiService.shared.get(endpoint: "api/users?page=2")
                    // Access the response data
                    print("Page: \(welcome.page)")
                    print("Total Users: \(welcome.data.count)")
                    // Access individual user data
                    for user in welcome.data {
                        print("User ID: \(user.id)")
                        print("Email: \(user.email)")
                        print("First Name: \(user.firstName)")
                        print("Last Name: \(user.lastName)")
                        print("Avatar: \(user.avatar)")
                        print("---")
                    }
                } catch {
                    // Handle error
                    print("Error: \(error)")
                }
            }
        }
    
    func getDataFromServer() {
        if let url = URL(string: "https://reqres.in/api/users?page=2") {
            let urlRequest = URLRequest(url: url)
            let dataTask = URLSession.shared.dataTask(with: urlRequest) { urlData, urlResponse, error in
                guard let data = urlData else {
                    if let error = error {
                        print("Error: \(error)")
                    }
                    return
                }

                do {
                    if let jsonObject = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
                        print("Serialized JSON object: \(jsonObject)")
                    }
                } catch {
                    print("Error serializing JSON: \(error)")
                }
            }
            dataTask.resume()
        }
    }

    func register(user: User) {
        if let url = URL(string: "https://reqres.in/api/register") {
            var urlRequest = URLRequest(url: url)
            urlRequest.httpMethod = "POST"

            do {
                urlRequest.httpBody = try JSONEncoder().encode(user)
            } catch let error {
                print("Codable error: ", error)
            }

            urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
            urlRequest.addValue("application/json", forHTTPHeaderField: "Accept")

            let dataTask = URLSession.shared.dataTask(with: urlRequest) { (urlData, urlResponse, error) in
                if let error = error {
                    print("Error: \(error)")
                    return
                }

                guard let httpResponse = urlResponse as? HTTPURLResponse else {
                    print("Invalid HTTP response")
                    return
                }

                let statusCode = httpResponse.statusCode
                print("Status Code: \(statusCode)")

                if let data = urlData {
                    do {
                        let jsonObject = try JSONSerialization.jsonObject(with: data, options: [])
                        print("JSON response: \(jsonObject)")
                    } catch let error {
                        print("Error serializing JSON: \(error)")
                    }
                }
            }

            dataTask.resume()
        }
    }

    
}

