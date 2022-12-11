//
//  MainView.swift
//  AiraloSampleProject
//
//  Created by zombie zyomka on 09.12.2022.
//

import SwiftUI

struct MainView: View {
    
    // MARK: - Properties
    
    let viewModel: MainViewModel
    let style = Style()
    @State var selectedTabIndex: SimTab = SimTab.local

    var tabs: [SimTab] = SimTab.allCases
    
    // MARK: - Body
    
    var body: some View {
        NavigationStack {
            VStack {
                VStack(alignment: .leading) {
                    Text("Hello")
                        .withFontColorStyle(style.helloStyling)
                    TopBarView(selectedTabIndex: $selectedTabIndex,
                               tabs: tabs)
                    
                }
                
                VStack {
                    switch selectedTabIndex {
                    case .local:
                        ESimListView(viewModel: viewModel.localViewModel) { countryId in
                            PackagesView(
                                viewModel: viewModel.packagesViewModel(
                                    forCountryId: countryId)
                            )
                        }
                    case .regional:
                        ESimListView(viewModel: viewModel.regionalViewModel) {
                            regionId in
                            PackagesView(viewModel: viewModel.packagesViewModel(forRegionId: regionId)
                            )
                        }
                    case .global:
                        PackagesView(viewModel: viewModel.globalViewModel)
                    }
                }
                Spacer()
            }
        }
        .environmentObject(style)
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView(viewModel: MainViewModel(composite: Composite()))
    }
}
