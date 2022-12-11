//
//  RemoteImage.swift
//  AiraloSampleProject
//
//  Created by zombie zyomka on 10.12.2022.
//

import Foundation

struct RemoteImage: Decodable {
    
    // MARK: - Properties
    
    var width: Int
    var height: Int
    var url: String
    
    static var image_preview: RemoteImage {
        RemoteImage(width: 100, height: 100, url: "https://cdn.airalo.com/images/9fba4c48-f9ad-4950-bf57-86c649c9a223.png")
    }
}
