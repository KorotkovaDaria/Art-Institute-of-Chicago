//
//  ArticManager.swift
//  Art Institute of Chicago
//
//  Created by Daria on 22.11.2023.
//

import Foundation
// Протокол APIArticManaging описывает метод для получения информации из API
protocol APIArticManaging {
    func getInfo(completion: @escaping (Result<[ArticDatum], Error>) -> Void)
}
// Enum APIGalleryError определяет возможные ошибки при работе с API
enum APIArticError: Error {
    case unknown
    case decodingError
}
// Класс APIArticManager реализует протокол APIArticManaging и отвечает за взаимодействие с API
class APIArticManager: APIArticManaging {
    static let shared = APIArticManager()
    private let urlData = "https://api.artic.edu/api/v1/articles?limit=10&fields=title,copy"
    // Метод для получения информации из API
    func getInfo(completion: @escaping (Result<[ArticDatum], Error>) -> Void) {
        // Формирование URL из строки
        let url = URL(string: urlData)!
        // Создание запроса
        let request = URLRequest(url: url)
        // Отправка асинхронного запроса на сервер
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            // Проверка наличия данных
            guard let data = data else {
                // В случае отсутствия данных вызываем обработчик с ошибкой
                completion(.failure(error ?? APIArticError.unknown))
                return
            }

            do {
                // Декодирование полученных данных в объект GalleryData
                let articData = try JSONDecoder().decode(ArticData.self, from: data)
                // Вызов обработчика с успешно полученными данными
                completion(.success(articData.data))
            } catch {
                // В случае ошибки декодирования вызываем обработчик с ошибкой
                completion(.failure(APIArticError.decodingError))
            }
        }
        // Запуск выполнения задачи
        task.resume()
    }
}

