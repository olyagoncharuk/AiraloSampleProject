//
//  LocalViewModel.swift
//  AiraloSampleProject
//
//  Created by zombie zyomka on 09.12.2022.
//

import Foundation

class LocalViewModel<Item>: ViewModel {
    
    // MARK: - Properties
   
    @Published var items: [Item] = []
    
    @Published var errorDescription: String = ""
    
    var headerTitle: String = "Popular Countries"
    
    var description: String {
        headerTitle
    }
    
    // MARK: - Initialization
    
    convenience init(items: [Item]) {
        self.init()
        self.items = items
    }
}
