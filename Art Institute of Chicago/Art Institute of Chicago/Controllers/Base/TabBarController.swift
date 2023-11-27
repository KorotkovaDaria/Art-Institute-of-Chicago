//
//  TabBarController.swift
//  Art Institute of Chicago
//
//  Created by Daria on 22.11.2023.
//photo.circle выбрано
//photo.circle не выбрано
//heart.circle выбрано
//heart.circle не выбрано
//book.circle выбрано
//book.circle не выбрано


import UIKit

enum Tabs: Int {
    case gallery
    case favorite
    case artic
}

final class TabBarController: UITabBarController {
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func configure() {
        tabBar.tintColor = UIColor(named:Resouces.Colors.pink)
        tabBar.unselectedItemTintColor = UIColor(named:Resouces.Colors.beige)
        tabBar.backgroundColor = UIColor(named:Resouces.Colors.dark)
        tabBar.layer.masksToBounds = true
        
        let galleryController = GalleryController()
        let favoriteController = FavoriteViewController()
        let articController = ArticViewController(apiArticManager: APIArticManager.shared)
        
        let galleryNavigation = NavBarController(rootViewController: galleryController)
        let favoriteNavigation = NavBarController(rootViewController: favoriteController)
        let articNavigation = NavBarController(rootViewController: articController)
        
        galleryController.tabBarItem = UITabBarItem(title: Resouces.Strings.TabBar.gallery,
                                                    image: UIImage(systemName: Resouces.Image.TabBar.gallery),
                                                    tag: Tabs.gallery.rawValue)
        
        favoriteController.tabBarItem = UITabBarItem(title: Resouces.Strings.TabBar.favorite,
                                                    image: UIImage(systemName: Resouces.Image.TabBar.favorite),
                                                    tag: Tabs.favorite.rawValue)
        
        articController.tabBarItem = UITabBarItem(title: Resouces.Strings.TabBar.artic,
                                                  image: UIImage(systemName: Resouces.Image.TabBar.artic),
                                                    tag: Tabs.artic.rawValue)
        
        setViewControllers([galleryController,favoriteController,articController], animated: false)
    }
}

