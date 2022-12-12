//
//  RegionalViewModel.swift
//  AiraloSampleProject
//
//  Created by zombie zyomka on 09.12.2022.
//

import Foundation

class RegionalViewModel<Item>: ViewModel {
   
    // MARK: - Properties
    
    @Published var items: [Item] = [Item]()
    
    @Published var errorDescription: String = ""
    
    var retryAction: (() -> Void)?
    
    var headerTitle: String = "Regions"
    
    var description: String {
        headerTitle
    }
    
    // MARK: - Initialization
    
    convenience init(items: [Item]) {
        self.init()
        self.items = items
    }
}
