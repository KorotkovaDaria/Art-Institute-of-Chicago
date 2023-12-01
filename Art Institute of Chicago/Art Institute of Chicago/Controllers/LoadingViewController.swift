//
//  LoadingViewController.swift
//  Art Institute of Chicago
//
//  Created by Daria on 01.12.2023.
//

import UIKit

class LoadingViewController: UIViewController {
    private let activityIndicator =  UIActivityIndicatorView()
   
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: Resources.Colors.beige)
        // Настройте индикатор загрузки
        activityIndicator.style = .large
        activityIndicator.center = view.center
        activityIndicator.color = UIColor(named: Resources.Colors.dark)
        
        view.addSubview(activityIndicator)
    }
    func showLoadingScreen() {
        activityIndicator.startAnimating()
        // Отобразите экран загрузки
        present(self, animated: true)
    }
    
    func hideLoadingScreen() {
        activityIndicator.stopAnimating()
        // Скрытие экрана загрузки
        dismiss(animated: true)
    }
}
