//
//  NavBarController.swift
//  Art Institute of Chicago
//
//  Created by Daria on 22.11.2023.
//

import UIKit

final class NavBarController: UINavigationController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure()
    }
    
    private func configure() {
        view.backgroundColor = UIColor(named:Resouces.Colors.beige)
        navigationBar.isTranslucent = false
        navigationBar.standardAppearance.titleTextAttributes = [
            .foregroundColor: UIColor(named: Resouces.Colors.pink) ?? UIColor.clear,
            .font: Resouces.Fonts.emilea(with: 26)
        ]
    }
}
