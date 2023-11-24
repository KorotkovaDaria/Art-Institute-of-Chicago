//
//  Resouces.swift
//  Art Institute of Chicago
//
//  Created by Daria on 22.11.2023.
//

import UIKit
enum Resouces {
    enum Colors {
        static var beige = "Beige"
        static var beige2 = "Beige2"
        static var pink = "Pink"
        static var dark = "Dark"
    }
    // enum для таббара
    enum Strings {
        enum TabBar {
            static var gallery = "Gallery"
            static var favorite = "Favorite"
            static var artic = "Artic"
        }
    }
    
    enum Image {
        enum TabBar {
            static var gallery = "photo.circle"
            static var favorite = "heart.circle"
            static var artic = "book.circle"
        }
    }
    
    enum Fonts {
        static func emilea(with size: CGFloat) -> UIFont {
            UIFont(name: "Emilea", size: size) ?? UIFont()
        }
        static func montserratExtraBold (with size: CGFloat) -> UIFont {
            UIFont(name: "Montserrat-ExtraBold", size: size) ?? UIFont()
        }
        static func montserratBold(with size: CGFloat) -> UIFont {
            UIFont(name: "Montserrat-Bold", size: size) ?? UIFont()
        }
        static func montserratRegular(with size: CGFloat) -> UIFont {
            UIFont(name: "Montserrat-Regular", size: size) ?? UIFont()
        }
        static func montserratLight(with size: CGFloat) -> UIFont {
            UIFont(name: "Montserrat-Light", size: size) ?? UIFont()
        }
    }
}
