//
//  Package.swift
//  AiraloSampleProject
//
//  Created by zombie zyomka on 11.12.2022.
//

import Foundation

struct Package:  Identifiable {
    
    var id: Int
    var data: String
    var validity: String
    var price: Double
    fileprivate var opperator: Operator
    
    private enum CodingKeys : String, CodingKey {
        case id, data, validity, price, opperator = "operator", image
    }
    
    var title: String {
        opperator.title
    }
    
    var subTitle: String {
        "\(opperator.countries.count) Countries"
    }
    
    var color1: String {
        opperator.gradient_start
    }
    
    var color2: String {
        opperator.gradient_end
    }
    
    var imageURL: URL {
        URL(string: opperator.image.url)!
    }
    
}

extension Package: Decodable {
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(Int.self, forKey: .id)
        self.data = try container.decode(String.self, forKey: .data)
        self.validity = try container.decode(String.self, forKey: .validity)
        self.price = try container.decode(Double.self, forKey: .price)
        self.opperator = try container.decode(Operator.self, forKey: .opperator)
    }
    
    // MARK: - Preview
    
    static func package_preview(id: Int) -> Package {
        Package(
            id: id,
            data: "1 GB O",
            validity: "7 Days 0",
            price: 24,
            opperator: Operator.operator_preview
        )
    }
}

fileprivate struct Operator: Decodable {
    
    // MARK: - Properties
    
    var title: String
    var gradient_start: String
    var gradient_end: String
    var image: RemoteImage
    var countries: [Country]
    
    // MARK: - Preview
    
    static var operator_preview: Operator {
        Operator(
            title: "Discover Global O",
            gradient_start: "#07053F",
            gradient_end: "#0988A3",
            image: RemoteImage.image_preview,
            countries: [Country.country_preview(for: 0),
                        Country.country_preview(for: 1)
                       ]
        )
    }
}
