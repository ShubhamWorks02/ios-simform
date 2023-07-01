//
//  ApiViewModel.swift
//  URLSession
//
//  Created by Shubham Bhatt on 01/07/23.
//

import Foundation

class NewsViewModel {
    var onSuccess = Dynamic<[Article]?>(nil)
    var onFailure = Dynamic<Error?>(nil)
    
    func getNews() {
        let endPoint = "v2/top-headlines?country=us&category=business&apiKey=e4a998b5b52847ab9676f1907648c874"
        
        Task {
            do {
                let news: NewsModel = try await ApiService.shared.get(endpoint: endPoint)
                if let articles = news.articles {
                    onSuccess.value = articles
                }
            } catch {
                print("Error: \(error)")
            }
        }
    }
}
