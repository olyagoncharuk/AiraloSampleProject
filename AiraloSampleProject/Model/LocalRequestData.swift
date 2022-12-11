//
//  LocalRequestData.swift
//  AiraloSampleProject
//
//  Created by zombie zyomka on 10.12.2022.
//

import Foundation

struct LocalESimRequestData: NetworkRequestable {
    
    typealias Body = [String: Codable]
    
    var urlStr: String {
        "https://www.airalo.com/api/v2/countries?type=popular"
    }
    
    var httpMethod: HttpMethod {
        HttpMethod.get
    }
    
    var headerFields: [String : String]? {
        ["Accept" : "application/json",
         "Accept-Language" : "en"]
    }
}
