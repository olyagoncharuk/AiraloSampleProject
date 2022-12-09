//
//  LocalViewModel.swift
//  AiraloSampleProject
//
//  Created by zombie zyomka on 09.12.2022.
//

import Foundation

class LocalViewModel<Item>: ObservableObject where Item: CustomStringConvertible {
   
    @Published var items: [Item] = [Item]()
    
    var headerTitle: String = "Popular Countries"
    
    init(items: [Item]) {
        self.items = items
    }
}
