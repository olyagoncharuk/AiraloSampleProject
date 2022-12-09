//
//  MainViewModel.swift
//  AiraloSampleProject
//
//  Created by zombie zyomka on 09.12.2022.
//

import Foundation

class MainViewModel {
    
    // MARK: - Properties
    
    var localViewModel = LocalViewModel(items: preview_items)
    
    var regionalViewModel = RegionalViewModel()
    
    var globalViewModel = GlobalViewModel()
    
}
