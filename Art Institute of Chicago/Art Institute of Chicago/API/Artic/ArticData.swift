// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let articData = try? JSONDecoder().decode(ArticData.self, from: jsonData)

import Foundation

// MARK: - ArticData
struct ArticData: Codable {
    let pagination: Pagination
    let data: [Datum]
    let info, config: Config?
}

// MARK: - Config
struct Config: Codable {
}

// MARK: - Datum
struct Datum: Codable {
    let title, copy: String
}

// MARK: - Pagination
struct Pagination: Codable {
    let total, limit, offset, totalPages: Int
    let currentPage: Int
    let nextURL: String

    enum CodingKeys: String, CodingKey {
        case total, limit, offset
        case totalPages = "total_pages"
        case currentPage = "current_page"
        case nextURL = "next_url"
    }
}
