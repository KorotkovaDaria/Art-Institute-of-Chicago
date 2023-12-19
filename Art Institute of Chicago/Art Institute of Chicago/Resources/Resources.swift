//
//  Resouces.swift
//  Art Institute of Chicago
//
//  Created by Daria on 22.11.2023.
//

import UIKit

enum Resources {
    // Enum для названий кастомных цветов
    enum Colors {
        static var beige = "Beige"
        static var beige2 = "Beige2"
        static var pink = "Pink"
        static var dark = "Dark"
    }
    // Enum для tab bar
    enum Strings {
        enum TabBar {
            static var gallery = "Gallery"
            static var favorite = "Favorite"
            static var artic = "Artic"
        }
    }
    // Enum для tab bar system image
    enum Image {
        enum TabBar {
            static var gallery = "photo.circle"
            static var favorite = "heart.circle"
            static var artic = "book.circle"
        }
        enum SystemIcon {
            static var backButton = "arrowshape.backward.circle.fill"
        }
    }
    // Enum шрифты
    enum Fonts {
        static var emilea = "Emilea"
        static var montserratExtraBold = "Montserrat-ExtraBold"
        static var montserratBold = "Montserrat-Bold"
        static var montserratRegular = "Montserrat-Regular"
        static var montserratLight = "Montserrat-Light"
    }
}
