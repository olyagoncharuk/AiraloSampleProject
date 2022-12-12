//
//  Coordinator.swift
//  AiraloSampleProject
//
//  Created by zombie zyomka on 10.12.2022.
//

import Foundation 

class Composite: ObservableObject {
    
    // MARK: - Properties
    
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
    
    private func save(model: AnyObject, forKey key: String) {
        models[key] = model
    }
    
    private func save(service: AnyObject, forKey key: String) {
        remoteServices[key] = service
    }
    
    
    // MARK: - Public Interface
    
    public func localViewModel() -> LocalViewModel<ESim> {
        if let model = models[SimTab.local.title] as? LocalViewModel<ESim> { return model }
        else {
            let viewModel = LocalViewModel<ESim>()
            
            let getItemsResult: (RemoteServiceResult<[ESim]>) -> Void = { [weak self] result in
                switch result {
                case .success(let esims):
                    viewModel.items = esims
                    viewModel.errorDescription = ""
                    self?.save(model: viewModel, forKey: SimTab.local.title)
                case .failure(let error):
                    viewModel.errorDescription = error.localizedDescription
                }
            }
            
            localESimsRemoteService.getItems(completion: getItemsResult)
            
            viewModel.retryAction = { [weak self] in
                self?.localESimsRemoteService.getItems(completion: getItemsResult)
            }
            
            return viewModel
        }
    }
    
    public func regionalViewModel() -> RegionalViewModel<ESim> {
        if let model = models[SimTab.regional.title] as? RegionalViewModel<ESim> { return model }
        else {
            let viewModel = RegionalViewModel<ESim>()
            
            let getItemsResult: (RemoteServiceResult<[ESim]>) -> Void = { [weak self] result in
                switch result {
                case .success(let esims):
                    viewModel.items = esims
                    viewModel.errorDescription = ""
                    self?.save(model: viewModel, forKey: SimTab.regional.title)
                case .failure(let error):
                    viewModel.errorDescription = error.localizedDescription
                }
            }
            
            regionalESimsRemoteService.getItems(completion: getItemsResult)
            
            viewModel.retryAction = { [weak self] in
                self?.regionalESimsRemoteService.getItems(completion: getItemsResult)
            }
            
            return viewModel
        }
    }
    
    public func globalViewModel() -> PackagesViewModel {
        if let model = models[SimTab.global.title] as? PackagesViewModel { return model }
        else {
            let viewModel = PackagesViewModel()
            globalESimsRemoteService.getItems { [weak self] result in
                switch result {
                case .success(let packagesList):
                    viewModel.packages = packagesList.packages
                    viewModel.errorDescription = ""
                    self?.save(model: viewModel, forKey: SimTab.global.title)
                case .failure(let error):
                    viewModel.errorDescription = error.localizedDescription
                }
            }
            
            return viewModel
        }
    }
    
    public func countryViewModel(for countryId: String) -> PackagesViewModel {
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
                remoteService.getItems { [weak self] result in
                    switch result {
                    case .success(let packagesList):
                        viewModel.packages = packagesList.packages
                        viewModel.errorDescription = ""
                        self?.save(model: viewModel, forKey: modelKey)
                    case .failure(let error):
                        viewModel.errorDescription = error.localizedDescription
                    }
                }
            }
            
            return viewModel
        }
    }
    
    public func regionViewModel(for regionId: String) -> PackagesViewModel {
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
                remoteService.getItems { [weak self] result in
                    switch result {
                    case .success(let packagesList):
                        viewModel.packages = packagesList.packages
                        viewModel.errorDescription = ""
                        self?.save(model: viewModel, forKey: modelKey)
                    case .failure(let error):
                        viewModel.errorDescription = error.localizedDescription
                    }
                }
            }
            
            return viewModel
        }
    }
}
