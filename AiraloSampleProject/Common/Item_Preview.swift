//
//  Item_Preview.swift
//  AiraloSampleProject
//
//  Created by zombie zyomka on 10.12.2022.
//

import Foundation

var preview_items = [Item_Preview(name: "Argentina", slug: "argentina"),
                     Item_Preview(name: "Canada", slug: "canada"),
                     Item_Preview(name: "China", slug: "china")]

class Item_Preview: ESimDescribable {
    
    var name: String
    
    var slug: String
    
    init(name: String, slug: String) {
        self.name = name
        self.slug = slug
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

