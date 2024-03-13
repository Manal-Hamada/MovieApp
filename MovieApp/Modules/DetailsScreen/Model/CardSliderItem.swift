//
//  CardSliderItem.swift
//  MovieApp
//
//  Created by JETS Mobile Lab on 21/02/2024.
//

import Foundation
import CardSlider

struct CardItem:CardSliderItem {
    var description: String?
    var image: UIImage
    var rating: Int?
    var title: String
    var subtitle: String?
}
