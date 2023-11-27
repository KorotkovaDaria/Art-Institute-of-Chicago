//
//  ArticViewController.swift
//  Art Institute of Chicago
//
//  Created by Daria on 22.11.2023.
//

import UIKit

class ArticViewController: UIViewController{
    //MARK: - Private properties
    private let apiArticManager: APIArticManaging
    private let articView = ArticView()
    
    init(apiArticManager: APIArticManaging = APIArticManager.shared) {
        self.apiArticManager = apiArticManager
        super.init(nibName: nil, bundle: nil)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = articView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        APIArticManager.shared.getInfo { [weak self] result in
            DispatchQueue.main.async {
                guard let self = self else { return }

                switch result {
                case .success(let data):
                    // Обработка успешного результата
                    self.articView.articTitle = data
                    self.articView.tableView.reloadData()
                case .failure(let error):
                    // Обработка ошибки
                    print("Error fetching data: \(error)")
                }
            }
        }
    }
}

