//
//  ArticCustomCell.swift
//  Art Institute of Chicago
//
//  Created by Daria on 23.11.2023.
//

import UIKit

class ArticCustomCell: UITableViewCell {
    var articImageBacground = UIImageView()
    var articLabel = UILabel()
  
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(articImageBacground)
        addSubview(articLabel)
        articImageBacground.frame = CGRect(x: 0, y: 0, width: 330, height: 207)
        articImageBacground.contentMode = .scaleAspectFill
        articImageBacground.layer.cornerRadius = 10
        articImageBacground.layer.masksToBounds = true
        
        articLabel.frame = CGRect(x: 25, y: 20, width: 305, height: 187)
        articLabel.font = UIFont(name: "Montserrat-ExtraBold", size: 24)
        articLabel.textColor = UIColor(named: Resouces.Colors.beige)
        articLabel.numberOfLines = 0
        articLabel.lineBreakMode = .byWordWrapping
        articLabel.textAlignment = .left
        
        self.backgroundColor = UIColor.clear
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
