//
//  HttpMethod.swift
//  AiraloSampleProject
//
//  Created by zombie zyomka on 10.12.2022.
//

import Foundation

import Foundation

public typealias HttpBody = [String : Codable]

public enum HttpMethod {
    case get
    case post(HttpBody)
    
    public var name: String {
        switch self {
        case .get: return "GET"
        case .post(_): return "POST"
        }
    }
    
    public var requestBody: Data? {
        guard case .post(let body) = self else { return nil }
        
        var  jsonData = NSData()
        
        do {
             jsonData = try JSONSerialization.data(withJSONObject: body,
                                                   options: .prettyPrinted) as NSData
        } catch {
            print(error.localizedDescription)
            return nil
        }
        
        return jsonData as Data
    }
}

