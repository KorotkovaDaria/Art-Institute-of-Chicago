//
//  ViewController.swift
//  Art Institute of Chicago
//
//  Created by Daria on 22.11.2023.
//
import UIKit

class GalleryController: UIViewController {
    private let galleryView = GalleryView()
    private var apiGalleryData: APIGalleryManaging

    //MARK: - Initialization
    init(apiArticManager: APIGalleryManaging = APIGalleryManager.shared) {
        self.apiGalleryData = apiArticManager
        super.init(nibName: nil, bundle: nil)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - View Lifecycle
    override func loadView() {
        view = galleryView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Выполнение запроса API для получения data
        APIGalleryManager.shared.getInfo { [weak self] result in
            DispatchQueue.main.async {
                guard let self = self else { return }
                // Обработка результата запроса API
                switch result {
                case .success(let data):
                    // Обработка успешного результата
                    self.galleryView.galleryData = data
                    self.galleryView.collectionView.reloadData()
                case .failure(let error):
                    // Обработка ошибки
                    print("Error fetching data: \(error)")
                }
            }
        }
    }
}
