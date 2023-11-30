//
//  TabBarController.swift
//  Art Institute of Chicago
//
//  Created by Daria on 22.11.2023.


import UIKit
// Enum tab bar
enum Tabs: Int {
    case gallery
    case favorite
    case artic
}
// Кастомный UITabBarController
final class TabBarController: UITabBarController {
    // MARK: - Initialization
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Configuration
    private func configure() {
        // Настройка внешнего вида tab bar
        tabBar.tintColor = UIColor(named:Resources.Colors.pink)
        tabBar.unselectedItemTintColor = UIColor(named:Resources.Colors.beige)
        tabBar.backgroundColor = UIColor(named:Resources.Colors.dark)
        tabBar.layer.masksToBounds = true
        // Создание VC для каждой вкладки
        let galleryController = GalleryController()
        let favoriteController = FavoriteViewController()
        let articController = ArticViewController(apiArticManager: APIArticManager.shared)
        // Создание Navigation controller для каждого VC
        let galleryNavigation = NavBarController(rootViewController: galleryController)
        let favoriteNavigation = NavBarController(rootViewController: favoriteController)
        let articNavigation = NavBarController(rootViewController: articController)
        // Настройка элементов tab bar с заголовками и изображениями
        galleryController.tabBarItem = UITabBarItem(title: Resources.Strings.TabBar.gallery,
                                                    image: UIImage(systemName: Resources.Image.TabBar.gallery),
                                                    tag: Tabs.gallery.rawValue)
        
        favoriteController.tabBarItem = UITabBarItem(title: Resources.Strings.TabBar.favorite,
                                                    image: UIImage(systemName: Resources.Image.TabBar.favorite),
                                                    tag: Tabs.favorite.rawValue)
        
        articController.tabBarItem = UITabBarItem(title: Resources.Strings.TabBar.artic,
                                                  image: UIImage(systemName: Resources.Image.TabBar.artic),
                                                    tag: Tabs.artic.rawValue)
        // Настройка VC для tab bar
        setViewControllers([galleryController,favoriteController,articController], animated: false)
    }
}

