//
//  ViewController.swift
//  URLSession
//
//  Created by Shubham Bhatt on 27/06/23.
//

import UIKit
import Reachability
import Alamofire

//struct User: Codable {
//    let email: String
//    let password: String
//}

enum AlamofireCallType {
    case getCall
    case getJsonCall
}

class ViewController: UIViewController {
    
    // MARK: VARIABLES
    var coordinator: MainCoordinator?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // fetchData()
        // apiCallUsingAlamofire(callType: .getJsonCall)
        // register(user: User(email: "eve.holt@reqres.in", password: "pistol"))
        // getDataFromServer()
    }
    
    @IBAction func btnGoToNews(_ sender: UIButton) {
        coordinator?.gotoNews()
    }
    
    @IBAction func btnGoToUpload(_ sender: UIButton) {
        coordinator?.gotoUpload()
    }
    
    
//    private func fetchData() {
//        Task {
//            do {
//                let welcome: Welcome = try await ApiService.shared.get(endpoint: "api/users?page=2")
//                // Access the response data
//                print("Page: \(welcome.page)")
//                print("Total Users: \(welcome.data.count)")
//                // Access individual user data
//                for user in welcome.data {
//                    print("User ID: \(user.id)")
//                    print("Email: \(user.email)")
//                    print("First Name: \(user.firstName)")
//                    print("Last Name: \(user.lastName)")
//                    print("Avatar: \(user.avatar)")
//                    print("---")
//                }
//            } catch {
//                // Handle error
//                print("Error: \(error)")
//            }
//        }
//    }
    
    private func getDataFromServer() {
        
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
    
    private func apiCallUsingAlamofireGet() {
        AF.request("https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=e4a998b5b52847ab9676f1907648c874").response { response in
            guard let data = response.data else {
                print("Invalid response")
                return
            }
            print(data)
            do {
                let newsModel = try JSONDecoder().decode(NewsModel.self, from: data)
                if let articles = newsModel.articles {
                    for article in articles {
                        if let title = article.title, let description = article.description {
                            print("Title: \(title)")
                            print("Description: \(description)\n")
                        }
                    }
                }
            } catch {
                print("Error decoding response: \(error)")
            }
        }
        
    }
    
    private func apiCallUsingAlamofireDecode() {
        let request = AF.request("https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=e4a998b5b52847ab9676f1907648c874")
        request.responseDecodable(of: NewsModel.self) { (response) in
            switch response.result {
            case .success(let newsModel):
                if let articles = newsModel.articles {
                    for article in articles {
                        if let title = article.title, let description = article.description {
                            print("Title: \(title)")
                            print("Description: \(description)\n")
                        }
                    }
                }
                break
            case .failure(let error):
                print(error.errorDescription)
            }
        }
        
    }
    
    private func apiCallUsingAlamofire(callType: AlamofireCallType) {
        var reachability = try? Reachability()
        if reachability?.connection == .unavailable {
            print("Connection Required")
            return
        }
        switch callType {
        case .getCall:
            apiCallUsingAlamofireGet()
            break
        case .getJsonCall:
            apiCallUsingAlamofireDecode()
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
                        let jsonObject = try JSONSerialization.jsonObject(with: data, options: [.mutableContainers])
                        let prettyObj = try JSONSerialization.data(withJSONObject: jsonObject , options: .prettyPrinted)
                        guard let strObj = String(data: prettyObj, encoding: .utf8) else {
                            return
                        }
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

