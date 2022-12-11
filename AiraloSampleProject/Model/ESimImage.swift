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
}
