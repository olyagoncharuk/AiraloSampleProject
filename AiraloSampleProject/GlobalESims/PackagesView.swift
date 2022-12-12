//
//  RegionalView.swift
//  AiraloSampleProject
//
//  Created by zombie zyomka on 09.12.2022.
//

import SwiftUI

struct PackagesView: View {
    
    @EnvironmentObject var style: Style
    
    // MARK: - Properties
    
    @ObservedObject var viewModel: PackagesViewModel
    
    // MARK: - Body
    
    var body: some View {
        if !viewModel.errorDescription.isEmpty {
            VStack(alignment: .center) {
                Text(viewModel.errorDescription)
                    .withFontColorStyle(style.errorStyle)
                    .multilineTextAlignment(.center)
                    .frame(width: 300)
                    .padding(.top)
                Text("Please, make sure you are online and tap Retry")
                    .withFontColorStyle(style.errorStyle)
                    .multilineTextAlignment(.center)
                    .frame(width: 300)
                    .padding(.bottom)
                Button {
                    if let retry = viewModel.retryAction {
                        retry()
                    }
                } label: {
                    Text("Retry")
                }
                .buttonStyle(.borderedProminent)
            }
        } else {
            List {
                Section {
                    ForEach(viewModel.packages) { package in
                        CardView(viewModel: viewModel.viewModel(for: package))
                            .listRowBackground(Color.clear)
                            .listRowSeparator(.hidden)
                    }
                }
            }
            .listStyle(.plain)
        }
        
    }
}

struct GlobalView_Previews: PreviewProvider {
    static var previews: some View {
        PackagesView(viewModel: PackagesViewModel(packages: packages_preview))
            .environmentObject(Style())
    }
}

var packages_preview = [
    Package.package_preview(id: 0),
    Package.package_preview(id: 1),
    Package.package_preview(id: 2)]
