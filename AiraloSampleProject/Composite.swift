//
//  Coordinator.swift
//  AiraloSampleProject
//
//  Created by zombie zyomka on 10.12.2022.
//

import Foundation

class Composite {
    
    var localESimsRemoteService = RemoteService<[ESim], LocalESimRequestData>()
    var regionalESimsRemoteService = RemoteService<[ESim], LocalESimRequestData>()
    
    private var models = [String: AnyObject]()
    
    func localViewModel() -> LocalViewModel<ESim> {
        if let model = models["Local"] as? LocalViewModel<ESim> { return model }
        else {
            let viewModel = LocalViewModel<ESim>()
            localESimsRemoteService.getItems { esims in
                viewModel.items = esims
            }
            models["Local"] = viewModel
            return viewModel
        }
    }
    
    func regionalViewModel() -> RegionalViewModel<ESim> {
        if let model = models["Regional"] as? RegionalViewModel<ESim> { return model }
        else {
            let viewModel = RegionalViewModel<ESim>()
            regionalESimsRemoteService.getItems { esims in
                viewModel.items = esims
            }
            models["Local"] = viewModel
            return viewModel
        }
    }
}
