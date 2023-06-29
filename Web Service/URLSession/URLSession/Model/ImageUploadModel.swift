//
//  imageUpload.swift
//  URLSession
//
//  Created by Shubham Bhatt on 29/06/23.
//

import Foundation

// MARK: - Welcome
struct ImageUploadModel: Codable {
    let data: DataClass
    let success: Bool
    let status: Int
}

// MARK: - DataClass
struct DataClass: Codable {
    let id, title: String
    let urlViewer: String
    let url, displayURL: String
    let width, height, size, time: Int
    let expiration: Int
    let image, thumb, medium: Image
    let deleteURL: String

    enum CodingKeys: String, CodingKey {
        case id, title
        case urlViewer = "url_viewer"
        case url
        case displayURL = "display_url"
        case width, height, size, time, expiration, image, thumb, medium
        case deleteURL = "delete_url"
    }
}

// MARK: - Image
struct Image: Codable {
    let filename, name, mime, imageExtension: String
    let url: String

    enum CodingKeys: String, CodingKey {
        case filename, name, mime
        case imageExtension = "extension"
        case url
    }
}
