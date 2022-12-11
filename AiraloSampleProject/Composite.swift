//
//  Coordinator.swift
//  AiraloSampleProject
//
//  Created by zombie zyomka on 10.12.2022.
//

import Foundation

class Composite {
    
    var localESimsRemoteService = RemoteService<[ESim], LocalESimRequestData>()
    var regionalESimsRemoteService = RemoteService<[ESim], RegionalESimRequestData>()
    var globalESimsRemoteService = RemoteService<Global, GlobalESimRequestData>()
    
    private var models = [String: AnyObject]()
    
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
    
    func globalViewModel() -> GlobalViewModel {
        if let model = models[SimTab.global.title] as? GlobalViewModel { return model }
        else {
            let viewModel = GlobalViewModel()
            globalESimsRemoteService.getItems { global in
                viewModel.packages = global.packages
            }
            models[SimTab.global.title] = viewModel
            return viewModel
        }
    }
}
