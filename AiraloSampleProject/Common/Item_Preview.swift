//
//  Item_Preview.swift
//  AiraloSampleProject
//
//  Created by zombie zyomka on 10.12.2022.
//

import Foundation

var preview_items = [Item_Preview(name: "Argentina"),
                     Item_Preview(name: "Canada"),
                     Item_Preview(name: "China")]

class Item_Preview: ESimDescribable {
    
    var name: String
    
    init(name: String) {
        self.name = name
    }
    
    var id: String {
        name
    }
    
    var description: String {
        name
    }
    
    var imageURL: URL? {
        nil
    }
}

