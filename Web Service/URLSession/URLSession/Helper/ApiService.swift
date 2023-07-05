//
//  ApiService.swift
//  URLSession
//
//  Created by Shubham Bhatt on 28/06/23.
//

import Foundation

let API_BASE_URL = "https://reqres.in"

class ApiService {
    static let shared: ApiService = {
        let apiService = ApiService()
        apiService.setup()
        return apiService
    }()
    
    private init() { }
    
    private var client: URLSession!
    
    private func setup() {
        let configuration = URLSessionConfiguration.default
        configuration.timeoutIntervalForRequest = 30
        client = URLSession(configuration: configuration)
    }
    
    private func handleApiErrors<T: Decodable>(apiRequest: @escaping () -> URLRequest) async throws -> T {
        let (data, response) = try await client.data(for: apiRequest())
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw NSError(domain: "com.example.ApiService", code: 0, userInfo: [NSLocalizedDescriptionKey: "Invalid response"])
        }
        
        do {
            let decodedData = try JSONDecoder().decode(T.self, from: data)
            return decodedData
        } catch {
            throw error
        }
    }
    
    private func getHttpClient() -> URLSession {
        return client
    }
    
    func get<T: Decodable>(endpoint: String, queryParams: [String: Any] = [:]) async throws -> T {
        let url = URL(string: "\(API_BASE_URL)/\(endpoint)")!
        var components = URLComponents(url: url, resolvingAgainstBaseURL: true)!
        
        if !queryParams.isEmpty {
            components.queryItems = queryParams.map { key, value in
                URLQueryItem(name: key, value: "\(value)")
            }
        }
        
        let request = URLRequest(url: components.url!)
        
        return try await handleApiErrors(apiRequest: { request })
    }
    
    func post<T: Decodable>(endpoint: String, data: [String: Any]) async throws -> T {
        let url = URL(string: "\(API_BASE_URL)/\(endpoint)")!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        do {
            request.httpBody = try JSONSerialization.data(withJSONObject: data, options: [])
        } catch {
            throw error
        }
        
        return try await handleApiErrors(apiRequest: { request })
    }
    
    func put<T: Decodable>(endpoint: String, data: [String: Any]) async throws -> T {
        let url = URL(string: "\(API_BASE_URL)/\(endpoint)")!
        var request = URLRequest(url: url)
        request.httpMethod = "PUT"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        do {
            request.httpBody = try JSONSerialization.data(withJSONObject: data, options: [])
        } catch {
            throw error
        }
        
        return try await handleApiErrors(apiRequest: { request })
    }
    
    func delete<T: Decodable>(endpoint: String) async throws -> T {
        let url = URL(string: "\(API_BASE_URL)/\(endpoint)")!
        var request = URLRequest(url: url)
        request.httpMethod = "DELETE"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        return try await handleApiErrors(apiRequest: { request })
    }
    
    func patch<T: Decodable>(endpoint: String, data: EditUserRequest) async throws -> T {
            let url = URL(string: "\(API_BASE_URL)/\(endpoint)")!
            var request = URLRequest(url: url)
            request.httpMethod = "PATCH"
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")

            do {
                request.httpBody = try JSONEncoder().encode(data)
            } catch {
                throw error
            }

            return try await handleApiErrors(apiRequest: { request })
        }
    
}
