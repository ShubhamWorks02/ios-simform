import Foundation

struct NewsModel: Codable {
    let status: String?
    let totalResults: Int?
    let articles: [Article]?
}

// MARK: - Article
struct Article: Codable {
    let source: Source?
    let author: String?
    let title: String?
    var description: String?
    let url: String?
    let urlToImage: String?
    let publishedAt: String?
    let content: String?
    var isExpanded: Bool? 
}



// MARK: - Source
struct Source: Codable {
    let id, name: String?
}
