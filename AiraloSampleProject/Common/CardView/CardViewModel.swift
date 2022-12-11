//
//  CardViewModel.swift
//  AiraloSampleProject
//
//  Created by zombie zyomka on 11.12.2022.
//

import Foundation

class CardViewModel {
    var title: String //"Discover ..."
    var subtitle: String // "87 countries"
    var buyTitle: String
    var gradientColor1: String
    var gradientColor2: String
    var dataValue: String //"1 GB"
    var validityValue: String
    var imageURL: URL
    
    init(
        title: String,
        subtitle: String,
        buyTitle: String,
        gradientColor1: String,
        gradientColor2: String,
        dataValue: String,
        validityValue: String,
        imageURL: URL) {
            self.title = title
            self.subtitle = subtitle
            self.buyTitle = buyTitle
            self.gradientColor1 = gradientColor1
            self.gradientColor2 = gradientColor2
            self.dataValue = dataValue
            self.validityValue = validityValue
            self.imageURL = imageURL
    }
    
    static var model_preview: CardViewModel {
        CardViewModel(
            title: "Discover Global",
            subtitle: "87 Countries",
            buyTitle: "US$9 - BUY NOW",
            gradientColor1: "#07053F",
            gradientColor2: "#0988A3",
            dataValue: "1 GB",
            validityValue: "7 Days",
            imageURL: URL(string:"https://cdn.airalo.com/images/9fba4c48-f9ad-4950-bf57-86c649c9a223.png")!)
    }
    
}
