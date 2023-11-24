//
//  BaseController.swift
//  Art Institute of Chicago
//
//  Created by Daria on 22.11.2023.
//

import UIKit
class BaseController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure()
    }
}

@objc extension BaseController {
    
    func addViews() {
        
    }
    
    func layoutviews() {
        
    }
   
    func configure() {
        view.backgroundColor = UIColor(named: Resouces.Colors.beige)
        
    }
   
}
