//
//  ArticManager.swift
//  Art Institute of Chicago
//
//  Created by Daria on 22.11.2023.
//

import Foundation

protocol APIArticManaging {
    func getInfo(completion: @escaping (Result<[Datum], Error>) -> Void)
}

enum APIArticError: Error {
    case unknown
    case decodingError
}

class APIArticManager: APIArticManaging {
    static let shared = APIArticManager()
    private let urlData = "https://api.artic.edu/api/v1/articles?limit=10&fields=title,copy"

    func getInfo(completion: @escaping (Result<[Datum], Error>) -> Void) {
        let url = URL(string: urlData)!
        let request = URLRequest(url: url)

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else {
                completion(.failure(error ?? APIArticError.unknown))
                return
            }

            do {
                let articData = try JSONDecoder().decode(ArticData.self, from: data)
                completion(.success(articData.data))
            } catch {
                completion(.failure(APIArticError.decodingError))
            }
        }
        task.resume()
    }
}

