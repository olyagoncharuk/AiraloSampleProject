//
//  RegionalViewModel.swift
//  AiraloSampleProject
//
//  Created by zombie zyomka on 09.12.2022.
//

import Foundation

class RegionalViewModel<Item>: ObservableObject where Item: CustomStringConvertible {
    
    // MARK: - Properties
    
    @Published var items: [Item] = [Item]()
    
    var headerTitle: String = "Popular Countries"
    
    // MARK: - Initialization
    
    convenience init(items: [Item]) {
        self.init()
        self.items = items
    }
}
