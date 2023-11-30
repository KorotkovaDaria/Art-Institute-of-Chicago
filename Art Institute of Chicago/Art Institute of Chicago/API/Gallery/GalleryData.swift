// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let galleryData = try? JSONDecoder().decode(GalleryData.self, from: jsonData)

import Foundation

// MARK: - GalleryData
struct GalleryData: Codable {
    let pagination: Paginations
    let data: [GalleryDatum]
    let info: Info
    let config: Configi
}

// MARK: - Config
struct Configi: Codable {
    let iiifURL: String
    let websiteURL: String

    enum CodingKeys: String, CodingKey {
        case iiifURL = "iiif_url"
        case websiteURL = "website_url"
    }
}

// MARK: - Datum
struct GalleryDatum: Codable {
    let title: String
    let dateStart, dateEnd: Int?
    let description, artworkTypeTitle, artistTitle: String?
    let artistTitles: [String]
    let imageID: String?

    enum CodingKeys: String, CodingKey {
        case title
        case dateStart = "date_start"
        case dateEnd = "date_end"
        case description
        case artworkTypeTitle = "artwork_type_title"
        case artistTitle = "artist_title"
        case artistTitles = "artist_titles"
        case imageID = "image_id"
    }
}

// MARK: - Info
struct Info: Codable {
    let licenseText: String
    let licenseLinks: [String]
    let version: String

    enum CodingKeys: String, CodingKey {
        case licenseText = "license_text"
        case licenseLinks = "license_links"
        case version
    }
}

// MARK: - Pagination
struct Paginations: Codable {
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


extension GalleryDatum {
    func getImageURL() -> URL? {
        guard let imageID = self.imageID else {
            return nil
        }
        let baseURL = "https://www.artic.edu/iiif/2/"
        let fullURLString = baseURL + imageID + "/full/400/default.jpg"
        return URL(string: fullURLString)
    }
}
