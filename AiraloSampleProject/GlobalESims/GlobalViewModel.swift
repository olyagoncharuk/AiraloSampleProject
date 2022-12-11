//
//  RegionalViewModel.swift
//  AiraloSampleProject
//
//  Created by zombie zyomka on 09.12.2022.
//

import Foundation

class GlobalViewModel: ObservableObject {
    @Published var packages: [GlobalPackage] = []
}

//struct GlobalESim {
//
//
//    //Compose of other structs below
//}

struct Global: Decodable {
    var id: Int
    var packages: [GlobalPackage]
}

struct GlobalPackage: Decodable, Identifiable {
    
    var id: Int
    var data: String
    var validity: String
    var price: Double
    var opperator: Operator
    
    
    private enum CodingKeys : String, CodingKey {
        case id, data, validity, price, opperator = "operator", image
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(Int.self, forKey: .id)
        self.data = try container.decode(String.self, forKey: .data)
        self.validity = try container.decode(String.self, forKey: .validity)
        self.price = try container.decode(Double.self, forKey: .price)
        self.opperator = try container.decode(Operator.self, forKey: .opperator)
    }
    
    var color1: String {
        opperator.gradient_start
    }
    var color2: String {
        opperator.gradient_end
    }
}

struct Operator: Decodable {
    var title: String
    var gradient_start: String
    var gradient_end: String
    var image: RemoteImage
}
