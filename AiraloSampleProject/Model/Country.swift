//
//  Country.swift
//  AiraloSampleProject
//
//  Created by zombie zyomka on 11.12.2022.
//

import Foundation

struct Country: Decodable {
    
    // MARK: - Properties
    
    var id: Int
    var slug: String
    var title: String
    var image: RemoteImage
    
    
    // MARK: - Preview
    
    static func country_preview(for id: Int) -> Country {
        Country(
            id: id,
            slug: "united-states",
            title: "United States",
            image: RemoteImage.image_preview
        )
    }
}
