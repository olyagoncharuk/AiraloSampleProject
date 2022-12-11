//
//  Coordinator.swift
//  AiraloSampleProject
//
//  Created by zombie zyomka on 10.12.2022.
//

import Foundation

protocol CountryModelProvider {
    func countryViewModel(for countryId: String) -> PackagesViewModel
}
    

class Composite {
    
    private var models = [String: AnyObject]()
    private var remoteServices = [String: AnyObject]()
    
    private var localESimsRemoteService = RemoteService<[ESim], LocalESimRequestData>(requestValues: LocalESimRequestData())
    private var regionalESimsRemoteService = RemoteService<[ESim], RegionalESimRequestData>(requestValues: RegionalESimRequestData())
    private var globalESimsRemoteService = RemoteService<PackagesList, GlobalESimRequestData>(requestValues: GlobalESimRequestData())
    
    private func countryRemoteService(for countryId: String) -> RemoteService<PackagesList, CountryRequestData> {
        let requestData = CountryRequestData(countryId: countryId)
        return RemoteService(requestValues: requestData)
    }
    
    // should be region
    //    private func countryRemoteService(for slug: String) -> CountryRequestData {
    //        CountryRequestData(countryId: slug)
    //    }
    //
    
    
    func localViewModel() -> LocalViewModel<ESim> {
        if let model = models[SimTab.local.title] as? LocalViewModel<ESim> { return model }
        else {
            let viewModel = LocalViewModel<ESim>()
            localESimsRemoteService.getItems { esims in
                viewModel.items = esims
            }
            models[SimTab.local.title] = viewModel
            return viewModel
        }
    }
    
    func regionalViewModel() -> RegionalViewModel<ESim> {
        if let model = models[SimTab.regional.title] as? RegionalViewModel<ESim> { return model }
        else {
            let viewModel = RegionalViewModel<ESim>()
            regionalESimsRemoteService.getItems { esims in
                viewModel.items = esims
            }
            models[SimTab.regional.title] = viewModel
            return viewModel
        }
    }
    
    func globalViewModel() -> PackagesViewModel {
        if let model = models[SimTab.global.title] as? PackagesViewModel { return model }
        else {
            let viewModel = PackagesViewModel()
            globalESimsRemoteService.getItems { packagesList in
                viewModel.packages = packagesList.packages
            }
            models[SimTab.global.title] = viewModel
            return viewModel
        }
    }
    
}

extension Composite: CountryModelProvider {
    
    func countryViewModel(for countryId: String) -> PackagesViewModel {
        if let model = models[countryId] as? PackagesViewModel { return model }
        else {
            let viewModel = PackagesViewModel()
            var remoteService: RemoteService<PackagesList, CountryRequestData>? = nil
            if let service = remoteServices[countryId] as? RemoteService<PackagesList, CountryRequestData> {
                remoteService = service
            } else {
                remoteService = countryRemoteService(for: countryId)
                remoteServices[countryId] = remoteService
            }
            
            if let remoteService {
                remoteService.getItems { packagesList in
                    viewModel.packages = packagesList.packages
                }
            }
            models[SimTab.global.title] = viewModel
            return viewModel
        }
    }
}
