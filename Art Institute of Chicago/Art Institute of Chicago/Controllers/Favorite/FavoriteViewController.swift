//
//  FavoriteViewController.swift
//  Art Institute of Chicago
//
//  Created by Daria on 22.11.2023.
//

import UIKit

class FavoriteViewController: UIViewController {
    private var favoriteView = FavoriteView()
    
    override func loadView() {
        super.loadView()
        view = favoriteView
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

}
