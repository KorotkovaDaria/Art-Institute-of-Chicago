//
//  SceneDelegate.swift
//  Art Institute of Chicago
//
//  Created by Daria on 22.11.2023.
//

import UIKit
class DependencyManager {
    static func createTabBarController() -> UIViewController {
        let tabBarController = TabBarController()
        return tabBarController
    }
}

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
               window = UIWindow(frame: windowScene.coordinateSpace.bounds)
               window?.windowScene = windowScene
               let tabBarController = DependencyManager.createTabBarController()
               window?.rootViewController = tabBarController
               window?.makeKeyAndVisible()
    }
}
