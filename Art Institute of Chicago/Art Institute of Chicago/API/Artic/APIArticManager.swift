//
//  ArticManager.swift
//  Art Institute of Chicago
//
//  Created by Daria on 22.11.2023.
//

import Foundation
class APIArticManager {
    static let shared = APIArticManager()

    private let urlData = "https://api.artic.edu/api/v1/articles?limit=10&fields=title,copy"

    func getInfo(comlection: @escaping([Datum])-> Void) {
        let url = URL(string: urlData)!
        let request = URLRequest(url: url)

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data else { return }
            if let articData = try? JSONDecoder().decode(ArticData.self, from: data) {
                comlection(articData.data)
            } else {
                print(error)
            }
        }
        task.resume()
    }
}
