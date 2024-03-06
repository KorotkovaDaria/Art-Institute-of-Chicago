//
//  APIGalleryManager.swift
//  Art Institute of Chicago
//
//  Created by Daria on 27.11.2023.
//
import Foundation
import UIKit
// Протокол APIGalleryManaging описывает метод для получения информации из API
protocol APIGalleryManaging {
    func getInfo(page: Int, completion: @escaping (Result<[GalleryDatum], Error>) -> Void)
    func getImageData (imageID: String, completion: @escaping (Result<Data, Error>) -> Void)
    
}
// Enum APIGalleryError определяет возможные ошибки при работе с API
enum APIGalleryError: Error {
    case unknown
    case decodingError
}
// Класс APIGalleryManager реализует протокол APIGalleryManaging и отвечает за взаимодействие с API
class APIGalleryManager {
    static let shared = APIGalleryManager()
    private let baseUrl = "https://api.artic.edu/api/v1/artworks?"
    private let iiifBaseURL = "https://www.artic.edu/iiif/2/"
    let cache = NSCache<NSString, UIImage>()
    // Метод для получения информации из API
    func getInfo(page: Int, completion: @escaping (Result<[GalleryDatum], Error>) -> Void) {
        let endpoint = baseUrl + "page=\(page)&limit=15&fields=title,description,image_id,date_start,date_end,artwork_type_title,artist_title,artist_titles"
        // Формирование URL из строки
        let url = URL(string: endpoint)!
        // Создание запроса
        let request = URLRequest(url: url)
        // Отправка асинхронного запроса на сервер
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            // Проверка наличия данных
            guard let data = data else {
                // В случае отсутствия данных вызываем обработчик с ошибкой
                completion(.failure(error ?? APIGalleryError.unknown))
                return
            }
            do {
                // Декодирование полученных данных в объект GalleryData
                let galleryData = try JSONDecoder().decode(GalleryData.self, from: data)
                // Вызов обработчика с успешно полученными данными
                completion(.success(galleryData.data))
            } catch {
                // В случае ошибки декодирования вызываем обработчик с ошибкой
                completion(.failure(APIArticError.decodingError))
            }
        }
        // Запуск выполнения задачи
        task.resume()
    }
    
    func getImageData(imageID: String, completion: @escaping (Result<Data, Error>) -> Void) {
        let imageURLString = iiifBaseURL + imageID + "/full/843/default.jpg"
        guard let imageURL = URL(string: imageURLString) else {
            completion(.failure(APIGalleryError.unknown))
            return
        }
        
        let imageRequest = URLRequest(url: imageURL)
        
        let imageTask = URLSession.shared.dataTask(with: imageRequest) { imageData ,_ , error in
            guard let imageData = imageData else {
                completion(.failure(error ?? APIGalleryError.unknown))
                return
            }
            completion(.success(imageData))
        }
        imageTask.resume()
    }
}
