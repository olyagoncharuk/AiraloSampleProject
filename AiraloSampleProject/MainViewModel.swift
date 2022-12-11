//
//  MainViewModel.swift
//  AiraloSampleProject
//
//  Created by zombie zyomka on 09.12.2022.
//

import Foundation

class MainViewModel {
    
    // MARK: - Properties
    
    unowned var composite: Composite
    
    // MARK: - Initialization
    
    init(composite: Composite) {
        self.composite = composite
    }
    
    // MARK: - Public Interface
    
    var localViewModel: LocalViewModel<ESim> {
        composite.localViewModel()
    }
    
    var regionalViewModel: RegionalViewModel<ESim> {
        composite.regionalViewModel()
    }
    
    var globalViewModel: PackagesViewModel {
        composite.globalViewModel()
    }
    
    func packagesViewModel(forCountryId countryId: String) -> PackagesViewModel {
        composite.countryViewModel(for: countryId)
    }
    
    func packagesViewModel(forRegionId regionId: String) -> PackagesViewModel {
        composite.regionViewModel(for: regionId)
    }
    
}
