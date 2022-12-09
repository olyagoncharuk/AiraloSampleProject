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
                    LocalView(viewModel: viewModel.localViewModel)
                case .regional:
                    RegionalView(viewModel: viewModel.regionalViewModel)
                case .global:
                    GlobalView(viewModel: viewModel.globalViewModel)
                }
            }
            Spacer()
        }
        .environmentObject(style)
        .padding()
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView(viewModel: MainViewModel())
    }
}
