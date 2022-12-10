//
//  AiraloSampleProjectApp.swift
//  AiraloSampleProject
//
//  Created by zombie zyomka on 09.12.2022.
//

import SwiftUI

@main
struct AiraloSampleProjectApp: App {
    let mainViewModel = MainViewModel(composite: Composite())
    var body: some Scene {
        WindowGroup {
            MainView(viewModel: mainViewModel)
        }
    }
}
