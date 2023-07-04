//
//  IgnoreVc.swift
//  URLSession
//
//  Created by Shubham Bhatt on 01/07/23.
//

import UIKit

class IgnoreVc: UIViewController {}

//
//class ApiService {
//    static let shared: ApiService = {
//        let apiService = ApiService()
//        apiService.setup()
//        return apiService
//    }()
//
//    private var client: URLSession!
//
//    private func setup() {
//        let configuration = URLSessionConfiguration.default
//        configuration.timeoutIntervalForRequest = 30
//        client = URLSession(configuration: configuration)
//    }
//
//    private func handleApiErrors<T: Decodable>(apiRequest: @escaping () -> URLRequest, completion: @escaping (Result<T, Error>) -> Void) {
//        let task = client.dataTask(with: apiRequest()) { (data, response, error) in
//            if let error = error {
//                completion(.failure(error))
//                return
//            }
//
//            if let data = data {
//                do {
//                    print(data)
//                    let decodedData = try JSONDecoder().decode(T.self, from: data)
//                    completion(.success(decodedData))
//                } catch {
//                    completion(.failure(error))
//                }
//            } else {
//                let error = NSError(domain: "com.example.ApiService", code: 0, userInfo: [NSLocalizedDescriptionKey: "No data received"])
//                completion(.failure(error))
//            }
//        }
//
//        task.resume()
//    }

//    private func getHttpClient() -> URLSession {
//        return client
//    }
//
//    func get<T: Decodable>(endpoint: String, queryParams: [String: Any] = [:], completion: @escaping (Result<T, Error>) -> Void) {
//        let url = URL(string: "\(API_BASE_URL)/\(endpoint)")!
//        var components = URLComponents(url: url, resolvingAgainstBaseURL: true)!
//
//        if !queryParams.isEmpty {
//            components.queryItems = queryParams.map { key, value in
//                URLQueryItem(name: key, value: "\(value)")
//            }
//        }
//
//        let request = URLRequest(url: components.url!)
//
//        handleApiErrors(apiRequest: {
//            request
//        }, completion: completion)
//    }

//    func post<T: Decodable>(endpoint: String, data: [String: Any], completion: @escaping (Result<T, Error>) -> Void) {
//        let url = URL(string: "\(API_BASE_URL)/\(endpoint)")!
//        var request = URLRequest(url: url)
//        request.httpMethod = "POST"
//        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
//
//        do {
//            request.httpBody = try JSONSerialization.data(withJSONObject: data, options: [])
//        } catch {
//            completion(.failure(error))
//            return
//        }
//
//        handleApiErrors(apiRequest: {
//            request
//        }, completion: completion)
//    }
//
//    func put<T: Decodable>(endpoint: String, data: [String: Any], completion: @escaping (Result<T, Error>) -> Void) {
//        let url = URL(string: "\(API_BASE_URL)/\(endpoint)")!
//        var request = URLRequest(url: url)
//        request.httpMethod = "PUT"
//        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
//
//        do {
//            request.httpBody = try JSONSerialization.data(withJSONObject: data, options: [])
//        } catch {
//            completion(.failure(error))
//            return
//        }
//
//        handleApiErrors(apiRequest: {
//            request
//        }, completion: completion)
//    }
//
//    func delete<T: Decodable>(endpoint: String, completion: @escaping (Result<T, Error>) -> Void) {
//        let url = URL(string: "\(API_BASE_URL)/\(endpoint)")!
//        var request = URLRequest(url: url)
//        request.httpMethod = "DELETE"
//        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
//
//        handleApiErrors(apiRequest: {
//            request
//        }, completion: completion)
//    }
//}
