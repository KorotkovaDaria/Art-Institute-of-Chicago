//
//  FavoriteViewController.swift
//  Art Institute of Chicago
//
//  Created by Daria on 22.11.2023.
//

import UIKit

class FavoriteViewController: UIViewController {
    private let apiGalleryManager: APIGalleryManaging
    private var favoriteView = FavoriteView()
    
    init(apiGalleryManager: APIGalleryManaging, favoriteView: FavoriteView = FavoriteView()) {
        self.apiGalleryManager = apiGalleryManager
        self.favoriteView = favoriteView
        super.init(nibName: nil, bundle: nil)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func loadView() {
        super.loadView()
        view = favoriteView
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        APIGalleryManager.shared.getInfo { [weak self] result in
            DispatchQueue.main.async {
                guard let self = self else { return }
                // Скрыть экран загрузки после завершения запроса
                // Обработка результата запроса API
                switch result {
                case .success(let data):
                    // Обработка успешного результата
                    self.favoriteView.favoriteData = data
                    self.favoriteView.favoriteTableView.reloadData()
                case .failure(let error):
                    // Обработка ошибки
                    print("Error fetching data: \(error)")
                }
            }
        }
    }
}
