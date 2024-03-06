//
//  SceneDelegate.swift
//  Art Institute of Chicago
//
//  Created by Daria on 22.11.2023.
//

import UIKit
class DependencyManager {
    static func createArticNC() -> UIViewController {
        let articVC = ArticVC()
        articVC.title = "Art Institute of Chicago"
        
        articVC.tabBarItem = UITabBarItem(title: nil, image: UIImage(systemName: Resources.Image.TabBar.artic), tag: 2)
        
        return UINavigationController(rootViewController: articVC)
    }
    
    static func createFavoriteNC() -> UIViewController{
        let favoriteVC = FavoriteVC()
        favoriteVC.title = "Art Institute of Chicago"
        favoriteVC.tabBarItem = UITabBarItem(title: nil, image: UIImage(systemName: Resources.Image.TabBar.favorite), tag: 1)
        
        return UINavigationController(rootViewController: favoriteVC)
    }
    
    static func createGalleryNC() -> UIViewController{
        let galleryVC = GalleryVC()
        galleryVC.title = "Art Institute of Chicago"
        galleryVC.tabBarItem = UITabBarItem(title: nil, image: UIImage(systemName: Resources.Image.TabBar.gallery), tag: 0)
        
        return UINavigationController(rootViewController: galleryVC)
    }

    
    static func createTabBarController() -> UITabBarController {
        let tabBar = UITabBarController()
        if #available(iOS 15, *) {
            // MARK: Navigation bar appearance
            let navigationBarAppearance = UINavigationBarAppearance()
            navigationBarAppearance.configureWithOpaqueBackground()
            navigationBarAppearance.titleTextAttributes = [
                NSAttributedString.Key.foregroundColor : UIColor(named: Resources.Colors.pink)!,
                NSAttributedString.Key.font: UIFont(name: Resources.Fonts.emilea, size: 26)!
            ]
            navigationBarAppearance.backgroundColor = UIColor(named: Resources.Colors.beige)
            UINavigationBar.appearance().standardAppearance = navigationBarAppearance
            UINavigationBar.appearance().compactAppearance = navigationBarAppearance
            UINavigationBar.appearance().scrollEdgeAppearance = navigationBarAppearance
            
            // MARK: Tab bar appearance
            let tabBarAppearance = UITabBarAppearance()
            tabBarAppearance.configureWithOpaqueBackground()
            tabBarAppearance.backgroundColor = UIColor(named: Resources.Colors.dark)
            UITabBar.appearance().scrollEdgeAppearance = tabBarAppearance
            UITabBar.appearance().standardAppearance = tabBarAppearance
            UITabBar.appearance().tintColor = UIColor(named: Resources.Colors.pink)
        }
        tabBar.viewControllers = [createGalleryNC(),createFavoriteNC(),createArticNC()]
        return tabBar
    }
}

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
               window = UIWindow(frame: windowScene.coordinateSpace.bounds)
               window?.windowScene = windowScene
               window?.rootViewController = DependencyManager.createTabBarController()
               window?.makeKeyAndVisible()
    }
}
