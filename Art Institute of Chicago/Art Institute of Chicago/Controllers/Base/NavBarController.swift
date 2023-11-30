//
//  NavBarController.swift
//  Art Institute of Chicago
//
//  Created by Daria on 22.11.2023.
//

import UIKit
// Кастомный UINavigationController сабкаласса для приложения
final class NavBarController: UINavigationController {
    // MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure()
    }
    // MARK: - Configuration
    private func configure() {
        // Установка цвета фона NC
        view.backgroundColor = UIColor(named:Resources.Colors.beige)
        // Настройка свойств NC
        navigationBar.isTranslucent = false
        // Настройка атрибутов текста заголовка для NC
        navigationBar.standardAppearance.titleTextAttributes = [
            .foregroundColor: UIColor(named: Resources.Colors.pink) ?? UIColor.clear
        ]
    }
}
