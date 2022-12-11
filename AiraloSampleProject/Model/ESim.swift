//
//  ESim.swift
//  AiraloSampleProject
//
//  Created by zombie zyomka on 10.12.2022.
//

import Foundation

struct ESim: Decodable {
    
    // MARK: - Properties
    
    var slug: String
    var title: String
    var image: RemoteImage
}

extension ESim: ESimDescribable {
    
    var id: String {
        slug
    }
    
    var description: String {
        title
    }
    
    var imageURL: URL? {
        URL(string: image.url)
    }
}
