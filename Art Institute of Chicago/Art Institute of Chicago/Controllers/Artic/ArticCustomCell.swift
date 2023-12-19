//
//  ArticCustomCell.swift
//  Art Institute of Chicago
//
//  Created by Daria on 23.11.2023.
//

import UIKit

class ArticCustomCell: UITableViewCell {
    //MARK: - UI Components
    var articImageBacground = UIImageView()
    var articLabel = UILabel()
  
    //MARK: - Initialization
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        // Добавление imageview и label в ячейку
        addSubview(articImageBacground)
        addSubview(articLabel)
        // Настройка просмотра articImageBacground
        articImageBacground.frame = CGRect(x: 0, y: 0, width: 330, height: 207)
        articImageBacground.contentMode = .scaleAspectFill
        articImageBacground.layer.cornerRadius = 10
        articImageBacground.layer.masksToBounds = true
        
        // Настройка метки для отображения articLabel
        articLabel.frame = CGRect(x: 25, y: 20, width: 305, height: 187)
        articLabel.font = UIFont(name: Resources.Fonts.montserratExtraBold, size: 24)
        articLabel.textColor = UIColor(named: Resources.Colors.beige)
        articLabel.numberOfLines = 0
        articLabel.lineBreakMode = .byWordWrapping
        articLabel.textAlignment = .left
        // Настройка цвета заднего фона ячейки
        self.backgroundColor = UIColor.clear
    }
    //MARK: - Required Initializer
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
