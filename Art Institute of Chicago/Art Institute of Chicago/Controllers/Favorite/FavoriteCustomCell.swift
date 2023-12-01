//
//  FavoriteCustomCell.swift
//  Art Institute of Chicago
//
//  Created by Daria on 27.11.2023.
//

import UIKit

class FavoriteCustomCell: UITableViewCell {
    var favoriteImage = UIImageView()
    var favoriteArtistLabel = UILabel()
    var favoriteTitleLabel = UILabel()
  
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(favoriteImage)
        addSubview(favoriteArtistLabel)
        addSubview(favoriteTitleLabel)
        favoriteImage.frame = CGRect(x: 18, y: 0, width: 85, height: 53)
        favoriteImage.contentMode = .scaleAspectFill
        favoriteImage.layer.cornerRadius = 5
        favoriteImage.layer.masksToBounds = true
        
        favoriteArtistLabel.frame = CGRect(x: 117, y: 11, width: 257, height: 14)
        favoriteArtistLabel.font = UIFont(name: "Montserrat-Bold", size: 15)
        favoriteArtistLabel.textColor = UIColor(named: Resources.Colors.dark)
        favoriteArtistLabel.numberOfLines = 0
        favoriteArtistLabel.lineBreakMode = .byWordWrapping
        favoriteArtistLabel.textAlignment = .left
        
        favoriteTitleLabel.frame = CGRect(x: 117, y: 28, width: 257, height: 16)
        favoriteTitleLabel.font = UIFont(name: "Montserrat-Light", size: 11)
        favoriteTitleLabel.textColor = UIColor(named: Resources.Colors.dark)
        favoriteTitleLabel.numberOfLines = 0
        //favoriteTitleLabel.lineBreakMode = .byWordWrapping
        favoriteTitleLabel.textAlignment = .left
        
        self.backgroundColor = UIColor(named: Resources.Colors.beige2)
        self.layer.cornerRadius = 10
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
