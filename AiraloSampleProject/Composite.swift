//
//  Coordinator.swift
//  AiraloSampleProject
//
//  Created by zombie zyomka on 10.12.2022.
//

import Foundation 

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
    
    private func regionRemoteService(for regionId: String) -> RemoteService<PackagesList, RegionRequestData> {
        let requestData = RegionRequestData(regionId: regionId)
        return RemoteService(requestValues: requestData)
    }
    
    
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
    
    func countryViewModel(for countryId: String) -> PackagesViewModel {
        let modelKey = "countryKey_" + countryId
        if let model = models[modelKey] as? PackagesViewModel { return model }
        else {
            let viewModel = PackagesViewModel()
            var remoteService: RemoteService<PackagesList, CountryRequestData>? = nil
            if let service = remoteServices[modelKey] as? RemoteService<PackagesList, CountryRequestData> {
                remoteService = service
            } else {
                remoteService = countryRemoteService(for: countryId)
                remoteServices[modelKey] = remoteService
            }
            
            if let remoteService {
                remoteService.getItems { packagesList in
                    viewModel.packages = packagesList.packages
                }
            }
            models[modelKey] = viewModel
            return viewModel
        }
    }
    
    func regionViewModel(for regionId: String) -> PackagesViewModel {
        let modelKey = "regionKey_" + regionId
        if let model = models[modelKey] as? PackagesViewModel { return model }
        else {
            let viewModel = PackagesViewModel()
            var remoteService: RemoteService<PackagesList, RegionRequestData>? = nil
            if let service = remoteServices[modelKey] as? RemoteService<PackagesList, RegionRequestData> {
                remoteService = service
            } else {
                remoteService = regionRemoteService(for: regionId)
                remoteServices[modelKey] = remoteService
            }
            
            if let remoteService {
                remoteService.getItems { packagesList in
                    viewModel.packages = packagesList.packages
                }
            }
            models[modelKey] = viewModel
            return viewModel
        }
    }
}
